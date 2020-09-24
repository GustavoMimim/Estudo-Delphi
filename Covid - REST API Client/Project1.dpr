program Project1;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {Form1},
  frmSplashScreen in 'frmSplashScreen.pas' {SplashScreen};

{$R *.res}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  SplashScreen := TSplashScreen.Create(nil);

  try
    SplashScreen.Show;

    Application.CreateForm(TForm1, Form1);
    while not SplashScreen.Completed do
        Application.ProcessMessages;

    SplashScreen.Hide;

  finally

    //SplashScreen.Free;

  end;

  Application.Run;

end.
