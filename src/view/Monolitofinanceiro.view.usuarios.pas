unit Monolitofinanceiro.view.usuarios;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Monolitofinanceiro.view.Cadastropadrao,
  Data.DB,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Grids, Monolitofinanceiro.Utilitario, BCrypt,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPanels,
  Monolitofinanceiro.model.usuario,
  Vcl.WinXCtrls,
   Vcl.Menus,
  Monolitofinanceiro.view.relatorios.usuarios;

type
  TFrmusuarios = class(TFrmCadastroPadrao)
    edtnome: TEdit;
    edtlogin: TEdit;
    lblnome: TLabel;
    lbllogin: TLabel;
    ToggleSwitch1: TToggleSwitch;
    lblstatus: TLabel;
    mnuviewusuario: TPopupMenu;
    mnulimparpassword: TMenuItem;
    procedure btnalterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BtnfecharcadastroClick(Sender: TObject);
    procedure mnulimparpasswordClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }


  public
    { Public declarations }
    procedure pesquisar; override;
  end;

var
  Frmusuarios: TFrmusuarios;

implementation

{$R *.dfm}

procedure TFrmusuarios.btnalterarClick(Sender: TObject);
begin
  inherited;


  edtnome.Text := dmusuario.cdsusuariosnome.AsString;
  edtlogin.Text := dmusuario.cdsusuarioslogin.AsString;
  ToggleSwitch1.State := tssOn;

  if dmusuario.cdsusuariosstatus.AsString = 'B' then
    ToggleSwitch1.State := tssOn;

end;

procedure TFrmusuarios.BtnfecharcadastroClick(Sender: TObject);
begin
  inherited;
  dmusuario.cdsusuarios.Cancel;
end;

procedure TFrmusuarios.btnImprimirClick(Sender: TObject);
begin
relusuarios.DataSource1.DataSet := DataSource1.DataSet;
relusuarios.Preview;

end;

procedure TFrmusuarios.btnSalvarClick(Sender: TObject);
var
  LSstatus: string;


begin

  if edtnome.Text = '' then
  begin
    edtnome.SetFocus;
    Application.MessageBox('O campo nome não pode  ser vazio', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if edtlogin.Text = '' then
  begin
    edtlogin.SetFocus;
    Application.MessageBox('O campo Login não pode  ser vazio', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if dmusuario.TemLoginCadastrado(trim(edtlogin.Text), dmusuario.cdsusuarios.FieldByName('ID').AsString) then
  begin
    edtlogin.SetFocus;
    Application.MessageBox(pwidechar(Format('O login %s já se  encontra cadastrado!', [edtlogin.Text])), ' Atenção!',
      MB_OK + MB_ICONWARNING);
    Abort;
  end;

  LSstatus := 'A';

  if ToggleSwitch1.State = tssOff then
    LSstatus := 'B';



  if dmusuario.cdsusuarios.State in [dsinsert] then
  begin

    dmusuario.cdsusuariosid.AsString := Tutilitario.getid;
    dmusuario.cdsusuariosdata_cadastro.AsDateTime := now;
    dmusuario.cdsusuariossenha.AsString := TBCrypt.GenerateHash(dmusuario.Temp_Password);
    dmusuario.cdsusuariosSenha_temporaria.AsString := 'S';
  end;

  dmusuario.cdsusuariosnome.AsString := trim(edtnome.Text);
  dmusuario.cdsusuarioslogin.AsString := trim(edtlogin.Text);
  dmusuario.cdsusuariosstatus.AsString := LSstatus;

  inherited;
end;

procedure TFrmusuarios.mnulimparpasswordClick(Sender: TObject);
begin
  inherited;
  if not dmusuario.Getusuario.Administrador then
  begin
  Application.MessageBox(pwidechar('Somente Administradores pode mudar a senha.'), 'Error',MB_OK + MB_ICONERROR);
  abort;
  end;

  if not DataSource1.DataSet.IsEmpty then
  begin
    dmusuario.Limparsenha(DataSource1.DataSet.FieldByName('ID').AsString);
    Application.MessageBox(pwidechar(Format('Foi definida senha padrão para o usuário "%s"',
      [DataSource1.DataSet.FieldByName('NOME').AsString])), ' Atenção!', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TFrmusuarios.pesquisar;
var
  FiltroPesquisar: string;
begin
  FiltroPesquisar := Tutilitario.likepesquisar(Edtpesquisa.Text, DBGrid1);
  dmusuario.cdsusuarios.Close;
  dmusuario.cdsusuarios.CommandText := 'select * from usuarios where 1 = 1 ' + FiltroPesquisar;
  dmusuario.cdsusuarios.open;

  inherited;

end;

end.
