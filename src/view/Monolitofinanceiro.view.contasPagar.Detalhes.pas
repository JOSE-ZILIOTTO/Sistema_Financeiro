unit Monolitofinanceiro.view.contasPagar.Detalhes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  System.ImageList,
  Vcl.ImgList,
  Vcl.StdCtrls,
  Monolitofinanceiro.model.contaspagar,
  Monolitofinanceiro.model.entidades.contaspagar,
  Monolitofinanceiro.Utilitario;

type
  TfrmcontasPagardetalhes = class(TForm)
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
    lblvalorcompra: TLabel;
    lbldescricao: TLabel;
    Panel10: TPanel;
    lblquantidaderegistros: TLabel;
    lbltotalPagamentos: TLabel;
    procedure BtnfecharconsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ExibircontasPagardetalhes(IDPagardetalhes: string);
  end;

var
  frmcontasPagardetalhes: TfrmcontasPagardetalhes;

implementation

{$R *.dfm}

procedure TfrmcontasPagardetalhes.BtnfecharconsultaClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmcontasPagardetalhes.ExibircontasPagardetalhes(IDPagardetalhes: string);
var
  ContaPagar: TModelcontaspagar;
  SQL: string;
begin
  if IDPagardetalhes.IsEmpty then
    raise Exception.Create('ID do contas a receber inválido!');
  ContaPagar := dmcontaspagar.Getcontaspagar(IDPagardetalhes);
  try
    if IDPagardetalhes.IsEmpty then
      raise Exception.Create('Contas a receber não encontrado');
    lblnumerodocumento.Caption := ContaPagar.documneto;
    lbldescricao.Caption := ContaPagar.decrição;
    lblvencimento.Caption := FormatDateTime('DD/MM/YYYY', ContaPagar.datavencimento);
    lblnumeroparcela.Caption := inttostr(ContaPagar.parcela);
    lblvalorparcela.Caption := Tutilitario.fomatmoeda(ContaPagar.valorparcela);
    lblvalorcompra.Caption := Tutilitario.fomatmoeda(ContaPagar.valorcompra);
  finally
    ContaPagar.Free
  end;

  SQL := 'SELECT * FROM CONTAS_PAGAR_DETALHES' +
   ' LEFT JOIN USUARIOS ON CONTAS_PAGAR_DETALHES.USUARIO = USUARIOS.ID' +
   ' WHERE ID_CONTAS_PAGAR = :IDCONTASPAGAR';
  dmcontasPagar.sqlcontasPagardetalhes.Close;
  dmcontasPagar.sqlcontasPagardetalhes.SQL.Clear;
  dmcontasPagar.sqlcontasPagardetalhes.Params.Clear;
  dmcontasPagar.sqlcontasPagardetalhes.SQL.Add(SQL);
  dmcontasPagar.sqlcontasPagardetalhes.ParamByName('IDCONTASPAGAR').AsString := IDPagardetalhes;
  dmcontasPagar.sqlcontasPagardetalhes.Prepare;
  dmcontasPagar.sqlcontasPagardetalhes.Open;

    lblquantidaderegistros.Caption := Format(' Quantidade de Registro: %d',[ Datasource1.DataSet.RecordCount]);
  lbltotalPagamentos.Caption := ' Total de Pagamentos: R$ ' + Tutilitario.FormataValor
  (dmcontasPagar.sqlcontasPagardetalhes.FieldByName('Total').AsString);

    self.ShowModal;
end;

end.
