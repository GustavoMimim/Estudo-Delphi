program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {SplashScreen};

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
