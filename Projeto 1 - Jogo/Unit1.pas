unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    painel: TPanel;
    background: TImage;
    trem: TImage;
    moverTrem: TTimer;
    tituloAtaque: TLabel;
    tituloDefesa: TLabel;
    tituloVida: TLabel;
    valorDefesa: TLabel;
    valorAtaque: TLabel;
    labelPersonagemHP: TLabel;
    personagem1: TImage;
    nuvem1: TImage;
    ceu: TImage;
    nuvem2: TImage;
    nuvem3: TImage;
    moverNuvem: TTimer;
    montanhaPerto: TImage;
    campoACimaDoTrilho: TImage;
    montanhaLonge: TImage;
    inimigo: TImage;
    labelInimigoHP: TLabel;
    Label2: TLabel;
    controlaInimigo: TTimer;
    Image1: TImage;
    controleTrem: TTimer;
    frame1: TTimer;
    frame2: TTimer;
    Image2: TImage;
    frame4: TTimer;
    frame3: TTimer;
    auxiliar: TImage;
    ataqueFrame2: TImage;
    ataqueFrame3: TImage;
    ataqueFrame1: TImage;
    frame5: TTimer;
    ataqueFrame4: TImage;
    ataqueFrame5: TImage;
    frame6: TTimer;
    padraoFrame: TImage;
    nuvem2_1: TImage;
    nuvem1_1: TImage;
    nuvem1_2: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure moverNuvemTimer(Sender: TObject);
    procedure moverTremTimer(Sender: TObject);
    procedure controlaInimigoTimer(Sender: TObject);
    procedure controleTremTimer(Sender: TObject);
    procedure atacarJogador();
    procedure frame4Timer(Sender: TObject);
    procedure frame1Timer(Sender: TObject);
    procedure frame2Timer(Sender: TObject);
    procedure frame3Timer(Sender: TObject);
    procedure frame5Timer(Sender: TObject);
    function jogadorVivo(): boolean;
    function inimigoVivo(): boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ladoNuvem: Integer = 1; //Respons�vel pelo lado em que a nuvem ir�
  lado: Integer = 1; //Lado em que o inimigo est� andando
  tremOk: integer = 1; //1 Se o trem est� na tela, caso contr�rio 2
  hpPersonagem: Integer = 100; //Inicia a vida do jogador com 100
  hpInimigo: integer = 100; //Inicia a vida do inimigo com 100 
  atacando: Integer = 2; //1 Se o jogador est� realizando um ataque, caso contr�rio 2
  desativar: boolean = false; //Para de passar pelo if se j� passou uma vez

implementation

{$R *.dfm}

procedure TForm1.moverNuvemTimer(Sender: TObject);
begin
  {Verifica se a primeira nuvem chegou no limite esquerdo da tela}
  if nuvem1.Left < -750 then
  begin
    {Muda a variavel que vai ser respons�vel pelo lado em que a nuvem ir� ir}
    ladoNuvem := 2;
  end;
   {Verifica se a primeira nuvem chegou no limite direito da tela}
  if nuvem1.Left > 960 then
  begin
    {Muda a variavel que vai ser respons�vel pelo lado em que a nuvem ir� ir}
    ladoNuvem := 1;
  end;
  {Move as nuvens 1 e 3 da esquerda para a direita e a nuvem 2 da direita para a esquerda}
  if ladoNuvem = 2 then
  begin
    nuvem1.Left := nuvem1.Left + 1;
    nuvem2.Left := nuvem2.Left - 1;
    nuvem3.Left := nuvem3.Left + 1;
    nuvem2_1.Left := nuvem2_1.Left - 1;
    nuvem1_1.Left := nuvem1_1.Left + 1;
    nuvem1_2.Left := nuvem1_2.Left + 1
  end
  {Move a nuvens 1 e 3 da direita para a esquerda a nuvem 2 da esquerda para a dirieta}
  else
  begin
    nuvem1.Left := nuvem1.Left - 1;
    nuvem2.Left := nuvem2.Left + 1;
    nuvem3.Left := nuvem3.Left - 1;
    nuvem2_1.Left := nuvem2_1.Left + 1;
    nuvem1_1.Left := nuvem1_1.Left - 1;
    nuvem1_2.Left := nuvem1_2.Left - 1
  end;
end;


procedure TForm1.moverTremTimer(Sender: TObject);
{Chama essa fun��o a cada 0,09 segundos (de acordo com o timer)}
begin
    {Move o trem para a esquerda em 20 pixels}
    trem.Left := trem.Left - 20;
end;

procedure TForm1.controleTremTimer(Sender: TObject);
begin
  {Verifica se o trem j� atindiu a margem esquerda da tela}
  if trem.left < -800 then
  begin
    tremOk := 1;
    {Recoloca o trem a direita da tela}
    trem.Left := 900;
    if tremOk = 1 then
    begin
      tremOk := 2;
    end;
    moverTrem.Enabled := true;
  end;
end;

procedure TForm1.controlaInimigoTimer(Sender: TObject);
var
  diferencaEspaco: integer; //Espa�o entre o inimigo e personagem
begin
  if jogadorVivo() = false then
    exit;
  if inimigoVivo() = false then
    exit;
  {Verifica qual lado est� o inimigo e o personagem para fazer o c�lculo correto}
  if (personagem1.Left >= inimigo.Left) then
    diferencaEspaco := personagem1.Left - inimigo.Left;
  if (personagem1.Left < inimigo.Left) then
    diferencaEspaco := inimigo.Left - personagem1.Left;
  {Se o inimigo n�o estiver pr�ximo (mais de 150 pixels) do personagem,
  ele dever� andar de uma extremidade da tela a outra em busca do personagem}
  if diferencaEspaco >= 150 then
  begin
    if inimigo.Left <= 0 then
      lado := 1;
    if inimigo.Left >= 850 then
      lado := 2;

    case lado of
      1: inimigo.Left := inimigo.Left + 10;
      2: inimigo.Left := inimigo.Left - 10;
    end;
  end
  {Se estiverem pr�ximos um do outro (menos de 150 pixels)}
  else
  begin
  {Caso o personagem estiver a esquerda do inimigo}
  if (inimigo.Left > personagem1.Left) then
    {inimigo anda para a esquerda}
    inimigo.Left := inimigo.Left - 10;
  {Caso o personagem estiver a direita do inimigo}
  if (inimigo.Left < personagem1.Left) then
    {inimigo anda para a direita}
    inimigo.Left := inimigo.Left + 10;
  {Verifica se a distancia entre o personagem e o inimigo � v�lida para atacar}
  if (personagem1.Left > inimigo.Left - 50) AND (personagem1.Left < inimigo.Left + 50) then
  begin
    atacarJogador();
  end;
  end;
end;

procedure TForm1.atacarJogador();
var
  atacando: Integer; //Se o inimigo est� atacando recebe 1, caso contr�rio recebe 2
begin
  {Se o inimigo j� est� no ataque, sair da procedure}
  if atacando = 1 then
  begin
    atacando := 2;
    exit;
  end;
  {Informa que o ataque come�ou}
  atacando := 1;
  {Atribui a vari�vel o valor que est� na exibindo na tela}
  hpPersonagem := StrToInt(labelPersonagemHP.Caption);
  {Diminu� a vida do inimigo em 10 e exibe na label}
  hpPersonagem := hpPersonagem - 2;
  labelPersonagemHP.Caption := IntToStr(hpPersonagem);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if jogadorVivo() = false then
    exit;
  if inimigoVivo() = false then
    exit;
  {Verifica se a tecla pressionada foi a Seta Esquerda}
  if Key = VK_LEFT then
  begin
    {Verifica se o personagem n�o ir� passar do limite da margem esquerda}
    if personagem1.Left - 15 > 0 then
    begin
      {Move o personagem para a esquerda}
      personagem1.Left := personagem1.Left - 15;
      {Efeito Parallax nas montanhas}
      if (montanhaPerto.Left >= 10) AND ((personagem1.Left mod 2) = 0) then
      begin
        montanhaPerto.Left := montanhaPerto.Left - 1;
        montanhaLonge.Left := montanhaLonge.Left + 1;
      end;
    end;
  end;
  {Verifica se a tecla pressionada foi a Seta Direita}
  if Key = VK_RIGHT then
  begin
    {Verifica se o personagem n�o ir� passar do limite da margem direita}
    if personagem1.Left + 15 < 900 then
    begin
      {Move o personagem para a direita}
      personagem1.Left := personagem1.Left + 15;
      {Efeito Parallax nas montanhas}
      if (montanhaPerto.Left <= 70) AND ((personagem1.Left mod 2) <> 0) then
      begin
        montanhaPerto.Left := montanhaPerto.Left + 1;
        montanhaLonge.Left := montanhaLonge.Left - 1;
      end;
    end;
  end;
  {Verifica se a tecla pressionada foi a Seta Cima}
  if Key = VK_UP then
  begin
    {Verifica se o personagem n�o ir� passar do limite da margem de cima}
    if personagem1.Top - 15 > 500 then
      personagem1.Top := personagem1.Top - 15;
  end;
  {Verifica se a tecla pressionada foi a Seta Baixo}
  if Key = VK_DOWN then
  begin
    {Verifica se o personagem n�o ir� passar do limite da margem de baixo}
    if personagem1.Top + 15 < 585 then
      personagem1.Top := personagem1.Top + 15;
  end;
  {Verifica se o usu�rio precissionou a tecla espa�o}
  if Key = VK_SPACE then
  begin
    {Verifica se o inimigo est� vivo}
    if (StrToInt(labelInimigoHP.Caption) > 0) then
    begin
      {Permite apenas uma anima��o ao mesmo tempo}
      if (frame1.Enabled = false) AND (frame2.Enabled = false) AND (frame3.Enabled = false) AND (frame4.Enabled = false) AND (frame5.Enabled = false) AND (atacando = 2) then
      begin
        atacando := 1;
        frame1.Enabled := true;
      end;
      {Verifica se a distancia entre o personagem e o inimigo � v�lida para atacar}
      if (personagem1.Left > inimigo.Left - 75) AND (personagem1.Left < inimigo.Left + 75) then
      begin
        hpInimigo := StrToInt(labelInimigoHP.Caption);
        {Diminu� a vida do inimigo em 10 e exibe na label}
        hpInimigo := hpInimigo - 10;
        labelInimigoHP.Caption := IntToStr(hpInimigo);
      end;
      {Verifica se a vida do inimigo ficou menor ou igual a 0}
      if StrToInt(labelInimigoHP.Caption) <= 0 then
      begin
        inimigo.Destroy;
        controlaInimigo.Enabled := false;
      end;

    end
  end;
end;

function TForm1.jogadorVivo(): boolean;
begin
  {Verifica se o jogador morreu}
  if (hpPersonagem = 0) and (desativar = false) then
  begin
    {Pausa todo o game}
    personagem1.Picture := padraoFrame.Picture;
    personagem1.Visible := false;
    controlaInimigo.Enabled := false;
    moverTrem.Enabled := false;
    moverNuvem.Enabled := false;
    ShowMessage('Voc� Perdeu! Reincie o game para tentar novamente');
    desativar := true;
    jogadorVivo := false;
  end
  else
    jogadorVivo := true;
end;

function TForm1.inimigoVivo(): boolean;
begin
  {Verifica se o jogador morreu}
  if (hpInimigo = 0) and (desativar = false) then
  begin
    ShowMessage('Voc� Ganhou! Reincie o game se quiser jogar novamente');
    desativar := true;
    inimigoVivo := false;
  end
  else
    inimigoVivo := true;
end;

procedure TForm1.frame1Timer(Sender: TObject);
begin
  auxiliar.Picture := personagem1.Picture;
  personagem1.Picture := ataqueFrame1.Picture;
  ataqueFrame1.Picture := ataqueFrame2.Picture;
  ataqueFrame2.Picture := ataqueFrame3.Picture;
  ataqueFrame3.Picture := ataqueFrame4.Picture;
  ataqueFrame4.Picture := ataqueFrame5.Picture;
  //ataque frame 5 vazio
  frame5.Enabled := false;
  frame2.Enabled := true;
end;

procedure TForm1.frame2Timer(Sender: TObject);
begin
  ataqueFrame5.Picture := auxiliar.Picture;
  auxiliar.Picture := personagem1.Picture;
  personagem1.Picture := ataqueFrame1.Picture;
  ataqueFrame1.Picture := ataqueFrame2.Picture;
  ataqueFrame2.Picture := ataqueFrame3.Picture;
  ataqueFrame3.Picture := ataqueFrame4.Picture;
  //ataque frame 4 vazio
  frame1.Enabled := false;
  frame3.Enabled := true;

end;

procedure TForm1.frame3Timer(Sender: TObject);
begin
  ataqueFrame4.Picture := ataqueFrame5.Picture;
  ataqueFrame5.Picture := auxiliar.Picture;
  auxiliar.Picture := personagem1.Picture;
  personagem1.Picture := ataqueFrame1.Picture;
  ataqueFrame1.Picture := ataqueFrame2.Picture;
  ataqueFrame2.Picture := ataqueFrame3.Picture;
  //ataque frame 3 vazio
  frame2.Enabled := false;
  frame4.Enabled := true;
end;
procedure TForm1.frame4Timer(Sender: TObject);
begin
  ataqueFrame3.Picture := ataqueFrame4.Picture;
  ataqueFrame4.Picture := ataqueFrame5.Picture;
  ataqueFrame5.Picture := auxiliar.Picture;
  auxiliar.Picture := personagem1.Picture;
  personagem1.Picture := ataqueFrame4.Picture;
  ataqueFrame1.Picture := ataqueFrame2.Picture;
  //ataque frame 2 vazio
  frame3.Enabled := false;
  frame5.Enabled := true;

end;

procedure TForm1.frame5Timer(Sender: TObject);
begin
  ataqueFrame2.Picture := ataqueFrame3.Picture;
  ataqueFrame3.Picture := ataqueFrame4.Picture;
  ataqueFrame4.Picture := ataqueFrame5.Picture;
  ataqueFrame5.Picture := auxiliar.Picture;
  auxiliar.Picture := personagem1.Picture;
  personagem1.Picture := ataqueFrame1.Picture;
  //ataque frame 1 vazio
  frame4.Enabled := false;
  personagem1.Picture := padraoFrame.Picture;
  atacando := 2;
  frame5.Enabled := false;
end;

end.
