unit Monolitofinanceiro.model.Resources.Query;

interface

uses
  Monolitofinanceiro.model.Resources.interfaces,
  Data.DB,
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  Monolitofinanceiro.model.entidades.usuario,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Datasnap.DBClient,
  Datasnap.Provider,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Monolitofinanceiro.model.Conexao,
  BCrypt,
  Monolitofinanceiro.Utilitario, Monolitofinanceiro.model.Resources.Conexao;

type

  TQuery = class(TInterfacedObject, Iquery)
  private
    FQuery: TFDQuery;
    FConexao: IConexao;
    FSql: string;
    constructor Create;
    destructor destroy; override;
  public
  class function new : IQuery;
    function SQL(value: string): Iquery;
    function Params(key: string; value: string): Iquery;
    function ExecSql: Tdataset;

  end;

implementation

{ TQuery }

constructor TQuery.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FConexao := Tconexao.new;
  FQuery.Connection := TFDConnection(FConexao.conexao);
end;

destructor TQuery.destroy;
begin
   FQuery.Free;
  inherited;
end;

function TQuery.ExecSql: Tdataset;
begin
  if not AnsiPos('SELECT', UpperCase(FSql)) > 0 then
  BEGIN
    FConexao.StartTransaction;
    try
      FQuery.Prepare;
      FQuery.ExecSql;
      FConexao.Commit;
      exit;
    except
      on E: Exception do
      begin
        FConexao.Roolback;
        raise Exception.Create('Erro ao realizar persistência dos dados!');
      end;

    end;
  END;
 FQuery.open;
 result := FQuery;
end;

class function TQuery.new: IQuery;
begin
result := self.Create;
end;

function TQuery.Params(key, value: string): Iquery;
begin
 result := self;
 FQuery.Params.Add;
 FQuery.Params.ParamByName(key).Value := value;

end;

function TQuery.SQL(value: string): Iquery;
begin
 result := self;
 FSQL := EmptyStr;
 FSQL := value;
 FQuery.SQL.Clear;
 FQuery.SQL.Add(FSQL);
end;

end.
