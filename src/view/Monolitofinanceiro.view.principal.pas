unit Monolitofinanceiro.view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Monolitofinanceiro.view.Splash,
  Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.Menus,
  Monolitofinanceiro.view.usuarios,
  Monolitofinanceiro.view.login, Vcl.ComCtrls,
  Monolitofinanceiro.model.usuario,
  Vcl.ExtCtrls,
  Monolitofinanceiro.view.redefinir,
  Monolitofinanceiro.view.Caixa,
  Monolitofinanceiro.model.entidades.Caixa.Resumo,
  System.DateUtils,
  Monolitofinanceiro.view.saldo,
  Monolitofinanceiro.Utilitario,
  Monolitofinanceiro.model.Caixa,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls,
  Monolitofinanceiro.view.contaspagar,
  Monolitofinanceiro.view.contasReceber,
  Monolitofinanceiro.view.contasReceber.Consultar,
  Monolitofinanceiro.view.Caixa.Extrato,
  Monolitofinanceiro.view.contaspagar.Consultar,
  Monolitofinanceiro.view.CadastrarAdmin;

type
  TFrmprincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnucadastro: TMenuItem;
    mnurelatorios: TMenuItem;
    mnuajuda: TMenuItem;
    usuarios: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    mnufinanceiro: TMenuItem;
    mnucaixa: TMenuItem;
    mnuresumocaixa: TMenuItem;
    pnlPrincipal: TPanel;
    mnuContaspagar: TMenuItem;
    contasReceber: TMenuItem;
    mnucontareceberconsulta: TMenuItem;
    mnuConsultarcontaspagar: TMenuItem;
    mnuextratocaixa: TMenuItem;
    procedure usuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mnucaixaClick(Sender: TObject);
    procedure mnuresumocaixaClick(Sender: TObject);
    procedure mnuContaspagarClick(Sender: TObject);
    procedure ContasReceberClick(Sender: TObject);
    procedure mnucontareceberconsultaClick(Sender: TObject);
    procedure mnuConsultarcontaspagarClick(Sender: TObject);
    procedure mnuextratocaixaClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Frmprincipal: TFrmprincipal;

implementation

{$R *.dfm}

procedure TFrmprincipal.mnucaixaClick(Sender: TObject);
begin
  frmcaixa.show
end;

procedure TFrmprincipal.mnuConsultarcontaspagarClick(Sender: TObject);
begin
  frmcontaspagarconsultar.show;
end;

procedure TFrmprincipal.mnucontareceberconsultaClick(Sender: TObject);
begin
  frmconatsreceberconsultar.show;
end;

procedure TFrmprincipal.mnuContaspagarClick(Sender: TObject);
begin
  frmcontaspagar.show;
end;

procedure TFrmprincipal.mnuextratocaixaClick(Sender: TObject);
begin
  frmcaixaextrato.show;
end;

procedure TFrmprincipal.mnuresumocaixaClick(Sender: TObject);
begin
  frmsaldo.show;
end;

procedure TFrmprincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(now);
end;

procedure TFrmprincipal.usuariosClick(Sender: TObject);
begin
  Frmusuarios.show;
end;

procedure TFrmprincipal.ContasReceberClick(Sender: TObject);
begin
  frmcontasReceber.show;
end;

procedure TFrmprincipal.FormCreate(Sender: TObject);
begin
  FrmSplash := TFrmSplash.Create(nil);
  try
    FrmSplash.ShowModal;
  finally
    FreeAndNil(FrmSplash);
  end;

  Tfrmsaldo.new(self).embed(pnlPrincipal).Show;

  if dmusuario.TabelaUsuariosVazia then
  begin
    frmcadastraradministrador := Tfrmcadastraradministrador.Create(nil);
    try
      frmcadastraradministrador.ShowModal;
      if frmcadastraradministrador.modalresult <> mrok then
        application.Terminate;

    finally
      FreeAndNil(frmcadastraradministrador);

    end;
  end;

  frmlogin := Tfrmlogin.Create(nil);
  try
    frmlogin.ShowModal;
    if frmlogin.modalresult <> mrok then
      application.Terminate;

  finally
    FreeAndNil(frmlogin);

  end;

  if dmusuario.Getusuario.senhatemporaria then
  begin
    FrmRedefinirSenha := TfrmRedefinirsenha.Create(nil);
    try
      FrmRedefinirSenha.usuario := dmusuario.Getusuario;
      FrmRedefinirSenha.ShowModal;
      if FrmRedefinirSenha.modalresult <> mrok then
        application.Terminate;

    finally
      FreeAndNil(FrmRedefinirSenha);
    end;
  end;

  StatusBar1.Panels.Items[1].Text := 'Usuario: ' + dmusuario.Getusuario.Nomeusuariologado;
end;

end.
