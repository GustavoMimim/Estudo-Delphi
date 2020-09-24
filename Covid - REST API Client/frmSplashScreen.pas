unit frmSplashScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.GIFImg;

type
    TSplashScreen = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Completed: Boolean;
  end;

var
  SplashScreen: TSplashScreen;

implementation

{$R *.dfm}

procedure TSplashScreen.FormShow(Sender: TObject);
begin

  Completed := False;

end;

end.
