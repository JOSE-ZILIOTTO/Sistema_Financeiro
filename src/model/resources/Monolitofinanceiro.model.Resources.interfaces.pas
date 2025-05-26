unit Monolitofinanceiro.model.Resources.interfaces;

interface

uses
  Data.DB;

type

  IConexao = interface
    ['{92366F1B-6391-4BEB-9811-AB925D461E5B}']
    function conexao: TCustomConnection;
    procedure StartTransaction;
    procedure Commit;
    procedure Roolback;
  end;

  IConfiguracao = interface
    ['{6F3F1703-BAF6-4143-9A8F-78B84CB92949}']
     function DataultimoAcesso: string; overload;
    function DataultimoAcesso(aValue: tdatetime) : IConfiguracao; overload;
    function UsuarioUltimoAcesso: string; overload;
    function UsuarioUltimoAcesso(aValue: string) : IConfiguracao ; overload;
    function DriverID: string; overload;
    function DriverID(aValue: string) : IConfiguracao; overload;
    function Database: string; overload;
    function LockingMode(aValue: string) :IConfiguracao; overload;
    function LockingMode: string; overload;
    function Database(aValue: string) : IConfiguracao; overload;
  end;

  IQuery = interface
    ['{03ABF7C0-D370-4AC0-A98F-4FE430A2CB37}']
    function SQL (value : string) : IQuery;
    function Params (key : string ; value : string) : IQuery ;
    function ExecSql : Tdataset;
  end;

implementation

end.
