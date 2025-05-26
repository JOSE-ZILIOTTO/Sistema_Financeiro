unit Monolitofinanceiro.model.Caixa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Monolitofinanceiro.model.Conexao,
  Monolitofinanceiro.model.entidades.Caixa.Resumo,
  Monolitofinanceiro.model.entidades.Caixa.Lancamento;

type
  TdmCaixa = class(TDataModule)
    sqlcaixa: TFDQuery;
    dspCaixa: TDataSetProvider;
    cdsCaixa: TClientDataSet;
    cdsCaixanumero_doc: TStringField;
    cdsCaixavalor: TFMTBCDField;
    cdsCaixatipo: TWideStringField;
    cdsCaixadata_cadastro: TDateField;
    sqlcaixanumero_doc: TStringField;
    sqlcaixavalor: TFMTBCDField;
    sqlcaixatipo: TWideStringField;
    sqlcaixadata_cadastro: TDateField;
    sqlcaixaid: TStringField;
    cdsCaixaid: TStringField;
    sqlcaixadescricao: TStringField;
    cdsCaixadescricao: TStringField;
    sqlcaixaextrato: TFDQuery;
  private
    { Private declarations }
    function getsaldoanterior(Data: Tdate): Currency;
    function gettotalentradascaixa(datainicial, datafinal: Tdate): Currency;
    function gettotalSaidascaixa(datainicial, datafinal: Tdate): Currency;
  public
    { Public declarations }
    function Resumocaixa(datainicial, datafinal: Tdate): Tmodelresumocaixa;
    Procedure GravarLancamento (aValue : TModelCaixalancamento; SQLgravar : TFDQuery);
  end;

var
  dmCaixa: TdmCaixa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TdmCaixa }

function TdmCaixa.getsaldoanterior(Data: Tdate): Currency;
var
  SQlconsulta: TFDQuery;
  totalentradas: Currency;
  Totalsaidas: Currency;
begin
  result := 0;
  SQlconsulta := TFDQuery.Create(nil);
  try
    SQlconsulta.Connection := dmconexao.SQlconexao;
    SQlconsulta.sql.Clear;
    SQlconsulta.sql.Add('select ifnull (sum(valor), 0) as valor from caixas where tipo = ''R''');
    SQlconsulta.sql.Add('and data_cadastro  < :DATA');
    SQlconsulta.ParamByName('DATA').AsDate := Data;
    SQlconsulta.Open;
    totalentradas := SQlconsulta.FieldByName('Valor').AsCurrency;

    SQlconsulta.Connection := dmconexao.SQlconexao;
    SQlconsulta.sql.Clear;
    SQlconsulta.sql.Add('select ifnull (sum(valor), 0) as valor from caixas where tipo = ''D''');
    SQlconsulta.sql.Add('and data_cadastro  < :DATA');
    SQlconsulta.ParamByName('DATA').AsDate := Data;
    SQlconsulta.Open;
    Totalsaidas := SQlconsulta.FieldByName('Valor').AsCurrency;
  finally
    SQlconsulta.free
  end;
  result := totalentradas - Totalsaidas;
end;

function TdmCaixa.gettotalentradascaixa(datainicial, datafinal: Tdate): Currency;
var
  SQlconsulta: TFDQuery;
begin
  result := 0;
  SQlconsulta := TFDQuery.Create(nil);
  try
    SQlconsulta.Connection := dmconexao.SQlconexao;
    SQlconsulta.sql.Clear;
    SQlconsulta.sql.Add('select ifnull (sum(valor), 0) as valor from caixas where tipo = ''R''');
    SQlconsulta.sql.Add('and data_cadastro between :DATAINICIAL AND :DATAFINAL');
    SQlconsulta.ParamByName('DATAINICIAL').AsDate := datainicial;
    SQlconsulta.ParamByName('DATAFINAL').AsDate := datafinal;
    SQlconsulta.Open;
    result := SQlconsulta.FieldByName('valor').AsCurrency;
  finally
    SQlconsulta.free;
  end;

end;

function TdmCaixa.gettotalSaidascaixa(datainicial, datafinal: Tdate): Currency;
var
  SQlconsulta: TFDQuery;
begin
  result := 0;
  SQlconsulta := TFDQuery.Create(nil);
  try
    SQlconsulta.Connection := dmconexao.SQlconexao;
    SQlconsulta.sql.Clear;
    SQlconsulta.sql.Add('select ifnull (sum(valor), 0) as valor from caixas where tipo = ''D''');
    SQlconsulta.sql.Add('and data_cadastro between :DATAINICIAL AND :DATAFINAL');
    SQlconsulta.ParamByName('DATAINICIAL').AsDate := datainicial;
    SQlconsulta.ParamByName('DATAFINAL').AsDate := datafinal;
    SQlconsulta.Open;
    result := SQlconsulta.FieldByName('valor').AsCurrency;
  finally
    SQlconsulta.free;
  end;
end;

procedure TdmCaixa.GravarLancamento(aValue: TModelCaixalancamento; SQLgravar: TFDQuery);
var
SQL : string;
begin
 SQL := 'INSERT INTO CAIXAS (ID,NUMERO_DOC, DESCRICAO, ' +
        'VALOR, TIPO, DATA_CADASTRO) VALUES (:IDCAIXA, ' +
        ':NUMERO_DOC_CAIXA, :DESCRICAO_CAIXA, :VALOR_CAIXA, ' +
        ':TIPO, :DATA_CADASTRO) ';

  SQLgravar.SQL.Clear;
  SQLgravar.Params.Clear ;
  SQLgravar.SQL.Add(SQL);
  SQLgravar.ParamByName('IDCAIXA').AsString := aValue.ID;
  SQLgravar.ParamByName('NUMERO_DOC_CAIXA').AsString := aValue.NumeroDoc;
  SQLgravar.ParamByName('DESCRICAO_CAIXA').AsString := aValue.Descricao;
  SQLgravar.ParamByName('VALOR_CAIXA').AsCurrency := aValue.Valor;
  SQLgravar.ParamByName('TIPO').AsString := aValue.Tipo;
  SQLgravar.ParamByName('DATA_CADASTRO').AsDate := aValue.DataCadastro;
  SQLgravar.Prepare;
  SQLgravar.ExecSQL;
end;

function TdmCaixa.Resumocaixa(datainicial, datafinal: Tdate): Tmodelresumocaixa;
begin
  if datainicial > datafinal then
  raise Exception.Create('Período inválido');
  result := TMODELRESUMOCAIXA.Create;
  try
    result.Saldoincial := getsaldoanterior(datainicial);
    result.Totalentradas := gettotalentradascaixa(datainicial,datafinal);
    result.totalSaidas := gettotalSaidascaixa(datainicial, datafinal);
  except
    result.Free;
    raise
  end;
end;

end.
