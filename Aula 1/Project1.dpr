program Project1;

uses
  Vcl.Forms,
  frmCalculadora in 'frmCalculadora.pas' {Fom1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFom1, Fom1);
  Application.Run;
end.
