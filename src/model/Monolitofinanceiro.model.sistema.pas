unit Monolitofinanceiro.model.sistema;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmSistema = class(TDataModule)
  private
  { Private declarations }
    const
    Arquivoconfig = 'monolitofinanceiro.cfg';
    function getconfigura��o(secao, parametro, valorpadrao: string): string;
    procedure setconfiguracao(secao, parametro, valor: string);
  public
    { Public declarations }
    function DataultimoAcesso: string; overload;
    procedure DataultimoAcesso(aValue: tdatetime)overload;
    function UsuarioUltimoAcesso: string; overload;
    procedure UsuarioUltimoAcesso(aValue: string); overload;
    function DriverID: string; overload;
    procedure DriverID(aValue: string); overload;
    function Database: string; overload;
    procedure LockingMode(aValue: string); overload;
    function LockingMode: string; overload;
    procedure Database(aValue: string); overload;
  end;

var
  dmSistema: TdmSistema;

implementation

uses

  System.IniFiles, Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModule1 }

function TdmSistema.DataultimoAcesso: string;
begin
  result := getconfigura��o('acesso', 'data', '');
end;

function TdmSistema.Database: string;
begin
 result := getconfigura��o('Banco de dados', 'Database', 'db\Sistemafinanceiro.db');
end;

procedure TdmSistema.Database(aValue: string);
begin
setconfiguracao('Banco de dados', 'Database', aValue)
end;

procedure TdmSistema.DataultimoAcesso(aValue: tdatetime);
begin
  setconfiguracao('acesso', 'data', DateTimeToStr(aValue))
end;

function TdmSistema.DriverID: string;
begin
 result := getconfigura��o('Banco de dados', 'DriverID','sqlite');
end;

procedure TdmSistema.DriverID(aValue: string);
begin
 setconfiguracao('Banco de dados', 'DriverID', aValue);
end;

function TdmSistema.getconfigura��o(secao, parametro, valorpadrao: string): string;
var
  LArquivconfig: Tinifile;
begin
  LArquivconfig := Tinifile.Create(ExtractFilePath(Application.ExeName) + Arquivoconfig);
  try
    result := LArquivconfig.ReadString(secao, parametro, valorpadrao);
  finally
    LArquivconfig.Free;
  end;
end;

function TdmSistema.LockingMode: string;
begin
 result := getconfigura��o('Banco de dados', 'LockingMode','Normal');
end;

procedure TdmSistema.LockingMode(aValue: string);
begin
 setconfiguracao('Banco de dados', 'LockingMode', aValue);
end;

procedure TdmSistema.setconfiguracao(secao, parametro, valor: string);
var
  LArquivconfig: Tinifile;
begin
  LArquivconfig := Tinifile.Create(ExtractFilePath(Application.ExeName) + Arquivoconfig);
  try
    LArquivconfig.writeString(secao, parametro, valor);
  finally
    LArquivconfig.Free;
  end;
end;

function TdmSistema.UsuarioUltimoAcesso: string;
begin
  result := getconfigura��o('acesso', 'usuario', '');
end;

procedure TdmSistema.UsuarioUltimoAcesso(aValue: string);
begin
  setconfiguracao('acesso', 'usuario', aValue);
end;

end.
