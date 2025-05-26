unit Monolitofinanceiro.model.Resources.configuracao;

interface

uses
  Monolitofinanceiro.model.Resources.interfaces,
  System.SysUtils,
  Vcl.Forms,
  System.IniFiles;

type

  TConfiguracao = class(TInterfacedObject, IConfiguracao)
  private const
    Arquivoconfig = 'monolitofinanceiro.cfg';
    function getconfiguração(secao, parametro, valorpadrao: string): string;
    procedure setconfiguracao(secao, parametro, valor: string);
  public
    Class function new : IConfiguracao;
    function DataultimoAcesso: string; overload;
    function DataultimoAcesso(aValue: tdatetime): IConfiguracao; overload;
    function UsuarioUltimoAcesso: string; overload;
    function UsuarioUltimoAcesso(aValue: string): IConfiguracao; overload;
    function DriverID: string; overload;
    function DriverID(aValue: string): IConfiguracao; overload;
    function Database: string; overload;
    function LockingMode(aValue: string): IConfiguracao; overload;
    function LockingMode: string; overload;
    function Database(aValue: string): IConfiguracao; overload;
  end;

implementation

{ TConfiguracao }

function TConfiguracao.Database: string;
begin
  result := getconfiguração('Banco de dados', 'Database', 'db\Sistemafinanceiro.db');
end;

function TConfiguracao.Database(aValue: string): IConfiguracao;
begin
  result := self;
  setconfiguracao('Banco de dados', 'Database', aValue);
end;

function TConfiguracao.DataultimoAcesso(aValue: tdatetime): IConfiguracao;
begin
  setconfiguracao('acesso', 'data', DateTimeToStr(aValue))
end;

function TConfiguracao.DataultimoAcesso: string;
begin
  result := getconfiguração('acesso', 'data', '');
end;

function TConfiguracao.DriverID(aValue: string): IConfiguracao;
begin
  setconfiguracao('Banco de dados', 'DriverID', aValue);
end;

function TConfiguracao.DriverID: string;
begin
  result := getconfiguração('Banco de dados', 'DriverID', 'sqlite');
end;

function TConfiguracao.getconfiguração(secao, parametro, valorpadrao: string): string;
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

function TConfiguracao.LockingMode(aValue: string): IConfiguracao;
begin
  setconfiguracao('Banco de dados', 'LockingMode', aValue);
end;

function TConfiguracao.LockingMode: string;
begin
  result := getconfiguração('Banco de dados', 'LockingMode', 'Normal');
end;

class function TConfiguracao.new: IConfiguracao;
begin
result := self.Create;
end;

procedure TConfiguracao.setconfiguracao(secao, parametro, valor: string);
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

function TConfiguracao.UsuarioUltimoAcesso: string;
begin
  result := getconfiguração('acesso', 'usuario', '');
end;

function TConfiguracao.UsuarioUltimoAcesso(aValue: string): IConfiguracao;
begin
  setconfiguracao('acesso', 'usuario', aValue);
end;

end.
