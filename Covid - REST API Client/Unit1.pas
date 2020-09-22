unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  Vcl.ComCtrls, REST.Response.Adapter, Vcl.ExtCtrls, Vcl.StdCtrls, System.Rtti,
  System.Bindings.Outputs, Data.Bind.EngExt, Vcl.Bind.DBEngExt, StrUtils,
  Vcl.OleCtrls, SHDocVw, System.JSON;

type
  TForm1 = class(TForm)
    RESTCountries: TRESTRequest;
    RESTClient: TRESTClient;
    FDMemTable1: TFDMemTable;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    RESTResponse1: TRESTResponse;
    leftMenu: TPanel;
    RESTAll: TRESTRequest;
    globalCases: TPanel;
    Label1: TLabel;
    lblQtdTotalCasos: TLabel;
    casesByCountries: TPanel;
    ListView1: TListView;
    Label2: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    lblTitulo: TLabel;
    lastUpdate: TPanel;
    lblUltimaAtt: TLabel;
    WebBrowser1: TWebBrowser;
    RESTHistorical: TRESTRequest;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure webbrowserstart;
  private
    procedure qtdCasosPorPaises();
    procedure dadosGerais();
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);

begin

  qtdCasosPorPaises();
  dadosGerais();
  webbrowserstart();

end;

procedure TForm1.qtdCasosPorPaises();
var
  i: Integer;
  Item: TListItem;

begin

  RESTCountries.Execute;

  if RESTResponse1.StatusCode = 200 then
  begin

    for i := 0 to FDMemTable1.RecordCount - 1 do
    begin

      Item := ListView1.Items.Add;
      Item.Caption := FDMemTable1.FieldByName('cases').AsString;
      Item.SubItems.Add(FDMemTable1.FieldByName('country').AsString);

      FDMemTable1.Next;

    end;

  end;
End;

procedure TForm1.dadosGerais();
begin
  RESTAll.Execute;
  lblQtdTotalCasos.Caption := FDMemTable1.FieldByName('cases').AsString;
  lblUltimaAtt.Caption := FDMemTable1.FieldByName('updated').AsString;
End;

procedure TForm1.webbrowserstart;
var

  html: TStringList;

  labels: string;
  values: string;

  htmlGraph: string;
  i: Integer;
  casos: string;

  fmt: TFormatSettings;
  dateFormated: string;

begin

  RESTHistorical.Execute;

  if RESTResponse1.StatusCode = 200 then
  begin

    RESTResponseDataSetAdapter1.RootElement := 'cases';

    fmt.ShortDateFormat := 'm/d/y';
    fmt.DateSeparator   := '/';

    for i := 0 to FDMemTable1.FieldCount - 1 do
    begin
      //ShowMessage(FormatDateTime('dd/mm', StrToDateTime(FDMemTable1.Fields[i].FieldName, fmt)));
      labels := labels + '"' + FormatDateTime('dd/mm', StrToDateTime(FDMemTable1.Fields[i].FieldName, fmt)) + '", ';
      values := values + '"' + FDMemTable1.Fields[i].AsString + '", ';
    end;

    htmlGraph := '<script>' +
      'new Chart("doughnut-chart",' +
      '{' +
      '    type: "bar", ' +
      '    data: ' +
      '    {' +
      '      labels: [' + labels + '],' +
      '      datasets: ' +
      '      [' +
      '        {' +
      '          data: [' + values + '],' +
      '          borderColor: "orange",' +
      '          backgroundColor: "orange",' +
      '          label: "Casos",' +
      '        }' +
      '      ]' +
      '    }' +
      '});' +
      '</script>';

    //O ideal seria utilizar apenas essa fun��o, mas estou com problemas para utilizar a library FMX.WebBrowser
    // WebBrowser1.EvaluateJavaScript(htmlGraph);

    html := TStringList.Create;
    try
      html.LoadFromFile('../../charts/index.html');
      html.Delete(html.Count-1);
      html.Add(htmlGraph);
    finally
      html.SaveToFile('../../charts/index.html');
      html.Free;
      WebBrowser1.Navigate('file:\\\' + GetCurrentDir +
        '\..\..\charts\index.html');
    end;

  end;
end;

end.
