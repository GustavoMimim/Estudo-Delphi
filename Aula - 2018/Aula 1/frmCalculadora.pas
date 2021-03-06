unit frmCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFom1 = class(TForm)
    um: TSpeedButton;
    dois: TSpeedButton;
    tres: TSpeedButton;
    quatro: TSpeedButton;
    cinco: TSpeedButton;
    seis: TSpeedButton;
    virgula: TSpeedButton;
    zero: TSpeedButton;
    multiplicar: TSpeedButton;
    maismenos: TSpeedButton;
    dividir: TSpeedButton;
    menos: TSpeedButton;
    igual: TSpeedButton;
    sete: TSpeedButton;
    oito: TSpeedButton;
    nove: TSpeedButton;
    limpar: TSpeedButton;
    mais: TSpeedButton;
    visor: TEdit;
    procedure umClick(Sender: TObject);
    procedure doisClick(Sender: TObject);
    procedure tresClick(Sender: TObject);
    procedure quatroClick(Sender: TObject);
    procedure cincoClick(Sender: TObject);
    procedure seisClick(Sender: TObject);
    procedure seteClick(Sender: TObject);
    procedure oitoClick(Sender: TObject);
    procedure noveClick(Sender: TObject);
    procedure maisClick(Sender: TObject);
    procedure menosClick(Sender: TObject);
    procedure maismenosClick(Sender: TObject);
    procedure virgulaClick(Sender: TObject);
    procedure igualClick(Sender: TObject);
    procedure dividirClick(Sender: TObject);
    procedure multiplicarClick(Sender: TObject);
    procedure zeroClick(Sender: TObject);
    procedure limparClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  // DECLARA VARI�VEIS
  Fom1: TFom1;
  valor1: real;
  valor2: real;
  funcao: integer;

  {

    <>   Diferente
    :    Tipo
    =    Compara
    :=   Recebe

  }

implementation

{$R *.dfm}

procedure TFom1.cincoClick(Sender: TObject);
begin
  // QUANDO CLICAR NO BOT�O CINCO, EXIBE NO VISOR
  visor.Text := visor.Text + (Sender as TSpeedButton).Caption;

end;

procedure TFom1.dividirClick(Sender: TObject);
begin
  valor1 := StrToFloat(visor.Text);
  visor.Text := '';
  funcao := 3;
end;

procedure TFom1.doisClick(Sender: TObject);
begin

  visor.Text := visor.Text + (Sender as TSpeedButton).Caption;

end;

procedure TFom1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //PERMITE QUE SEJ� DIGITADO OS N�MEROS
  if (Key = VK_NUMPAD1) then
    um.Click;
  if (Key = VK_NUMPAD2) then
    dois.Click;
  if (Key = VK_NUMPAD3) then
    tres.Click;
  if (Key = VK_NUMPAD4) then
    quatro.Click;
  if (Key = VK_NUMPAD5) then
    cinco.Click;
  if (Key = VK_NUMPAD6) then
    seis.Click;
  if (Key = VK_NUMPAD7) then
    sete.Click;
  if (Key = VK_NUMPAD8) then
    oito.Click;
  if (Key = VK_NUMPAD9) then
    nove.Click;
  if (Key = VK_NUMPAD0) then
    zero.Click;
  //PERMITE QYE SEJ� DIGITADO OS SIMBOLOS
  if (Key = VK_ADD) then
    mais.Click;
  if (Key = VK_SUBTRACT) then
    menos.Click;
  if (Key = VK_MULTIPLY) then
    multiplicar.Click;
  if (Key = VK_DIVIDE) then
    dividir.Click;
  if (Key = VK_RETURN) then
    igual.Click;
  if (Key = VK_DECIMAL) then
    virgula.Click;
  if (Key = VK_DELETE) then
    limpar.Click;

end;

procedure TFom1.igualClick(Sender: TObject);
var
  soma: real;
begin
  valor2 := StrToFloat(visor.Text);
  case (funcao) of
    1:
      begin
        soma := valor1 + valor2;
        visor.Text := FloatToStr(soma);
      end;
    2:
      begin
        soma := valor1 - valor2;
        visor.Text := FloatToStr(soma);
      end;
    3:
      begin
        //EFETUA O C�LCULO A MENOS QUE O USU�RIO DESEJ� DIVIDIR POR 0
        if (valor2 <> 0) then
        begin
          soma := valor1 / valor2;
          visor.Text := FloatToStr(soma);
        end
        else
        begin
          visor.Text := 'Erro: Divis�o por Zero';
          //ShowMessage('Divis�o por Zero');
        end;
      end;
    4:
      begin
        soma := valor1 * valor2;
        visor.Text := FloatToStr(soma);
      end;
  end;
end;

procedure TFom1.limparClick(Sender: TObject);
begin

  visor.Text := '';

end;

procedure TFom1.maisClick(Sender: TObject);
begin
  // TRANSFORMA A STRING DO VISOR EM FLOAT
  valor1 := StrToFloat(visor.Text);
  // LIMPA O VISOR
  visor.Text := '';
  funcao := 1;

end;

procedure TFom1.maismenosClick(Sender: TObject);
begin

  visor.Text := '-' + visor.Text;

end;

procedure TFom1.menosClick(Sender: TObject);
begin

  valor1 := StrToFloat(visor.Text);
  visor.Text := '';
  funcao := 2;

end;

procedure TFom1.multiplicarClick(Sender: TObject);
begin

  valor1 := StrToFloat(visor.Text);
  visor.Text := '';
  funcao := 4;

end;

procedure TFom1.noveClick(Sender: TObject);
begin

  visor.Text := visor.Text + (Sender as TSpeedButton).Caption;

end;

procedure TFom1.oitoClick(Sender: TObject);
begin

  visor.Text := visor.Text + (Sender as TSpeedButton).Caption;

end;

procedure TFom1.quatroClick(Sender: TObject);
begin

  visor.Text := visor.Text + (Sender as TSpeedButton).Caption;

end;

procedure TFom1.seisClick(Sender: TObject);
begin

  visor.Text := visor.Text + (Sender as TSpeedButton).Caption;

end;

procedure TFom1.seteClick(Sender: TObject);
begin

  visor.Text := visor.Text + (Sender as TSpeedButton).Caption;

end;

procedure TFom1.tresClick(Sender: TObject);
begin

  visor.Text := visor.Text + (Sender as TSpeedButton).Caption;

end;

procedure TFom1.umClick(Sender: TObject);
begin

  visor.Text := visor.Text + (Sender as TSpeedButton).Caption;

end;

procedure TFom1.virgulaClick(Sender: TObject);
begin

  if (visor.Text <> '') then
    visor.Text := visor.Text + ',';

end;

procedure TFom1.zeroClick(Sender: TObject);
begin

  visor.Text := visor.Text + (Sender as TSpeedButton).Caption;

end;

end.
