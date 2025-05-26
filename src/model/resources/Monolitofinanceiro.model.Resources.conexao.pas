unit Monolitofinanceiro.model.Resources.conexao;

interface

uses
  Monolitofinanceiro.model.Resources.interfaces,
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Monolitofinanceiro.model.sistema,
  Monolitofinanceiro.model.Resources.configuracao;

type

  TConexao = class(TInterfacedObject, IConexao)
  private
  FConexao : TFDConnection;
  FConfig : IConfiguracao;

  constructor Create;
  destructor Destroy; override;

  public
  procedure carregarconfiguracao;
    class function new: IConexao;
    function conexao: TCustomConnection;
    procedure StartTransaction;
    procedure Commit;
    procedure Roolback;
  end;

implementation

{ TConexao }

procedure TConexao.carregarconfiguracao;
begin
  FConexao.Params.Clear;
  FConexao.Params.DriverID := FConfig.DriverID;
  FConexao.Params.Database := FConfig.Database;
  FConexao.Params.Add('LockingMode=' + FConfig.LockingMode);
  FConexao.Connected;
end;

procedure TConexao.Commit;
begin
FConexao.Commit;
end;

function TConexao.conexao: TCustomConnection;
begin

end;

constructor TConexao.Create;
begin
FConexao := TFDConnection.Create(nil);
FConfig := TConfiguracao.New;
carregarconfiguracao;
end;

destructor TConexao.Destroy;
begin
 FConexao.Free;
  inherited;
end;

class function TConexao.new: IConexao;
begin
 result := self.Create;
end;

procedure TConexao.Roolback;
begin
 FConexao.Rollback;
end;

procedure TConexao.StartTransaction;
begin
 FConexao.StartTransaction;
end;

end.
