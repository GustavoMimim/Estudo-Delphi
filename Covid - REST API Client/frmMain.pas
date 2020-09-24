unit frmMain;

interface

uses
  frmSplashScreen, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  Vcl.ComCtrls, REST.Response.Adapter, Vcl.ExtCtrls, Vcl.StdCtrls, System.Rtti,
  System.Bindings.Outputs, Data.Bind.EngExt, Vcl.Bind.DBEngExt, StrUtils, SHDocVw,
  Vcl.OleCtrls, Vcl.Bind.Editors, Data.Bind.DBScope, Vcl.Imaging.pngimage;

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
    lblGlobalCases: TLabel;
    casesByCountries: TPanel;
    lstCountries: TListView;
    lblTitleCasesByCountry: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    lblTitle: TLabel;
    lastUpdate: TPanel;
    lblLastUpdate: TLabel;
    WebBrowser: TWebBrowser;
    RESTHistorical: TRESTRequest;
    lblTitleLastUpdate: TLabel;
    lblTitleGlobalCases: TLabel;
    Image1: TImage;
    Label1: TLabel;
    RESTSpecificHistoricalCountry: TRESTRequest;
    procedure FormCreate(Sender: TObject);
    procedure lstCountriesAdvancedCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure Label1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure searchData();
    procedure atualizarDados();
    procedure searchCountriesAndCases();
    procedure searchGeneralData();
    procedure createMainChart();
    function dateUSAtoBR(date: string): string;
    procedure lstCountriesClick(Sender: TObject);
    procedure createChart(labels: string; values: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  indexCountrySelected: Integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin

  searchData();

end;

procedure TForm1.Image1Click(Sender: TObject);
begin

  atualizarDados();

end;

procedure TForm1.atualizarDados();
begin

  try
    SplashScreen.Show;

    searchData();

    SplashScreen.Hide;

  finally

    //SplashScreen.Free;

  end;

end;

procedure TForm1.searchData();
begin

  searchCountriesAndCases();
  searchGeneralData();
  createMainChart();
  SplashScreen.Completed := true;

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

  atualizarDados();

end;

procedure TForm1.lstCountriesAdvancedCustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin

    Sender.Canvas.Font.Color := $00BDBDBD;

end;

procedure TForm1.lstCountriesClick(Sender: TObject);
var
  labels: string;
  values: string;

  resource: string;

  i: Integer;

begin

  if indexCountrySelected = lstCountries.Selected.Index then
  begin
    lstCountries.ClearSelection;
    createMainChart();
  end;

  indexCountrySelected := lstCountries.Selected.Index;

  RESTResponse1.CleanupInstance;
  RESTResponseDataSetAdapter1.CleanupInstance;

  resource := 'v3/covid-19/historical/' + lstCountries.Selected.SubItems[0];

  RESTSpecificHistoricalCountry.Resource := resource;

  RESTSpecificHistoricalCountry.Execute;

  if RESTResponse1.StatusCode = 200 then
  begin

    RESTResponseDataSetAdapter1.RootElement := 'timeline.cases';

    for i := 0 to FDMemTable1.FieldCount - 1 do
    begin
      //ShowMessage(FormatDateTime('dd/mm', StrToDateTime(FDMemTable1.Fields[i].FieldName, fmt)));
      // O ideal seria utilizar o Format acima, mas por algum motivo ele só está funcionando com o ShowMessage

      labels := labels + '"' + dateUSAtoBR(FDMemTable1.Fields[i].FieldName) + '", ';
      values := values + '"' + FDMemTable1.Fields[i].AsString + '", ';
    end;

    createChart(labels,values);

  end
  else
  begin

    labels := '';
    values := '';
    createChart(labels,values);

    ShowMessage('Não foi encontrado o histórico de casos do país selecionado.');

  end;


end;

procedure TForm1.searchCountriesAndCases();
var
  i: Integer;
  Item: TListItem;

begin

  RESTResponse1.CleanupInstance;
  RESTResponseDataSetAdapter1.CleanupInstance;

  RESTCountries.Execute;

  if RESTResponse1.StatusCode = 200 then
  begin

    lstCountries.Clear;

    for i := 0 to FDMemTable1.RecordCount - 1 do
    begin

      Item := lstCountries.Items.Add;
      Item.Caption := FormatFloat('#,###', StrToFloat(FDMemTable1.FieldByName('cases').AsString));
      Item.SubItems.Add(FDMemTable1.FieldByName('country').AsString);

      FDMemTable1.Next;

    end;

  end;
End;

procedure TForm1.searchGeneralData();
begin
  RESTAll.Execute;
  lblGlobalCases.Caption := FormatFloat('#,###', StrToFloat(FDMemTable1.FieldByName('cases').AsString));
  lblLastUpdate.Caption := FDMemTable1.FieldByName('updated').AsString;
End;

procedure TForm1.createMainChart;
var
  labels: string;
  values: string;

  i: Integer;

begin

  RESTResponseDataSetAdapter1.ClearDataSet;

  RESTHistorical.Execute;

  if RESTResponse1.StatusCode = 200 then
  begin

    RESTResponseDataSetAdapter1.RootElement := 'cases';

    for i := 0 to FDMemTable1.FieldCount - 1 do
    begin
      //ShowMessage(FormatDateTime('dd/mm', StrToDateTime(FDMemTable1.Fields[i].FieldName, fmt)));
      // O ideal seria utilizar o Format acima, mas por algum motivo ele só está funcionando com o ShowMessage

      labels := labels + '"' + dateUSAtoBR(FDMemTable1.Fields[i].FieldName) + '", ';
      values := values + '"' + FDMemTable1.Fields[i].AsString + '", ';
    end;

    createChart(labels,values);

  end;
end;

procedure TForm1.createChart(labels: string; values: string);
var
  html: TStringList;
  htmlChart: string;

begin

    htmlChart := '<script>' +
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

    //O ideal seria utilizar apenas essa função, mas estou com problemas para utilizar a library FMX.WebBrowser
    // WebBrowser1.EvaluateJavaScript(htmlGraph);

    html := TStringList.Create;
    try
      html.LoadFromFile('../../charts/index.html');
      html.Delete(html.Count - 1);
      html.Add(htmlChart);
    finally
      html.SaveToFile('../../charts/index.html');
      html.Free;
      WebBrowser.Navigate('file:\\\' + GetCurrentDir +
        '\..\..\charts\index.html');
    end;

end;

{ Converte data no formato m/d/yy para dd/mm }
function TForm1.dateUSAtoBR(date: string): string;
var
  posBarra1: Integer;
  posBarra2: Integer;
  month: Integer;
  day: Integer;

begin

    posBarra1 := Pos('/', date);
    posBarra2 := Pos('/', Copy(date, posBarra1 + 1, Length(date)));

    day := StrToInt(Copy(date, posBarra1 + 1, posBarra2 - 1));
    month := StrToInt(Copy(date, 0, posBarra1 - 1));

    Result := Format('%.2d', [day]) + '/' + Format('%.2d', [month]);

end;

end.
