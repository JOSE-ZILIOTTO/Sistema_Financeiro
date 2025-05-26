unit Monolitofinanceiro.model.contaspagar;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.UI.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  Datasnap.DBClient,
  Datasnap.Provider,
  FireDAC.Comp.DataSet,
  Monolitofinanceiro.model.Conexao,
  Monolitofinanceiro.model.entidades.contaspagar,
  Monolitofinanceiro.model.entidades.ContaspagarDetalhe,
  Monolitofinanceiro.Utilitario, Monolitofinanceiro.model.Caixa,
  Monolitofinanceiro.model.entidades.Caixa.Lancamento;

type
  Tdmcontaspagar = class(TDataModule)
    sqlcontaspagar: TFDQuery;
    dspcontaspagar: TDataSetProvider;
    cdscontaspagar: TClientDataSet;
    cdscontaspagarid: TStringField;
    cdscontaspagarnumero: TStringField;
    cdscontaspagardescrição: TStringField;
    cdscontaspagarparcela: TIntegerField;
    cdscontaspagarvalor_compra: TFMTBCDField;
    cdscontaspagarvalor_parcela: TFMTBCDField;
    cdscontaspagarvalor_abatido: TFMTBCDField;
    cdscontaspagardata_compra: TDateField;
    cdscontaspagardata_cadastro: TDateField;
    cdscontaspagardata_vencimento: TDateField;
    cdscontaspagardata_pagamento: TDateField;
    cdscontaspagarstatus: TStringField;
    cdscontaspagarTotal: TAggregateField;
    sqlcontasPagardetalhes: TFDQuery;
    sqlcontasPagardetalhesTotal: TAggregateField;
    sqlcontasPagardetalhesid: TStringField;
    sqlcontasPagardetalhesdetalhes: TStringField;
    sqlcontasPagardetalhesid_contas_pagar: TStringField;
    sqlcontasPagardetalhesnumero_doc: TStringField;
    sqlcontasPagardetalhesvalor: TFMTBCDField;
    sqlcontasPagardetalhesdata: TDateField;
    sqlcontasPagardetalhesusuario: TStringField;
    sqlcontasPagardetalhesNome: TStringField;
  private
    { Private declarations }
    procedure Gravarcontapagar(contapagar: TModelcontaspagar; SQLGravar: TFDQuery);
    procedure Gravarcontapagardetalhe(contapagardetalhe: TModelContaPagarDetalhe; SQLGravar: TFDQuery);
  public
    { Public declarations }
    function Getcontaspagar(Id: string): TModelcontaspagar;
    procedure BaixarContaPagar(BaixarPagar: TModelContaPagarDetalhe);
  end;

var
  dmcontaspagar: Tdmcontaspagar;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ Tdmcontaspagar }

procedure Tdmcontaspagar.BaixarContaPagar(BaixarPagar: TModelContaPagarDetalhe);
var

  contapagar: TModelcontaspagar;
  SQLGravar: TFDQuery;
  sql: string;
  Lancamentocaixa: TModelCaixalancamento;
begin

  contapagar := Getcontaspagar(BaixarPagar.idcontapagar);
  try
    contapagar.valorabatido := contapagar.valorabatido + BaixarPagar.valor;

    if contapagar.valorabatido >= contapagar.valorparcela then
    begin
      contapagar.Status := 'B';
      contapagar.datapagamento := now;
    end;

    if contapagar.valorabatido < contapagar.valorparcela then
    begin
      contapagar.Status := 'A';
      contapagar.datapagamento := now;
    end;

    BaixarPagar.Id := Tutilitario.getId;
    Lancamentocaixa := TModelCaixalancamento.Create;
    try
      Lancamentocaixa.Id := Tutilitario.getId;
      Lancamentocaixa.NumeroDoc := contapagar.documneto;
      Lancamentocaixa.Descricao := Format(' Baixar conta pagar %s - Parcela %d ',
        [contapagar.documneto, contapagar.parcela]);
      Lancamentocaixa.valor := BaixarPagar.valor;
      Lancamentocaixa.Tipo := 'D';
      Lancamentocaixa.DataCadastro := now;

      SQLGravar := TFDQuery.Create(nil);
      try
        SQLGravar.Connection := dmconexao.SQlconexao;
        dmconexao.SQlconexao.StartTransaction;
        try
          SQLGravar.Connection := dmconexao.SQlconexao;
          Gravarcontapagar(contapagar, SQLGravar);
          Gravarcontapagardetalhe(BaixarPagar, SQLGravar);
          dmcaixa.GravarLancamento(Lancamentocaixa, SQLGravar);
          dmconexao.SQlconexao.Commit;
        except
        dmconexao.SQlconexao.Rollback;
        raise;
        end;
      finally
        SQLGravar.Free
      end;
    finally
      Lancamentocaixa.Free;
    end;
  finally
    contapagar.Free;
  end;

end;

function Tdmcontaspagar.Getcontaspagar(Id: string): TModelcontaspagar;
var
  SQlConsulta: TFDQuery;
begin

  SQlConsulta := TFDQuery.Create(nil);
  try
    SQlConsulta.Connection := dmconexao.SQlconexao;
    SQlConsulta.sql.Clear;
    SQlConsulta.sql.Add('select * from contas_pagar where id = :id');
    SQlConsulta.ParamByName('id').AsString := Id;
    SQlConsulta.open;
    result := TModelcontaspagar.Create;
    try
      result.Id := SQlConsulta.FieldByName('ID').AsString;
      result.documneto := SQlConsulta.FieldByName('numero').AsString;
      result.decrição := SQlConsulta.FieldByName('descricao').AsString;
      result.parcela := SQlConsulta.FieldByName('parcela').AsInteger;
      result.valorparcela := SQlConsulta.FieldByName('valor_parcela').AsCurrency;
      result.valorcompra := SQlConsulta.FieldByName('valor_compra').AsCurrency;
      result.valorabatido := SQlConsulta.FieldByName('valor_abatido').AsCurrency;
      result.datacompra := SQlConsulta.FieldByName('data_compra').AsDateTime;
      result.DataCadastro := SQlConsulta.FieldByName('data_cadastro').AsDateTime;
      result.datavencimento := SQlConsulta.FieldByName('data_vencimento').AsDateTime;
      result.datapagamento := SQlConsulta.FieldByName('data_pagamento').AsDateTime;
      result.Status := SQlConsulta.FieldByName('status').AsString;
    except
      result.Free;
      raise

    end;
  finally
    SQlConsulta.Free;
  end;
end;

procedure Tdmcontaspagar.Gravarcontapagar(contapagar: TModelcontaspagar; SQLGravar: TFDQuery);
var
  sql: string;
begin
  sql := ' UPDATE CONTAS_PAGAR SET VALOR_ABATIDO = :VALORABATIDO, ' + ' VALOR_PARCELA = :VALORPARCELA, ' +
    ' STATUS = :STATUS, ' + ' DATA_PAGAMENTO = :DATAPAGAMENTO ' + ' WHERE ID = :IDCONTAPAGAR; ';

  SQLGravar.sql.Clear;
  SQLGravar.Params.Clear;
  SQLGravar.sql.Add(sql);
  SQLGravar.ParamByName('VALORABATIDO').AsCurrency := contapagar.valorabatido;
  SQLGravar.ParamByName('VALORPARCELA').AsCurrency := contapagar.valorparcela;
  SQLGravar.ParamByName('STATUS').AsString := contapagar.Status;
  SQLGravar.ParamByName('DATAPAGAMENTO').AsDateTime := contapagar.datapagamento;
  SQLGravar.ParamByName('IDCONTAPAGAR').AsString := contapagar.Id;
  SQLGravar.ExecSQL;
end;

procedure Tdmcontaspagar.Gravarcontapagardetalhe(contapagardetalhe: TModelContaPagarDetalhe; SQLGravar: TFDQuery);
var
  sql: string;
begin

  sql := ' INSERT INTO CONTAS_PAGAR_DETALHES( ID,ID_CONTAS_PAGAR,' + 'DETALHES,VALOR,DATA,USUARIO) VALUES (:IDDETALHE,'
    + ' :IDCONTAPAGAR, :DETALHES, :VALOR, :DATA, :USUARIO);';

  SQLGravar.sql.Clear;
  SQLGravar.Params.Clear;

  SQLGravar.sql.Add(sql);
  SQLGravar.ParamByName('IDCONTAPAGAR').AsString := contapagardetalhe.idcontapagar;
  SQLGravar.ParamByName('IDDETALHE').AsString := contapagardetalhe.Id;
  SQLGravar.ParamByName('DETALHES').AsString := contapagardetalhe.detalhes;
  SQLGravar.ParamByName('VALOR').AsCurrency := contapagardetalhe.valor;
  SQLGravar.ParamByName('DATA').AsDateTime := contapagardetalhe.Data;
  SQLGravar.ParamByName('USUARIO').AsString := contapagardetalhe.usuario;

  SQLGravar.Prepare;
  SQLGravar.ExecSQL;
end;

end.
