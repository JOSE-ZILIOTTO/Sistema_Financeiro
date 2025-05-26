unit Monolitofinanceiro.view.contasReceber.Detalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Monolitofinanceiro.model.contasReceber,
  Monolitofinanceiro.model.entidades.contasReceber,
  Monolitofinanceiro.Utilitario;

type
  Tfrmcontasreceberdetalhes = class(TForm)
    pnlprincipal: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Datasource1: TDataSource;
    ImageList1: TImageList;
    Btnfecharconsulta: TButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblnumeroparcela: TLabel;
    lblvencimento: TLabel;
    lblnumerodocumento: TLabel;
    Panel8: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel9: TPanel;
    lblvalorparcela: TLabel;
    lblvalorvenda: TLabel;
    lbldescricao: TLabel;
    Panel10: TPanel;
    lblquantidadereceber: TLabel;
    lbltotalrecebimentos: TLabel;
    procedure BtnfecharconsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Exibircontasreceberdetalhes(IDReceberdetalhes: string);
  end;

var
  frmcontasreceberdetalhes: Tfrmcontasreceberdetalhes;

implementation

{$R *.dfm}

procedure Tfrmcontasreceberdetalhes.BtnfecharconsultaClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure Tfrmcontasreceberdetalhes.Exibircontasreceberdetalhes(IDReceberdetalhes: string);
var
  contareceber: Tmodelcontasreceber;
  SQL: string;
begin
  if IDReceberdetalhes.IsEmpty then
    raise Exception.Create('ID do contas a receber inválido!');
  contareceber := dmcontasreceber.Getcontasreceber(IDReceberdetalhes);
  try
    if IDReceberdetalhes.IsEmpty then
      raise Exception.Create('Contas a receber não encontrado');
    lblnumerodocumento.Caption := contareceber.documneto;
    lbldescricao.Caption := contareceber.decrição;
    lblvencimento.Caption := FormatDateTime('DD/MM/YYYY', contareceber.datavencimento);
    lblnumeroparcela.Caption := inttostr(contareceber.parcela);
    lblvalorparcela.Caption := Tutilitario.fomatmoeda(contareceber.valorparcela);
    lblvalorvenda.Caption := Tutilitario.fomatmoeda(contareceber.valorvenda);
  finally
    contareceber.Free
  end;

  SQL := 'SELECT * FROM CONTAS_RECEBER_DETALHES' +
   ' LEFT JOIN USUARIOS ON CONTAS_RECEBER_DETALHES.USUARIO = USUARIOS.ID' +
   ' WHERE ID_CONTAS_RECEBER = :IDCONTASRECEBER';
  dmcontasReceber.sqlcontasreceberdetalhes.Close;
  dmcontasreceber.sqlcontasreceberdetalhes.SQL.Clear;
  dmcontasreceber.sqlcontasreceberdetalhes.Params.Clear;
  dmcontasreceber.sqlcontasreceberdetalhes.SQL.Add(SQL);
  dmcontasreceber.sqlcontasreceberdetalhes.ParamByName('IDCONTASRECEBER').AsString := IDReceberdetalhes;
  dmcontasreceber.sqlcontasreceberdetalhes.Prepare;
  dmcontasreceber.sqlcontasreceberdetalhes.Open;

    lblquantidadereceber.Caption := Format(' Quantidade de Registro: %d',[ Datasource1.DataSet.RecordCount]);
  lbltotalrecebimentos.Caption := ' Total de Recebimentos: R$ ' + Tutilitario.FormataValor(dmcontasReceber.sqlcontasreceberdetalhes.FieldByName('Total').AsString);

    self.ShowModal;
end;

end.
