unit Monolitofinanceiro.view.Caixa.Extrato;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Data.DB,
  Vcl.Grids, Vcl.DBGrids,
  DateUtils,
  Monolitofinanceiro.model.Caixa,
  Monolitofinanceiro.model.entidades.Caixa.Resumo,
  Monolitofinanceiro.Utilitario,
  Monolitofinanceiro.view.relatorios.Caixa.Extrato;

type
  Tfrmcaixaextrato = class(TForm)
    pnlprincipal: TPanel;
    pnltop: TPanel;
    lbldatainicial: TLabel;
    btnpesquisar: TButton;
    dateinicial: TDateTimePicker;
    datefinal: TDateTimePicker;
    pnlmeio: TPanel;
    pnlpesquisabotoes: TPanel;
    Btnfechar: TButton;
    btnImprimir: TButton;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    lbldatafinal: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    lblsaldoanterior: TLabel;
    lblsaldofinal: TLabel;
    lbltotalentradas: TLabel;
    lbltotalsaidas: TLabel;
    procedure BtnfecharClick(Sender: TObject);
    procedure btnpesquisarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure ForPemShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FResumoCaixa: TMODELRESUMOCAIXA;
    procedure Pesquisar;
  end;

var
  frmcaixaextrato: Tfrmcaixaextrato;

implementation

{$R *.dfm}

procedure Tfrmcaixaextrato.BtnfecharClick(Sender: TObject);
begin
  close;
end;

procedure Tfrmcaixaextrato.btnImprimirClick(Sender: TObject);
begin
  relcaixaextrato.Dataset(DataSource1.Dataset);
  relcaixaextrato.resumocaixa(FResumoCaixa);
  relcaixaextrato.preview;
end;

procedure Tfrmcaixaextrato.btnpesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure Tfrmcaixaextrato.FormDestroy(Sender: TObject);
begin
  FResumoCaixa.Free;
end;

procedure Tfrmcaixaextrato.ForPemShow(Sender: TObject);
begin

  dateinicial.Date := IncDay(now - 7);
  datefinal.Date := now;
  Pesquisar;

end;

procedure Tfrmcaixaextrato.Pesquisar;
var
  SQL: STRING;
begin
  SQL := 'SELECT DATA_CADASTRO, NUMERO_DOC, DESCRICAO,' + 'CASE TIPO ' + 'WHEN "D" THEN CAST(-VALOR AS REAL) ' +
    'WHEN "R" THEN CAST(VALOR AS REAL) ' + 'END VALOR ' + 'FROM CAIXAS ' +
    'WHERE DATA_CADASTRO BETWEEN :DATAINICIO AND :DATAFINAL ';

  DMcaixa.sqlcaixaextrato.close;
  DMcaixa.sqlcaixaextrato.SQL.Clear;
  DMcaixa.sqlcaixaextrato.SQL.Add(SQL);
  DMcaixa.sqlcaixaextrato.ParamByName('DATAINICIO').AsDate := dateinicial.Date;
  DMcaixa.sqlcaixaextrato.ParamByName('DATAFINAL').AsDate := datefinal.Date;
  DMcaixa.sqlcaixaextrato.Open;

  if Assigned(FResumoCaixa) then
    FResumoCaixa.Free;

  FResumoCaixa := DMcaixa.resumocaixa(dateinicial.Date, datefinal.Date);

  lblsaldoanterior.Caption := Tutilitario.fomatmoeda(FResumoCaixa.Saldoincial);
  lbltotalentradas.Caption := Tutilitario.fomatmoeda(FResumoCaixa.Totalentradas);
  lbltotalsaidas.Caption := Tutilitario.fomatmoeda(FResumoCaixa.totalSaidas);
  lblsaldofinal.Caption := Tutilitario.fomatmoeda(FResumoCaixa.Saldofinal);
end;

end.
