unit Monolitofinanceiro.model.Conexao;

interface

uses
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
  Monolitofinanceiro.model.sistema;

type
  Tdmconexao = class(TDataModule)
    SQlconexao: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private 
    { Private declarations }
  public
    { Public declarations }
    procedure carregarconfiguracao;
    procedure conectar;
    procedure desconectar;

  end;

var
  dmconexao: Tdmconexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModule1 }

procedure Tdmconexao.carregarconfiguracao;
begin
  SQlconexao.Params.Clear;
  SQlconexao.Params.DriverID := dmsistema.DriverID;
  SQlconexao.Params.Database := dmsistema.Database;
  SQlconexao.Params.Add('LockingMode=' + dmsistema.LockingMode);
end;

procedure Tdmconexao.conectar;
begin
  SQlconexao.connected;
end;

procedure Tdmconexao.DataModuleCreate(Sender: TObject);
begin
  carregarconfiguracao;
  conectar;
end;

procedure Tdmconexao.desconectar;
begin
  SQlconexao.connected := false;
end;

end.
