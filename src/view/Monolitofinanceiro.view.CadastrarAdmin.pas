unit Monolitofinanceiro.view.CadastrarAdmin;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Monolitofinanceiro.model.entidades.usuario,
  Monolitofinanceiro.model.usuario,
  Monolitofinanceiro.model.sistema;

type
  Tfrmcadastraradministrador = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    lblsenha: TLabel;
    lblconfirmar: TLabel;
    edtsenha: TEdit;
    edtconfirm: TEdit;
    Panel1: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    Panel3: TPanel;
    lbltitulo: TLabel;
    lbltituloprincipau: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadastraradministrador: Tfrmcadastraradministrador;

implementation

{$R *.dfm}

procedure Tfrmcadastraradministrador.btnCancelarClick(Sender: TObject);
begin
Modalresult := mrcancel;
end;

procedure Tfrmcadastraradministrador.btnConfirmarClick(Sender: TObject);
var
usuario : Tmodelentidadeusuario;
begin
  edtsenha.Text := trim(edtsenha.Text);
  edtconfirm.Text := trim(edtconfirm.Text);
  if edtsenha.Text = '' then
  begin
    edtsenha.SetFocus;
    application.messagebox('informe sua nova senha.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;
  if edtconfirm.Text = '' then
  begin
    edtconfirm.SetFocus;
    application.messagebox('Confirme sua nova senha.', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;
  if edtsenha.Text <> edtconfirm.Text then
  begin
    edtconfirm.SetFocus;
    application.messagebox('Senha diferente de confirmar senha!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  usuario := Tmodelentidadeusuario.Create;
  try
  usuario.Nomeusuariologado := 'Admin';
  usuario.loginusuariologado := 'Admin';
  usuario.Senha := edtsenha.Text ;
  usuario.senhaTemporaria := false;
  usuario.Administrador := True;

  dmusuario.CadastrarUsuario(usuario);
  dmsistema.UsuarioUltimoAcesso('Admin');
  finally
   usuario.Free;
  end;
  application.messagebox('Administrador cadastrado com sucesso!', 'Sucesso', MB_OK + MB_ICONINFORMATION);

  ModalResult := mrOk;

end;

end.
