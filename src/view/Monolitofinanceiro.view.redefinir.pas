unit Monolitofinanceiro.view.redefinir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Monolitofinanceiro.model.entidades.usuario, Monolitofinanceiro.model.usuario;

type
  TFrmRedefinirSenha = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    lblsenha: TLabel;
    lblconfirmar: TLabel;
    edtsenha: TEdit;
    edtconfirm: TEdit;
    Panel3: TPanel;
    lbltitulo: TLabel;
    lbltituloprincipau: TLabel;
    Panel1: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FUsuario: Tmodelentidadeusuario;
    procedure SetUsuario(const Value: Tmodelentidadeusuario);
    { Private declarations }
  public
    { Public declarations }
    property usuario: Tmodelentidadeusuario read FUsuario write SetUsuario;
  end;

var
  FrmRedefinirSenha: TFrmRedefinirSenha;

implementation

{$R *.dfm}

procedure TFrmRedefinirSenha.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmRedefinirSenha.btnConfirmarClick(Sender: TObject);
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

  usuario.Senha := edtsenha.Text;
  dmusuario.Redefinirsenha(usuario);
  application.messagebox('Senha alterada com sucesso!', 'Sucesso', MB_OK + MB_ICONINFORMATION);

  ModalResult := mrOk;
end;

procedure TFrmRedefinirSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #27) then
    Application.Terminate;
  if Key = #13 then
  begin
    if ActiveControl = edtsenha then
    begin
      Key := #0;
      edtconfirm.SetFocus;
    end
    else if ActiveControl = edtsenha then
    begin
      Key := #0;
      btnConfirmar.Click;
    end;
  end;
end;

procedure TFrmRedefinirSenha.FormShow(Sender: TObject);
begin
  lbltituloprincipau.Caption := FUsuario.Nomeusuariologado;
end;

procedure TFrmRedefinirSenha.SetUsuario(const Value: Tmodelentidadeusuario);
begin
  FUsuario := Value;
end;

end.
