unit Monolitofinanceiro.view.contaspagar;

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
  Monolitofinanceiro.view.Cadastropadrao,
  Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.Grids,
  Monolitofinanceiro.view.contaspagar.Baixar,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.WinXPanels,
  Monolitofinanceiro.model.contaspagar,
  Monolitofinanceiro.Utilitario,
  Vcl.ComCtrls,
  Vcl.WinXCtrls,
  Datasnap.DBClient,
  System.DateUtils,
  Datasnap.Provider,
  Vcl.Menus,
  Monolitofinanceiro.view.relatorios.contasPagar;

type
  Tfrmcontaspagar = class(TFrmCadastroPadrao)
    lbdescricao: TLabel;
    lbvalorcompra: TLabel;
    lbldatacompra: TLabel;
    edtdescricao: TEdit;
    edtvalorcompra: TEdit;
    Cardparcela: TCardPanel;
    Cardparcelaunica: TCard;
    lblparcela: TLabel;
    lblvalorparcela: TLabel;
    lbldatavencimento: TLabel;
    lblnumerodocumento: TLabel;
    edtnumerodoc: TEdit;
    datevencimento: TDateTimePicker;
    edtvalorparcela: TEdit;
    edtparcela: TEdit;
    Datecompra: TDateTimePicker;
    lblparcelamento: TLabel;
    Toggleparcelamento: TToggleSwitch;
    Cardparcelado: TCard;
    lblquantidadeparcela: TLabel;
    lblintervalodias: TLabel;
    edtqtdparcelas: TEdit;
    edtintervalodias: TEdit;
    btnlimpar: TButton;
    btngerar: TButton;
    DBGrid2: TDBGrid;
    dsparcela: TDataSource;
    cdsparcela: TClientDataSet;
    cdsparcelaParcela: TIntegerField;
    cdsparcelavalor: TCurrencyField;
    cdsparcelavencimento: TDateField;
    cdsparceladocumento: TStringField;
    PopupMenu1: TPopupMenu;
    mnuBaixar: TMenuItem;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnincluirClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure btngerarClick(Sender: TObject);
    procedure ToggleparcelamentoClick(Sender: TObject);
    procedure btnlimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtvalorcompraExit(Sender: TObject);
    procedure edtvalorparcelaExit(Sender: TObject);
    procedure mnuBaixarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure cadastrarparcelaunica;
    procedure cadastrarparcelamento;
  public
    { Public declarations }
  protected

    procedure pesquisar; override;
  end;

var
  frmcontaspagar: Tfrmcontaspagar;

implementation

{$R *.dfm}
{ TFrmCadastroPadrao1 }

procedure Tfrmcontaspagar.btnalterarClick(Sender: TObject);
begin

  if dmcontaspagar.cdscontaspagarstatus.AsString = 'B' then
  begin
    Application.MessageBox('O documento já foi baixado e não pode ser alterado!', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if dmcontaspagar.cdscontaspagarstatus.AsString = 'C' then
  begin
    Application.MessageBox('O documento já foi cancelado e não pode ser alterado!', ' Atenção!',
      MB_OK + MB_ICONWARNING);
    Abort;
  end;
  inherited;
  Toggleparcelamento.Enabled := false;
  Toggleparcelamento.State := tssoff;
  Cardparcela.ActiveCard := Cardparcelaunica;

  edtnumerodoc.Text := dmcontaspagar.cdscontaspagarnumero.AsString;
  edtdescricao.Text := dmcontaspagar.cdscontaspagardescrição.AsString;
  edtvalorcompra.Text := Tutilitario.FormataValor(dmcontaspagar.cdscontaspagarvalor_compra.AsCurrency);
  Datecompra.Date := dmcontaspagar.cdscontaspagardata_compra.AsDateTime;
  edtparcela.Text := dmcontaspagar.cdscontaspagarparcela.AsString;
  edtvalorparcela.Text := Tutilitario.FormataValor(dmcontaspagar.cdscontaspagarvalor_parcela.AsString);
  datevencimento.Date := dmcontaspagar.cdscontaspagardata_vencimento.AsDateTime;
end;

procedure Tfrmcontaspagar.btngerarClick(Sender: TObject);
var
  contador: integer;
  quantidadeparcela: integer;
  intervalodias: integer;
  valorparcela: Currency;
  valorcompra: Currency;
  valorResiduo: Currency;
begin
  if not trystrtocurr(edtvalorcompra.Text, valorcompra) then
  begin
    edtvalorcompra.SetFocus;
    Application.MessageBox('Valor da Compra inválido!', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if not trystrtoint(edtqtdparcelas.Text, quantidadeparcela) then
  begin
    edtqtdparcelas.SetFocus;
    Application.MessageBox('Quantdade de parcelas inválida', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if not trystrtoint(edtintervalodias.Text, intervalodias) then
  begin
    edtintervalodias.SetFocus;
    Application.MessageBox('Intervalo em dias inválido', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  valorparcela := Tutilitario.TruncarValor(valorcompra / quantidadeparcela);
  // (trunc(valorcompra / quantidadeparcela * 100)) / 100;
  valorResiduo := valorcompra - (valorparcela * quantidadeparcela);

  cdsparcela.EmptyDataSet;

  for contador := 1 to quantidadeparcela do
  begin
    cdsparcela.append;
    cdsparcelaParcela.AsInteger := contador;
    cdsparcelavalor.AsCurrency := valorparcela + valorResiduo;
    valorResiduo := 0;
    cdsparcelavencimento.AsDateTime := incday(Datecompra.Date, intervalodias * contador);
    cdsparcela.Post;
  end;
end;

procedure Tfrmcontaspagar.btnImprimirClick(Sender: TObject);
begin
  inherited;
relrelatorioPagar.Dataset(DataSource1.DataSet);
relrelatorioPagar.preview;
end;

procedure Tfrmcontaspagar.btnincluirClick(Sender: TObject);
begin
  inherited;
  Datecompra.Date := now;
  datevencimento.Date := now;

  Toggleparcelamento.Enabled := true;
  Toggleparcelamento.State := tssoff;
  Cardparcela.ActiveCard := Cardparcelaunica;
  cdsparcela.EmptyDataSet;
end;

procedure Tfrmcontaspagar.btnlimparClick(Sender: TObject);
begin
  cdsparcela.EmptyDataSet;
end;

procedure Tfrmcontaspagar.btnSalvarClick(Sender: TObject);
begin
  if Toggleparcelamento.State = tssoff then
  begin
    cadastrarparcelaunica;
    inherited;
  end
  else
    cadastrarparcelamento;

end;

procedure Tfrmcontaspagar.cadastrarparcelamento;
var
  valorcompra: Currency;

begin

  if not trystrtocurr(edtvalorcompra.Text, valorcompra) then
  begin
    edtvalorcompra.SetFocus;
    Application.MessageBox('Valor da Compra inválido!', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  cdsparcela.First;
  while not cdsparcela.Eof do

  begin
    if cdsparcelaParcela.AsInteger < 0 then
    begin
      Application.MessageBox('Número da Parcela inválido!', ' Atenção!', MB_OK + MB_ICONWARNING);
      Abort;
    end;

    if cdsparceladocumento.AsString = '' then
    begin
      Application.MessageBox('Número do documento inválido!', ' Atenção!', MB_OK + MB_ICONWARNING);
      Abort;
    end;

    if cdsparcelavalor.AsCurrency < 0.01 then
    begin
      Application.MessageBox('Valor da parcela inválido!', ' Atenção!', MB_OK + MB_ICONWARNING);
      Abort;
    end;

    cdsparcela.Next;
  end;
  cdsparcela.First;
  while not cdsparcela.Eof do
  begin
    if dmcontaspagar.cdscontaspagar.State in [dsBrowse, dsinactive] then
      dmcontaspagar.cdscontaspagar.Insert;

    dmcontaspagar.cdscontaspagarid.AsString := Tutilitario.getId;
    dmcontaspagar.cdscontaspagardata_cadastro.AsDateTime := now;
    dmcontaspagar.cdscontaspagarstatus.AsString := 'A';
    dmcontaspagar.cdscontaspagarvalor_abatido.AsCurrency := 0;

    dmcontaspagar.cdscontaspagarnumero.AsString := cdsparceladocumento.AsString;
    dmcontaspagar.cdscontaspagardescrição.AsString :=
      Format('%s - Parcela %d', [edtdescricao.Text, cdsparcelaParcela.AsInteger]);
    dmcontaspagar.cdscontaspagarvalor_compra.AsCurrency := valorcompra;
    dmcontaspagar.cdscontaspagarparcela.AsCurrency := cdsparcelaParcela.AsInteger;
    dmcontaspagar.cdscontaspagarvalor_parcela.AsCurrency := cdsparcelavalor.AsCurrency;
    dmcontaspagar.cdscontaspagardata_vencimento.AsDateTime := cdsparcelavencimento.AsDateTime;
    dmcontaspagar.cdscontaspagardata_compra.AsDateTime := Datecompra.Date;
    dmcontaspagar.cdscontaspagar.Post;
    dmcontaspagar.cdscontaspagar.ApplyUpdates(0);

    cdsparcela.Next;
  end;
  Application.MessageBox('Parcelas Cadastradas com sucesso!', ' Atenção!', MB_OK + MB_ICONINFORMATION);
  pesquisar;
  pnlprincipal.ActiveCard := Cardpesquisa;

end;

procedure Tfrmcontaspagar.cadastrarparcelaunica;
var
  Parcela: Currency;
  valorcompra: Currency;
  valorparcela: Currency;
begin
  if edtnumerodoc.Text = '' then
  begin
    edtnumerodoc.SetFocus;
    Application.MessageBox('O campo Numero do Documento não pode  ser vazio', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if not trystrtocurr(edtvalorcompra.Text, valorcompra) then
  begin
    edtvalorcompra.SetFocus;
    Application.MessageBox('Valor da Compra inválido!', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if not trystrtocurr(edtvalorparcela.Text, valorparcela) then
  begin
    edtvalorparcela.SetFocus;
    Application.MessageBox('Valor da Parcela  inválido!', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if not trystrtocurr(edtparcela.Text, Parcela) then
  begin
    edtparcela.SetFocus;
    Application.MessageBox('Valor do numero da Parcela  inválido!', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if datevencimento.Date < Datecompra.Date then
  begin
    datevencimento.SetFocus;
    Application.MessageBox('A data de vencimento não pode ser menor que a data de compra!', ' Atenção!',
      MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if DataSource1.State in [dsinsert] then
  begin
    dmcontaspagar.cdscontaspagarid.AsString := Tutilitario.getId;
    dmcontaspagar.cdscontaspagardata_cadastro.AsDateTime := now;
    dmcontaspagar.cdscontaspagarstatus.AsString := 'A';
    dmcontaspagar.cdscontaspagarvalor_abatido.AsCurrency := 0;
  end;

  dmcontaspagar.cdscontaspagarnumero.AsString := edtnumerodoc.Text;
  dmcontaspagar.cdscontaspagardescrição.AsString := edtdescricao.Text;
  dmcontaspagar.cdscontaspagarvalor_compra.AsCurrency := valorcompra;
  dmcontaspagar.cdscontaspagarparcela.AsCurrency := Parcela;
  dmcontaspagar.cdscontaspagarvalor_parcela.AsCurrency := valorparcela;
  dmcontaspagar.cdscontaspagardata_vencimento.AsDateTime := datevencimento.Date;
  dmcontaspagar.cdscontaspagardata_compra.AsDateTime := Datecompra.Date;

  inherited;
end;

procedure Tfrmcontaspagar.edtvalorcompraExit(Sender: TObject);
begin
  inherited;
  edtvalorcompra.Text := Tutilitario.FormataValor(edtvalorcompra.Text);
end;

procedure Tfrmcontaspagar.edtvalorparcelaExit(Sender: TObject);
begin
  inherited;
  edtvalorparcela.Text := Tutilitario.FormataValor(edtvalorparcela.Text);
end;

procedure Tfrmcontaspagar.ExcluirClick(Sender: TObject);
begin
  if dmcontaspagar.cdscontaspagarstatus.AsString = 'C' then
  begin
    Application.MessageBox('O documento já se encontra cancelado!', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort
  end;

  if Application.MessageBox('Deseja realmente cancelar esse documento?', 'pergunta', MB_yesno) <> mryes then
    exit;

  try
    dmcontaspagar.cdscontaspagar.Edit;
    dmcontaspagar.cdscontaspagarstatus.AsString := 'C';
    dmcontaspagar.cdscontaspagar.Post;
    dmcontaspagar.cdscontaspagar.ApplyUpdates(0);
    Application.MessageBox('Documento cancelado com sucesso', ' Atenção!', MB_OK + MB_ICONINFORMATION);
    pesquisar;
  except
    on E: Exception do
      Application.MessageBox(pwidechar(E.Message), 'Erro ao cancelar documento', MB_OK + MB_ICONERROR)
  end;

end;

procedure Tfrmcontaspagar.FormCreate(Sender: TObject);
begin
  inherited;
  edtvalorcompra.OnKeyPress := Tutilitario.KeyPressvalor;
  edtvalorparcela.OnKeyPress := Tutilitario.KeyPressvalor;
end;

procedure Tfrmcontaspagar.mnuBaixarClick(Sender: TObject);
begin
  inherited;
  FrmBaixarContasPagar.Baixarcontapagar(DataSource1.DataSet.FieldByName('id').AsString);
  pesquisar;
end;

procedure Tfrmcontaspagar.pesquisar;
begin
  var
    Filtropesquisa: string;

  begin

    Filtropesquisa := Tutilitario.likepesquisar(Edtpesquisa.Text, DBGrid1);
    dmcontaspagar.cdscontaspagar.Close;
    dmcontaspagar.cdscontaspagar.CommandText := 'select * from contas_pagar where 1 = 1  ' + Filtropesquisa;
    dmcontaspagar.cdscontaspagar.open;
    inherited
  end;
end;

procedure Tfrmcontaspagar.ToggleparcelamentoClick(Sender: TObject);
begin
  inherited;
  Cardparcela.ActiveCard := Cardparcelaunica;
  if Toggleparcelamento.State = tssOn then
    Cardparcela.ActiveCard := Cardparcelado
end;

end.
