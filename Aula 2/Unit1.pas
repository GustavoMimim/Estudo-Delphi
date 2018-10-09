unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.TabControl, FMX.Edit, FMX.Ani,
  FMX.MultiView;

type
  TForm1 = class(TForm)
    labelNome: TLabel;
    ctrlPrincipal: TTabControl;
    tabLogin: TTabItem;
    painelLogar: TPanel;
    edtSenha: TEdit;
    edtUsuario: TEdit;
    usuarioLog: TLabel;
    senhaLog: TLabel;
    Logar: TButton;
    tabPrincipal: TTabItem;
    msg: TLabel;
    tabConf: TTabItem;
    tabCadastrar: TTabItem;
    Panel2: TPanel;
    edtUsuarioCadastrar: TEdit;
    senhaCad: TLabel;
    btnCadastrar: TButton;
    ToolBar1: TToolBar;
    cdMenu: TSpeedButton;
    menu: TMultiView;
    edtSenhaCadastrar: TEdit;
    usuarioCad: TLabel;
    TabControl1: TTabControl;
    Tab1: TTabItem;
    Tab2: TTabItem;
    Image1: TImage;
    procedure LogarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  usuario: array[1..10] of string;
  senha: array[1..10] of string;

implementation

{$R *.fmx}
{$R *.iPhone55in.fmx IOS}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.SSW3.fmx ANDROID}
{$R *.GGlass.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.Macintosh.fmx MACOS}

procedure TForm1.btnCadastrarClick(Sender: TObject);
var
  i: integer;
  sair: integer;

begin
  i := 0;
  sair := 0;
  while (i <= 10) Or (sair = 1) do
  begin
    if usuario[i] = '' then
    begin
      usuario[i] := edtUsuarioCadastrar.Text;
      senha[i] := edtSenhaCadastrar.Text;
      sair := 1;
    end
    else
      i := i + 1;
  end;


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //ctrlPrincipal.ActiveTab := tabPrincipal;
  tabLogin.IsSelected := true;
  tabCadastrar.Visible := true;
  tabPrincipal.Visible := false;
  tabConf.Visible := false;
end;

procedure TForm1.LogarClick(Sender: TObject);
begin
  if (Trim(edtUsuario.Text) = '') Or (Trim(edtSenha.Text) = '') then
  begin
    ShowMessage('Usuário e senha precisam estar preenchidos!');
  end
  else
  begin
    ShowMessage('Logado com sucesso!');
    tabLogin.Visible := false;
    tabPrincipal.Visible := true;
    tabConf.Visible := true;
    ctrlPrincipal.ActiveTab := tabPrincipal;
    labelNome.Text := edtUsuario.Text;
    labelNome.Visible := True;
  end;
end;

end.
