unit uCadastroAluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  uModelo, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Edit;

type
  TfrmCadastroAluno = class(TfrmUModelo)
    lblEmail: TLabel;
    lytTitulo: TLayout;
    lblTitulo: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    lblNome: TLabel;
    Layout3: TLayout;
    lblRA: TLabel;
    edtRA: TEdit;
    edtNome: TEdit;
    edtEmail: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAluno: TfrmCadastroAluno;
  ra, nome, email : String;

implementation

{$R *.fmx}

procedure TfrmCadastroAluno.btnCancelarClick(Sender: TObject);
begin
  inherited;
  edtRA.Text := '';
  edtNome.Text := '';
  edtEmail.Text := '';
end;

procedure TfrmCadastroAluno.btnSalvarClick(Sender: TObject);
begin
  inherited;
  ra := edtRA.Text;
  nome := edtNome.Text;
  email := edtEmail.Text;
end;

end.
