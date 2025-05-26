unit Monolitofinanceiro.view.contasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Monolitofinanceiro.view.Cadastropadrao,
  Data.DB,
  Monolitofinanceiro.view.relatorios.contasreceber,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
   Vcl.WinXPanels,
  Monolitofinanceiro.model.contasReceber,
  Datasnap.DBClient,
  Vcl.WinXCtrls, Vcl.ComCtrls,
  Monolitofinanceiro.Utilitario,
  System.DateUtils, Vcl.Menus,
  Monolitofinanceiro.view.contasreceber.Baixar;

type
  TfrmcontasReceber = class(TFrmCadastroPadrao)
    dsparcela: TDataSource;
    cdsparcela: TClientDataSet;
    cdsparcelaParcela: TIntegerField;
    cdsparcelavalor: TCurrencyField;
    cdsparcelavencimento: TDateField;
    cdsparceladocumento: TStringField;
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
    Cardparcelado: TCard;
    lblquantidadeparcela: TLabel;
    lblintervalodias: TLabel;
    edtqtdparcelas: TEdit;
    edtintervalodias: TEdit;
    btnlimpar: TButton;
    btngerar: TButton;
    DBGrid2: TDBGrid;
    Datevenda: TDateTimePicker;
    edtdescricao: TEdit;
    edtvalorvenda: TEdit;
    lbdescricao: TLabel;
    lbldatavenda: TLabel;
    lblparcelamento: TLabel;
    lbvalorvenda: TLabel;
    Toggleparcelamento: TToggleSwitch;
    PopupMenu1: TPopupMenu;
    mnucontareceberbaixar: TMenuItem;
    procedure btnalterarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure btngerarClick(Sender: TObject);
    procedure btnincluirClick(Sender: TObject);
    procedure btnlimparClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtvalorparcelaExit(Sender: TObject);
    procedure edtvalorvendaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToggleparcelamentoClick(Sender: TObject);
    procedure mnucontareceberbaixarClick(Sender: TObject);
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
  frmcontasReceber: TfrmcontasReceber;

implementation

{$R *.dfm}
{ TfrmcontasReceber }

procedure TfrmcontasReceber.btnalterarClick(Sender: TObject);
begin

  if dmcontasreceber.cdscontasreceberstatus.AsString = 'B' then
  begin
    Application.MessageBox('O documento já foi baixado e não pode ser alterado!', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if dmcontasreceber.cdscontasreceberstatus.AsString = 'C' then
  begin
    Application.MessageBox('O documento já foi cancelado e não pode ser alterado!', ' Atenção!',
      MB_OK + MB_ICONWARNING);
    Abort;
  end;
  inherited;
  Toggleparcelamento.Enabled := false;
  Toggleparcelamento.State := tssoff;
  Cardparcela.ActiveCard := Cardparcelaunica;

  edtnumerodoc.Text := dmcontasreceber.cdscontasrecebernumero.AsString;
  edtdescricao.Text := dmcontasreceber.cdscontasReceberdescricao.AsString;
  edtvalorvenda.Text := Tutilitario.FormataValor(dmcontasreceber.cdscontasRecebervalor_venda.AsCurrency);
  Datevenda.Date := dmcontasreceber.cdscontasReceberdata_venda.AsDateTime;
  edtparcela.Text := dmcontasreceber.cdscontasreceberparcela.AsString;
  edtvalorparcela.Text := Tutilitario.FormataValor(dmcontasreceber.cdscontasRecebervalor_parcela.AsString);
  datevencimento.Date := dmcontasreceber.cdscontasReceberdata_vencimento.AsDateTime;

end;

procedure TfrmcontasReceber.btngerarClick(Sender: TObject);
var
  contador: integer;
  quantidadeparcela: integer;
  intervalodias: integer;
  valorparcela: Currency;
  valorvenda: Currency;
  valorResiduo: Currency;
begin
  if not trystrtocurr(edtvalorvenda.Text, valorvenda) then
  begin
    edtvalorvenda.SetFocus;
    Application.MessageBox('Valor da venda inválido!', ' Atenção!', MB_OK + MB_ICONWARNING);
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

  valorparcela := Tutilitario.TruncarValor(valorvenda / quantidadeparcela);
  // (trunc(valorcompra / quantidadeparcela * 100)) / 100;
  valorResiduo := valorvenda - (valorparcela * quantidadeparcela);

  cdsparcela.EmptyDataSet;

  for contador := 1 to quantidadeparcela do
  begin
    cdsparcela.append;
    cdsparcelaParcela.AsInteger := contador;
    cdsparcelavalor.AsCurrency := valorparcela + valorResiduo;
    valorResiduo := 0;
    cdsparcelavencimento.AsDateTime := incday(Datevenda.Date, intervalodias * contador);
    cdsparcela.Post;
  end;

end;

procedure TfrmcontasReceber.btnImprimirClick(Sender: TObject);
begin
relcontasreceber.DataSet(DataSource1.DataSet);
relcontasreceber.Preview;

end;

procedure TfrmcontasReceber.btnincluirClick(Sender: TObject);
begin
  inherited;
  Datevenda.Date := now;
  datevencimento.Date := now;

  Toggleparcelamento.Enabled := true;
  Toggleparcelamento.State := tssoff;
  Cardparcela.ActiveCard := Cardparcelaunica;
  cdsparcela.EmptyDataSet;

end;

procedure TfrmcontasReceber.btnlimparClick(Sender: TObject);
begin
  inherited;
  cdsparcela.EmptyDataSet;
end;

procedure TfrmcontasReceber.btnSalvarClick(Sender: TObject);
begin
  if Toggleparcelamento.State = tssoff then
  begin
    cadastrarparcelaunica;
    inherited;
  end
  else
    cadastrarparcelamento;

end;

procedure TfrmcontasReceber.cadastrarparcelamento;

var
  valorvenda: Currency;

begin

  if not trystrtocurr(edtvalorvenda.Text, valorvenda) then
  begin
    edtvalorvenda.SetFocus;
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
    if dmcontasreceber.cdscontasreceber.State in [dsBrowse, dsinactive] then

      dmcontasreceber.cdscontasreceber.Insert;

    dmcontasreceber.cdscontasReceberid.AsString := Tutilitario.getId;
    dmcontasreceber.cdscontasreceberdata_cadastro.AsDateTime := now;
    dmcontasreceber.cdscontasreceberstatus.AsString := 'A';
    dmcontasreceber.cdscontasrecebervalor_abatido.AsCurrency := 0;

    dmcontasreceber.cdscontasrecebernumero.AsString := cdsparceladocumento.AsString;
    dmcontasreceber.cdscontasReceberdescricao.AsString :=
      Format('%s - Parcela %d', [edtdescricao.Text, cdsparcelaParcela.AsInteger]);
    dmcontasreceber.cdscontasRecebervalor_venda.AsCurrency := valorvenda;
    dmcontasreceber.cdscontasreceberparcela.AsCurrency := cdsparcelaParcela.AsInteger;
    dmcontasreceber.cdscontasRecebervalor_parcela.AsCurrency := cdsparcelavalor.AsCurrency;
    dmcontasreceber.cdscontasReceberdata_vencimento.AsDateTime := cdsparcelavencimento.AsDateTime;
    dmcontasreceber.cdscontasReceberdata_venda.AsDateTime := Datevenda.Date;
    dmcontasreceber.cdscontasreceber.Post;
    dmcontasreceber.cdscontasreceber.ApplyUpdates(0);

    cdsparcela.Next;

  end;
  Application.MessageBox('Parcelas Cadastradas com sucesso!', ' Atenção!', MB_OK + MB_ICONINFORMATION);
  pesquisar;
  pnlprincipal.ActiveCard := Cardpesquisa;
end;

procedure TfrmcontasReceber.cadastrarparcelaunica;
var
  Parcela: Currency;
  valorvenda: Currency;
  valorparcela: Currency;
begin
  if edtnumerodoc.Text = '' then
  begin
    edtnumerodoc.SetFocus;
    Application.MessageBox('O campo Numero do Documento não pode  ser vazio', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if not trystrtocurr(edtvalorvenda.Text, valorvenda) then
  begin
    edtvalorvenda.SetFocus;
    Application.MessageBox('Valor da venda inválido!', ' Atenção!', MB_OK + MB_ICONWARNING);
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

  if datevencimento.Date < Datevenda.Date then
  begin
    datevencimento.SetFocus;
    Application.MessageBox('A data de vencimento não pode ser menor que a data de compra!', ' Atenção!',
      MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if DataSource1.State in [dsinsert] then
  begin
    dmcontasreceber.cdscontasReceberid.AsString := Tutilitario.getId;
    dmcontasreceber.cdscontasreceberdata_cadastro.AsDateTime := now;
    dmcontasreceber.cdscontasreceberstatus.AsString := 'A';
    dmcontasreceber.cdscontasrecebervalor_abatido.AsCurrency := 0;
  end;

  dmcontasreceber.cdscontasrecebernumero.AsString := edtnumerodoc.Text;
  dmcontasreceber.cdscontasreceberdescricao.AsString := edtdescricao.Text;
  dmcontasreceber.cdscontasrecebervalor_venda.AsCurrency := valorvenda;
  dmcontasreceber.cdscontasreceberparcela.AsCurrency := Parcela;
  dmcontasreceber.cdscontasrecebervalor_parcela.AsCurrency := valorparcela;
  dmcontasreceber.cdscontasreceberdata_vencimento.AsDateTime := datevencimento.Date;
  dmcontasreceber.cdscontasreceberdata_venda.AsDateTime := Datevenda.Date;

  inherited;

end;

procedure TfrmcontasReceber.edtvalorparcelaExit(Sender: TObject);
begin
edtvalorparcela.Text := Tutilitario.FormataValor(edtvalorparcela.Text);

end;

procedure TfrmcontasReceber.edtvalorvendaExit(Sender: TObject);
begin
  edtvalorvenda.Text := Tutilitario.FormataValor(edtvalorvenda.Text);

end;

procedure TfrmcontasReceber.ExcluirClick(Sender: TObject);
begin
  if dmcontasreceber.cdscontasreceberstatus.AsString = 'C' then
  begin
    Application.MessageBox('O documento já se encontra cancelado!', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort
  end;

  if Application.MessageBox('Deseja realmente cancelar esse documento?', 'pergunta', MB_yesno) <> mryes then
    exit;

  try
    dmcontasreceber.cdscontasreceber.Edit;
    dmcontasreceber.cdscontasreceberstatus.AsString := 'C';
    dmcontasreceber.cdscontasreceber.Post;
    dmcontasreceber.cdscontasreceber.ApplyUpdates(0);
    Application.MessageBox('Documento cancelado com sucesso', ' Atenção!', MB_OK + MB_ICONINFORMATION);
    pesquisar;
  except
    on E: Exception do
      Application.MessageBox(pwidechar(E.Message), 'Erro ao cancelar documento', MB_OK + MB_ICONERROR)
  end;

end;



procedure TfrmcontasReceber.FormCreate(Sender: TObject);
begin
  inherited;
 edtvalorvenda.OnKeyPress := Tutilitario.KeyPressvalor;
  edtvalorparcela.OnKeyPress := Tutilitario.KeyPressvalor;
end;

procedure TfrmcontasReceber.mnucontareceberbaixarClick(Sender: TObject);
begin
 FrmBaixarContasreceber.Baixarcontareceber(DataSource1.DataSet.FieldByName('ID').AsString);
 Pesquisar;
end;

procedure TfrmcontasReceber.pesquisar;
begin
  var
    Filtropesquisa: string;

  begin

    Filtropesquisa := Tutilitario.likepesquisar(Edtpesquisa.Text, DBGrid1);
    dmcontasreceber.cdscontasreceber.Close;
    dmcontasreceber.cdscontasreceber.CommandText := 'select * from contas_receber where 1 = 1  ' + Filtropesquisa;
    dmcontasreceber.cdscontasreceber.open;
    inherited;

  end;
end;

procedure TfrmcontasReceber.ToggleparcelamentoClick(Sender: TObject);
begin

Cardparcela.ActiveCard := Cardparcelaunica;
  if Toggleparcelamento.State = tssOn then
    Cardparcela.ActiveCard := Cardparcelado
end;

end.
