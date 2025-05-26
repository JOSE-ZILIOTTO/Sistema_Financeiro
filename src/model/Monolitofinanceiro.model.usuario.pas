unit Monolitofinanceiro.model.usuario;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, Monolitofinanceiro.model.entidades.usuario,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient, Datasnap.Provider, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Monolitofinanceiro.model.Conexao, BCrypt,
  Monolitofinanceiro.Utilitario;

type
  Tdmusuario = class(TDataModule)
    sqlusuarios: TFDQuery;
    dspusuarios: TDataSetProvider;
    cdsusuarios: TClientDataSet;
    cdsusuariosid: TStringField;
    cdsusuariosnome: TStringField;
    cdsusuarioslogin: TStringField;
    cdsusuariossenha: TStringField;
    cdsusuariosstatus: TStringField;
    cdsusuariosdata_cadastro: TDateField;
    cdsusuariosSenha_temporaria: TStringField;
    cdsusuariosAdministrador: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    Fentidadeusuario: Tmodelentidadeusuario;

  public
  { Public declarations }
    const
    Temp_Password = '123456';
    function TemLoginCadastrado(login: string; id: string): boolean;
    procedure Efetuarlogin(login: string; senha: string);
    function Getusuario: Tmodelentidadeusuario;
    procedure Limparsenha(Idusuaario: string);
    procedure Redefinirsenha(usuario: Tmodelentidadeusuario);
    procedure CadastrarUsuario(usuario: Tmodelentidadeusuario);
    function TabelaUsuariosVazia : boolean;

  end;

var
  dmusuario: Tdmusuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ Tdmusuario }

procedure Tdmusuario.CadastrarUsuario(usuario: Tmodelentidadeusuario);
var
  sqlQuery: TFDQuery;
  sql : string;
begin
  sqlQuery := TFDQuery.Create(nil);
  try

    sql := 'INSERT INTO USUARIOS (ID,NOME,LOGIN,SENHA,STATUS,DATA_CADASTRO,SENHA_TEMPORARIA,ADMINISTRADOR) ' +
           'VALUES (:ID,:NOME,:LOGIN,:SENHA,:STATUS,:DATA_CADASTRO,:SENHA_TEMPORARIA,:ADMINISTRADOR)' ;
    sqlQuery.Connection := dmconexao.SQlconexao;
    sqlQuery.SQL.Clear;
    sqlQuery.SQL.Add(sql);


    sqlQuery.ParamByName('ID').AsString := Tutilitario.getId;
    sqlQuery.ParamByName('NOME').AsString := usuario.Nomeusuariologado;
    sqlQuery.ParamByName('LOGIN').AsString := usuario.loginusuariologado;
    sqlQuery.ParamByName('SENHA').AsString := TBCrypt.GenerateHash(usuario.senha);
    sqlQuery.ParamByName('DATA_CADASTRO').Asdate := now;

    sqlQuery.ParamByName('SENHA_TEMPORARIA').AsString := 'N';
    if usuario.senhaTemporaria then
    sqlQuery.ParamByName('SENHA_TEMPORARIA').AsString := 'S';

     sqlQuery.ParamByName('ADMINISTRADOR').AsString := 'N';
    if usuario.Administrador then
    sqlQuery.ParamByName('ADMINISTRADOR').AsString := 'S';

    sqlQuery.ParamByName('STATUS').AsString := 'A';
    sqlQuery.prepare;
    sqlQuery.ExecSQL;
  finally
    sqlQuery.Close;
    sqlQuery.Free
  end;

end;

procedure Tdmusuario.DataModuleCreate(Sender: TObject);
begin
  Fentidadeusuario := Tmodelentidadeusuario.Create;
end;

procedure Tdmusuario.DataModuleDestroy(Sender: TObject);
begin
  Fentidadeusuario.Free;
end;

procedure Tdmusuario.Efetuarlogin(login, senha: string);
var
  sqlconsulta: TFDQuery;

begin
  sqlconsulta := TFDQuery.Create(nil);
  try
    sqlconsulta.Connection := dmconexao.SQlconexao;
    sqlconsulta.SQL.Clear;
    sqlconsulta.SQL.Add('SELECT * FROM USUARIOS WHERE LOGIN = :LOGIN  ');
    sqlconsulta.ParamByName('LOGIN').AsString := login;
    sqlconsulta.Open;

    if sqlconsulta.IsEmpty then
      raise Exception.Create('Usuário ou senha inválidos');

    if not TBCrypt.CompareHash(senha, sqlconsulta.FieldByName('SENHA').AsString) then
      raise Exception.Create('Usuário ou senha Inválidos!');

    if sqlconsulta.FieldByName('STATUS').AsString <> 'A' then
      raise Exception.Create('Usuário bloqueado, favor entar em contato com o Administrador!');

    Fentidadeusuario.idusuariologado := sqlconsulta.FieldByName('ID').AsString;
    Fentidadeusuario.Nomeusuariologado := sqlconsulta.FieldByName('NOME').AsString;
    Fentidadeusuario.loginusuariologado := sqlconsulta.FieldByName('LOGIN').AsString;
    Fentidadeusuario.senha := sqlconsulta.FieldByName('SENHA').AsString;
    Fentidadeusuario.senhaTemporaria := sqlconsulta.FieldByName('SENHA_TEMPORARIA').AsString = 'S';
    Fentidadeusuario.Administrador := sqlconsulta.FieldByName('ADMINISTRADOR').AsString = 'S';
  finally
    sqlconsulta.Close;
    sqlconsulta.Free;

  end;

end;

function Tdmusuario.Getusuario: Tmodelentidadeusuario;
begin
  RESULT := Fentidadeusuario;
end;

procedure Tdmusuario.Limparsenha(Idusuaario: string);
var
  sqlQuery: TFDQuery;
begin
  sqlQuery := TFDQuery.Create(nil);
  try
    sqlQuery.Connection := dmconexao.SQlconexao;
    sqlQuery.SQL.Clear;
    sqlQuery.SQL.Add('UPDATE USUARIOS SET SENHA_TEMPORARIA = :SENHA_TEMPORARIA, SENHA = :SENHA WHERE ID = :ID');
    sqlQuery.ParamByName('SENHA_TEMPORARIA').AsString := 'S';
    sqlQuery.ParamByName('SENHA').AsString := TBCrypt.GenerateHash(Temp_Password);
    sqlQuery.ParamByName('ID').AsString := Idusuaario;
    sqlQuery.ExecSQL;
  finally
    sqlQuery.Close;
    sqlQuery.Free
  end;
end;

procedure Tdmusuario.Redefinirsenha(usuario: Tmodelentidadeusuario);
var
  sqlQuery: TFDQuery;
begin
  sqlQuery := TFDQuery.Create(nil);
  try
    sqlQuery.Connection := dmconexao.SQlconexao;
    sqlQuery.SQL.Clear;
    sqlQuery.SQL.Add('UPDATE USUARIOS SET SENHA_TEMPORARIA = :SENHA_TEMPORARIA, SENHA = :SENHA WHERE ID = :ID');
    sqlQuery.ParamByName('SENHA_TEMPORARIA').AsString := 'N';
    sqlQuery.ParamByName('SENHA').AsString := TBCrypt.GenerateHash(usuario.senha);
    sqlQuery.ParamByName('ID').AsString := usuario.idusuariologado;
    sqlQuery.ExecSQL;
  finally
    sqlQuery.Close;
    sqlQuery.Free
  end;

end;

function Tdmusuario.TabelaUsuariosVazia: boolean;
var
  sqlconsulta: TFDQuery;
begin
  RESULT := false;
  sqlconsulta := TFDQuery.Create(nil);

  try
    sqlconsulta.Connection := dmconexao.SQlconexao;
    sqlconsulta.SQL.Clear;
    sqlconsulta.SQL.Add('SELECT * FROM USUARIOS');
    sqlconsulta.Open;

    result := sqlconsulta.IsEmpty;
  finally
    sqlconsulta.Close;
    sqlconsulta.Free;
  end;

end;

function Tdmusuario.TemLoginCadastrado(login, id: string): boolean;
var
  sqlconsulta: TFDQuery;
begin
  RESULT := false;
  sqlconsulta := TFDQuery.Create(nil);

  try
    sqlconsulta.Connection := dmconexao.SQlconexao;
    sqlconsulta.SQL.Clear;
    sqlconsulta.SQL.Add('SELECT ID FROM USUARIOS WHERE LOGIN = :LOGIN');
    sqlconsulta.ParamByName('LOGIN').AsString := login;
    sqlconsulta.Open;

    if not sqlconsulta.IsEmpty then
      RESULT := sqlconsulta.FieldByName('ID').AsString <> id;

  finally
    sqlconsulta.Close;
    sqlconsulta.Free;
  end;

end;

end.
