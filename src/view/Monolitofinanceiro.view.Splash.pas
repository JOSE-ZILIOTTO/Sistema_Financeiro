unit Monolitofinanceiro.view.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TFrmSplash = class(TForm)
    Pnlprincipal: TPanel;
    Imalogo: TImage;
    lblnomeaplicacao: TLabel;
    ProgressBar1: TProgressBar;
    lblstatus: TLabel;
    Timer1: TTimer;
    Panel1: TPanel;
    imgdependencias: TImage;
    Imgbancodados: TImage;
    Imginiciarsistema: TImage;
    Imgconfig: TImage;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure Atualizarstatus (Mensagem : string ; Imagem : TImage);
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

implementation

{$R *.dfm}

procedure TFrmSplash.AtualizarStatus(Mensagem: string; Imagem : TImage);
begin
 lblstatus.caption := Mensagem;
 imagem.Visible := true;
end;

procedure TFrmSplash.Timer1Timer(Sender: TObject);
begin
if ProgressBar1.Position <= 100 then
begin
ProgressBar1.StepIt;
case ProgressBar1.Position of
 10 : Atualizarstatus(' Carregando Dependências... ' , imgdependencias);
  25 :Atualizarstatus( ' Carregando Banco de dados... ', Imgbancodados);
   45 : Atualizarstatus( ' Carregando Configurações... ',Imgconfig);
    75 : Atualizarstatus( ' Iniciando o sistema... ',Imginiciarsistema);

end;
if ProgressBar1.Position = 100 then
Close;
end;

end;

end.
