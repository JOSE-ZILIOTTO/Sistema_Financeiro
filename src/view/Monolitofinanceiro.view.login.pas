unit Monolitofinanceiro.view.login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Monolitofinanceiro.model.usuario,Monolitofinanceiro.model.sistema;

type
  Tfrmlogin = class(TForm)
    pnlimg: TPanel;
    Imalogo: TImage;
    pnlprincipal: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lbltitulo: TLabel;
    lbltituloprincipal: TLabel;
    Panel4: TPanel;
    lblsenha: TLabel;
    edtsenha: TEdit;
    lblusuarios: TLabel;
    edtusuarios: TEdit;
    btnEntrar: TButton;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlogin: Tfrmlogin;

implementation



{$R *.dfm}

procedure Tfrmlogin.btnEntrarClick(Sender: TObject);
begin
   if trim(edtusuarios.text)= '' then
   begin
   edtusuarios.setfocus;
      application.messagebox( 'informe seu usuário.', 'Atenção' , MB_OK + MB_ICONWARNING);
      abort;
   end;
      if trim(edtsenha.text)= '' then
   begin
   edtsenha.setfocus;
      application.messagebox( 'informe sua senha.', 'Atenção' , MB_OK + MB_ICONWARNING);
      abort;

   end;
    try
    dmusuario.Efetuarlogin(trim(edtusuarios.text), trim(edtsenha.text));
    dmSistema.DataultimoAcesso(now);
    dmSistema.UsuarioUltimoAcesso(dmusuario.Getusuario.loginusuariologado);
    ModalResult := mrok;
    except
      on Error : exception do
      begin
        application.messagebox( pwidechar(Error.Message), 'Atenção' , MB_OK + MB_ICONWARNING);
        edtusuarios.SetFocus;
      end;
    end;


end;

procedure Tfrmlogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #27) then
    Application.Terminate;
  if Key = #13 then
  begin
    if ActiveControl = edtusuarios then
    begin
      Key := #0;
      edtsenha.SetFocus;
    end
    else if ActiveControl = edtsenha then
    begin
      Key := #0;
      btnEntrar.Click;
    end;
  end;
end;

procedure Tfrmlogin.FormShow(Sender: TObject);
begin
edtusuarios.Text := dmSistema.UsuarioUltimoAcesso;
end;

end.
