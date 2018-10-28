unit uCalculadora;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Layouts;

type
  TfrmCalculadora = class(TForm)
    dividir: TButton;
    multiplicar: TButton;
    limpar: TButton;
    um: TButton;
    dois: TButton;
    tres: TButton;
    mais: TButton;
    quatro: TButton;
    quinto: TButton;
    seis: TButton;
    sete: TButton;
    oito: TButton;
    nove: TButton;
    zero: TButton;
    virgula: TButton;
    menos: TButton;
    igual: TButton;
    lytBase: TLayout;
    Layout1: TLayout;
    visor: TEdit;
    procedure umClick(Sender: TObject);
    procedure doisClick(Sender: TObject);
    procedure tresClick(Sender: TObject);
    procedure quatroClick(Sender: TObject);
    procedure quintoClick(Sender: TObject);
    procedure seisClick(Sender: TObject);
    procedure seteClick(Sender: TObject);
    procedure oitoClick(Sender: TObject);
    procedure noveClick(Sender: TObject);
    procedure zeroClick(Sender: TObject);
    procedure limparClick(Sender: TObject);
    procedure maisClick(Sender: TObject);
    procedure menosClick(Sender: TObject);
    procedure multiplicarClick(Sender: TObject);
    procedure dividirClick(Sender: TObject);
    procedure igualClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculadora: TfrmCalculadora;
  valor1 : real;
  valor2 : real;
  funcao : integer;

implementation

{$R *.fmx}

procedure TfrmCalculadora.dividirClick(Sender: TObject);
begin
  valor1 := StrToFloat(visor.Text);
  visor.Text := '';
  funcao := 4;
end;

procedure TfrmCalculadora.doisClick(Sender: TObject);
begin
  visor.Text := visor.Text + (Sender as TButton).Text;
end;

procedure TfrmCalculadora.igualClick(Sender: TObject);
var
  soma : real;
begin
  valor2:=StrToFloat(visor.Text);
  case (funcao) of
  1:
  begin
    soma:=valor1+valor2;
    visor.text:=FloatToStr(soma);
  end;
  2:
  begin
    soma:=valor1-valor2;
    visor.text:=FloatToStr(soma);
  end;
  3:
  begin
    soma:=valor1*valor2;
    visor.text:=FloatToStr(soma);
  end;
  4:
  begin
    if(valor2<>0)then
    begin
      soma:=valor1/valor2;
      visor.text:=FloatToStr(soma);
    end

  else
    begin
      SHowMessage('Divisão por zero!!');
      visor.Text:='ERRO';
    end
  end
end;  //finaliza o  case
end;

procedure TfrmCalculadora.limparClick(Sender: TObject);
begin
  visor.Text := '';
end;

procedure TfrmCalculadora.maisClick(Sender: TObject);
begin
  valor1 := StrToFloat(visor.Text);
  visor.Text := '';
  funcao := 1;
end;

procedure TfrmCalculadora.menosClick(Sender: TObject);
begin
  valor1 := StrToFloat(visor.Text);
  visor.Text := '';
  funcao := 2;
end;

procedure TfrmCalculadora.multiplicarClick(Sender: TObject);
begin
  valor1 := StrToFloat(visor.Text);
  visor.Text := '';
  funcao := 3;
end;

procedure TfrmCalculadora.noveClick(Sender: TObject);
begin
  visor.Text := visor.Text + (Sender as TButton).Text;
end;

procedure TfrmCalculadora.oitoClick(Sender: TObject);
begin
  visor.Text := visor.Text + (Sender as TButton).Text;
end;

procedure TfrmCalculadora.quatroClick(Sender: TObject);
begin
  visor.Text := visor.Text + (Sender as TButton).Text;
end;

procedure TfrmCalculadora.quintoClick(Sender: TObject);
begin
  visor.Text := visor.Text + (Sender as TButton).Text;
end;

procedure TfrmCalculadora.seisClick(Sender: TObject);
begin
  visor.Text := visor.Text + (Sender as TButton).Text;
end;

procedure TfrmCalculadora.seteClick(Sender: TObject);
begin
  visor.Text := visor.Text + (Sender as TButton).Text;
end;

procedure TfrmCalculadora.tresClick(Sender: TObject);
begin
  visor.Text := visor.Text + (Sender as TButton).Text;
end;

procedure TfrmCalculadora.umClick(Sender: TObject);
begin
  visor.Text := visor.Text + (Sender as TButton).Text;
end;

procedure TfrmCalculadora.zeroClick(Sender: TObject);
begin
  visor.Text := visor.Text + (Sender as TButton).Text;
end;

end.
