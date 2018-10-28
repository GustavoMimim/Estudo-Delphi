program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uCalculadora in 'uCalculadora.pas' {frmCalculadora},
  uModelo in 'uModelo.pas' {frmUModelo},
  uCadastroAluno in 'uCadastroAluno.pas' {frmCadastroAluno};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmUModelo, frmUModelo);
  Application.CreateForm(TfrmCadastroAluno, frmCadastroAluno);
  Application.CreateForm(TfrmCadastroAluno, frmCadastroAluno);
  Application.Run;
end.
