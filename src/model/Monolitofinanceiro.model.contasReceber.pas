unit Monolitofinanceiro.model.contasReceber;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  Monolitofinanceiro.model.Conexao,
  Monolitofinanceiro.model.entidades.contasReceber,
  Monolitofinanceiro.model.entidades.Contasreceberdetalhe,
  Monolitofinanceiro.Utilitario,
  Monolitofinanceiro.model.entidades.Caixa.Lancamento,
  Monolitofinanceiro.model.Caixa;

type
  TdmcontasReceber = class(TDataModule)
    sqlcontasReceber: TFDQuery;
    dspcontasReceber: TDataSetProvider;
    cdscontasReceber: TClientDataSet;
    cdscontasReceberid: TStringField;
    cdscontasRecebernumero: TStringField;
    cdscontasReceberdescricao: TStringField;
    cdscontasReceberparcela: TIntegerField;
    cdscontasRecebervalor_venda: TFMTBCDField;
    cdscontasRecebervalor_parcela: TFMTBCDField;
    cdscontasRecebervalor_abatido: TFMTBCDField;
    cdscontasReceberdata_venda: TDateField;
    cdscontasReceberdata_cadastro: TDateField;
    cdscontasReceberdata_vencimento: TDateField;
    cdscontasReceberdata_recebimento: TDateField;
    cdscontasReceberstatus: TStringField;
    sqlcontasReceberdetalhes: TFDQuery;
    sqlcontasReceberdetalhesid: TStringField;
    sqlcontasReceberdetalhesid_contas_receber: TStringField;
    sqlcontasReceberdetalhesdetalhes: TStringField;
    sqlcontasReceberdetalhesnumero_doc: TStringField;
    sqlcontasReceberdetalhesvalor: TFMTBCDField;
    sqlcontasReceberdetalhesdata: TDateField;
    sqlcontasReceberdetalhesusuario: TStringField;
    cdscontasReceberTotal: TAggregateField;
    sqlcontasReceberdetalhesTotal: TAggregateField;
    sqlcontasReceberdetalheslogin: TStringField;
    sqlcontasReceberdetalhessenha: TStringField;
    sqlcontasReceberdetalhesstatus: TStringField;
    sqlcontasReceberdetalhesdata_cadastro: TDateField;
    sqlcontasReceberdetalhessenha_temporaria: TStringField;
    sqlcontasReceberdetalhesid_1: TStringField;
    sqlcontasReceberdetalhesNOME: TStringField;
    sqlrelcontasreceberdetalhado: TFDQuery;
    AggregateField1: TAggregateField;
    sqlrelcontasreceberdetalhadoid: TStringField;
    sqlrelcontasreceberdetalhadoid_contas_receber: TStringField;
    sqlrelcontasreceberdetalhadodetalhes: TStringField;
    sqlrelcontasreceberdetalhadonumero_doc: TStringField;
    sqlrelcontasreceberdetalhadovalor: TFMTBCDField;
    sqlrelcontasreceberdetalhadodata: TDateField;
    sqlrelcontasreceberdetalhadousuario: TStringField;
    sqlrelcontasreceberdetalhadonumero: TStringField;
    sqlrelcontasreceberdetalhadodescricao: TStringField;
    sqlrelcontasreceberdetalhadoparcela: TIntegerField;
    sqlrelcontasreceberdetalhadovalor_venda: TFMTBCDField;
    sqlrelcontasreceberdetalhadovalor_parcela: TFMTBCDField;
    sqlrelcontasreceberdetalhadovalor_abatido: TFMTBCDField;
    sqlrelcontasreceberdetalhadodata_venda: TDateField;
    sqlrelcontasreceberdetalhadodata_cadastro: TDateField;
    sqlrelcontasreceberdetalhadodata_vencimento: TDateField;
    sqlrelcontasreceberdetalhadodata_recebimento: TDateField;
    sqlrelcontasreceberdetalhadostatus: TStringField;
    sqlrelcontasreceberdetalhadoid_1: TStringField;
  private
    { Private declarations }
    procedure Gravarcontareceber(contareceber: TModelcontasreceber; SQLGravar: TFDQuery);
    procedure Gravarcontareceberdetalhe(contareceberdetalhe: TModelContareceberDetalhe; SQLGravar: TFDQuery);
  public
    { Public declarations }
    function Getcontasreceber(Id: string): TModelcontasreceber;
    procedure BaixarContareceber(BaixarPagar: TModelContareceberDetalhe);
  end;

var
  dmcontasReceber: TdmcontasReceber;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TdmcontasReceber }

procedure TdmcontasReceber.BaixarContareceber(BaixarPagar: TModelContareceberDetalhe);
var

  contareceber: TModelcontasreceber;
  SQLGravar: TFDQuery;
  LancamentoCaixa: Tmodelcaixalancamento;
begin

  contareceber := Getcontasreceber(BaixarPagar.idcontareceber);
  try
    contareceber.valorabatido := contareceber.valorabatido + BaixarPagar.valor;

    if contareceber.valorabatido >= contareceber.valorparcela then
    begin
      contareceber.Status := 'B';
      contareceber.datarecebimento := now;
    end;

    if contareceber.valorabatido < contareceber.valorparcela then
    begin
      contareceber.Status := 'A';
      contareceber.datarecebimento := now;
    end;

    BaixarPagar.Id := Tutilitario.getId;

    LancamentoCaixa := Tmodelcaixalancamento.Create;
    try

      LancamentoCaixa.Id := Tutilitario.getId;
      LancamentoCaixa.NumeroDoc := contareceber.documneto;
      LancamentoCaixa.Descricao := Format(' Baixar conta Receber %s - Parcela %d ',
      [contareceber.documneto, contareceber.parcela]);
      LancamentoCaixa.valor := BaixarPagar.valor;
      LancamentoCaixa.Tipo := 'R';
      LancamentoCaixa.DataCadastro := now;

      SQLGravar := TFDQuery.Create(nil);
      try
        SQLGravar.Connection := dmconexao.SQlconexao;
        dmconexao.SQlconexao.StartTransaction;
        try
        Gravarcontareceber(contareceber, SQLGravar);
        Gravarcontareceberdetalhe(BaixarPagar, SQLGravar);
        dmcaixa.GravarLancamento(LancamentoCaixa, SQLGravar);
        dmconexao.SQlconexao.Commit;
        except
         dmconexao.SQlconexao.Rollback;
         raise;
        end;
      finally
        SQLGravar.Free
      end;
    finally
      contareceber.Free;
    end;
  finally
    LancamentoCaixa.Free;
  end;

end;

function TdmcontasReceber.Getcontasreceber(Id: string): TModelcontasreceber;
var
  SQlConsulta: TFDQuery;
begin

  SQlConsulta := TFDQuery.Create(nil);
  try
    SQlConsulta.Connection := dmconexao.SQlconexao;
    SQlConsulta.sql.Clear;
    SQlConsulta.sql.Add('select * from CONTAS_RECEBER where id = :id');
    SQlConsulta.ParamByName('id').AsString := Id;
    SQlConsulta.open;
    result := TModelcontasreceber.Create;
    try
      result.Id := SQlConsulta.FieldByName('ID').AsString;
      result.documneto := SQlConsulta.FieldByName('numero').AsString;
      result.decrição := SQlConsulta.FieldByName('descricao').AsString;
      result.parcela := SQlConsulta.FieldByName('parcela').AsInteger;
      result.valorparcela := SQlConsulta.FieldByName('valor_parcela').AsCurrency;
      result.valorvenda := SQlConsulta.FieldByName('valor_venda').AsCurrency;
      result.valorabatido := SQlConsulta.FieldByName('valor_abatido').AsCurrency;
      result.datavenda := SQlConsulta.FieldByName('data_venda').AsDateTime;
      result.DataCadastro := SQlConsulta.FieldByName('data_cadastro').AsDateTime;
      result.datavencimento := SQlConsulta.FieldByName('data_vencimento').AsDateTime;
      result.datarecebimento := SQlConsulta.FieldByName('data_recebimento').AsDateTime;
      result.Status := SQlConsulta.FieldByName('status').AsString;
    except
      result.Free;
      raise

    end;
  finally
    SQlConsulta.Free;
  end;
end;

procedure TdmcontasReceber.Gravarcontareceber(contareceber: TModelcontasreceber; SQLGravar: TFDQuery);
var
  sql: string;
begin
  sql := ' UPDATE CONTAS_RECEBER SET VALOR_ABATIDO = :VALORABATIDO, ' + ' VALOR_PARCELA = :VALORPARCELA, ' +
    ' STATUS = :STATUS, ' + ' DATA_RECEBIMENTO = :DATARECEBIMENTO ' + ' WHERE ID = :IDCONTARECEBER; ';

  SQLGravar.sql.Clear;
  SQLGravar.Params.Clear;
  SQLGravar.sql.Add(sql);
  SQLGravar.ParamByName('VALORABATIDO').AsCurrency := contareceber.valorabatido;
  SQLGravar.ParamByName('VALORPARCELA').AsCurrency := contareceber.valorparcela;
  SQLGravar.ParamByName('STATUS').AsString := contareceber.Status;
  SQLGravar.ParamByName('DATARECEBIMENTO').AsDateTime := contareceber.datarecebimento;
  SQLGravar.ParamByName('IDCONTARECEBER').AsString := contareceber.Id;
  SQLGravar.ExecSQL;
end;

procedure TdmcontasReceber.Gravarcontareceberdetalhe(contareceberdetalhe: TModelContareceberDetalhe;
  SQLGravar: TFDQuery);
var
  sql: string;
begin

  sql := ' INSERT INTO CONTAS_RECEBER_DETALHES( ID,ID_CONTAS_RECEBER,' +
    'DETALHES,VALOR,DATA,USUARIO) VALUES (:IDDETALHE,' + ' :IDCONTARECEBER, :DETALHES, :VALOR, :DATA, :USUARIO);';

  SQLGravar.sql.Clear;
  SQLGravar.Params.Clear;

  SQLGravar.sql.Add(sql);
  SQLGravar.ParamByName('IDCONTARECEBER').AsString := contareceberdetalhe.idcontareceber;
  SQLGravar.ParamByName('IDDETALHE').AsString := contareceberdetalhe.Id;
  SQLGravar.ParamByName('DETALHES').AsString := contareceberdetalhe.detalhes;
  SQLGravar.ParamByName('VALOR').AsCurrency := contareceberdetalhe.valor;
  SQLGravar.ParamByName('DATA').AsDateTime := contareceberdetalhe.Data;
  SQLGravar.ParamByName('USUARIO').AsString := contareceberdetalhe.usuario;

  SQLGravar.Prepare;
  SQLGravar.ExecSQL;
end;

end.
