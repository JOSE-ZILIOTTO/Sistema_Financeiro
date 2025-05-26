unit Monolitofinanceiro.view.contasReceber.Consultar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Data.DB, Vcl.Grids,
  Vcl.DBGrids,
  Monolitofinanceiro.model.contasReceber, Vcl.ComCtrls, Vcl.WinXPanels, Monolitofinanceiro.view.Cadastropadrao,
  Vcl.WinXCtrls, Monolitofinanceiro.view.contasReceber.Baixar,
  Monolitofinanceiro.Utilitario,
  Monolitofinanceiro.view.contasReceber.Detalhes,
  MonolitoFinanceiro.View.Relatorios.ContasReceberDetalhado;

type
  Tfrmconatsreceberconsultar = class(TForm)
    Panel1: TPanel;
    pnlpesquisa: TPanel;
    btnpesquisar: TButton;
    ImageList1: TImageList;
    Panel2: TPanel;
    Btnfecharconsulta: TButton;
    btnBaixar: TButton;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    StackPanel1: TStackPanel;
    Label1: TLabel;
    Panel5: TPanel;
    StackPanel2: TStackPanel;
    Label2: TLabel;
    Panel6: TPanel;
    StackPanel3: TStackPanel;
    Label3: TLabel;
    cbfiltrotipodata: TComboBox;
    filtrodateinicio: TDateTimePicker;
    filtrodatefinal: TDateTimePicker;
    Datasource1: TDataSource;
    SplitView1: TSplitView;
    Panel7: TPanel;
    StackPanel4: TStackPanel;
    Label4: TLabel;
    cbfiltrarstatus: TComboBox;
    Panel8: TPanel;
    StackPanel5: TStackPanel;
    Label5: TLabel;
    Panel9: TPanel;
    StackPanel6: TStackPanel;
    Label6: TLabel;
    edtnumero: TEdit;
    edtparcela: TEdit;
    btnfiltros: TButton;
    Panel10: TPanel;
    lblquantidadereceber: TLabel;
    lbltotalrecebimentos: TLabel;
    btnDetalhes: TButton;
    btnImprimir: TButton;
    procedure btnpesquisarClick(Sender: TObject);
    procedure BtnfecharconsultaClick(Sender: TObject);
    procedure cbfiltrotipodataKeyPress(Sender: TObject; var Key: Char);
    procedure cbfiltrotipodataSelect(Sender: TObject);
    procedure btnfiltrosClick(Sender: TObject);
    procedure cbfiltrarstatusKeyPress(Sender: TObject; var Key: Char);
    procedure btnBaixarClick(Sender: TObject);
    procedure Datasource1DataChange(Sender: TObject; Field: TField);
    procedure btnDetalhesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    FFiltropesquisar: string;
    procedure Limparfiltro;
    procedure adicionarfiltro(aValue: string);
    procedure FiltrarData;
    procedure Pesquisar;
    procedure Habilitardatas(aValue: boolean);
    procedure FiltrarNumero;
    procedure FiltrarParcela;
    procedure Filtrarstatus;
  public
    { Public declarations }
  end;

var
  frmconatsreceberconsultar: Tfrmconatsreceberconsultar;

implementation

{$R *.dfm}
{ Tfrmconatsreceberconsultar }

procedure Tfrmconatsreceberconsultar.adicionarfiltro(aValue: string);
begin
  FFiltropesquisar := FFiltropesquisar + ' ' + aValue;
end;

procedure Tfrmconatsreceberconsultar.btnBaixarClick(Sender: TObject);
begin
  FrmBaixarContasreceber.Baixarcontareceber(Datasource1.DataSet.FieldByName('ID').AsString);
  if FrmBaixarContasreceber.ModalResult = mrOK then
    dmcontasReceber.cdscontasReceber.Refresh;
end;

procedure Tfrmconatsreceberconsultar.btnDetalhesClick(Sender: TObject);
begin
  frmcontasreceberdetalhes.Exibircontasreceberdetalhes(Datasource1.DataSet.FieldByName('ID').AsString);
end;

procedure Tfrmconatsreceberconsultar.BtnfecharconsultaClick(Sender: TObject);
begin
  CLOSE;
end;

procedure Tfrmconatsreceberconsultar.btnfiltrosClick(Sender: TObject);
begin
  SplitView1.Opened := not SplitView1.Opened;
end;

procedure Tfrmconatsreceberconsultar.btnImprimirClick(Sender: TObject);
var
  SQL: string;
begin
  SQL := ' SELECT * FROM CONTAS_RECEBER LEFT JOIN CONTAS_RECEBER_DETALHES ON ' +
    'CONTAS_RECEBER.ID = CONTAS_RECEBER_DETALHES.ID_CONTAS_RECEBER WHERE 1 = 1' + FFiltropesquisar;
  dmcontasReceber.sqlrelcontasreceberdetalhado.Close;
  dmcontasReceber.sqlrelcontasreceberdetalhado.SQL.Clear;
  dmcontasReceber.sqlrelcontasreceberdetalhado.SQL.Add(SQL);
  dmcontasReceber.sqlrelcontasreceberdetalhado.Open;

  RelContasReceberDetalhado.DataSet(dmcontasReceber.sqlrelcontasreceberdetalhado);
  RelContasReceberDetalhado.preview;
end;

procedure Tfrmconatsreceberconsultar.btnpesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure Tfrmconatsreceberconsultar.cbfiltrarstatusKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    cbfiltrarstatus.ItemIndex := -1;
end;

procedure Tfrmconatsreceberconsultar.cbfiltrotipodataKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    cbfiltrotipodata.ItemIndex := -1;
  Habilitardatas(false);
end;

procedure Tfrmconatsreceberconsultar.cbfiltrotipodataSelect(Sender: TObject);
begin
  Habilitardatas(true);
end;

procedure Tfrmconatsreceberconsultar.Datasource1DataChange(Sender: TObject; Field: TField);
begin
  btnBaixar.Enabled := Datasource1.DataSet.FieldByName('STATUS').AsString = 'A';
end;

procedure Tfrmconatsreceberconsultar.FiltrarData;
var
  Campodata: string;
begin
  if cbfiltrotipodata.ItemIndex = -1 then
    exit;

  if (filtrodateinicio.Checked = false) and (filtrodatefinal.Checked = false) then
  begin
    Application.MessageBox('Uma data tem que ser selecionada', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  case cbfiltrotipodata.ItemIndex of
    0:
      Campodata := 'DATA_VENDA';
    1:
      Campodata := 'DATA_VENCIMENTO';
    2:
      Campodata := 'DATA_RECEBIMENTO';
  end;

  if filtrodateinicio.Checked then
  begin
    adicionarfiltro(' AND ' + Campodata + '>= :DATAINICIO');
    dmcontasReceber.cdscontasReceber.Params.CreateParam(ftDate, 'DATAINICIO', ptInput);
    dmcontasReceber.cdscontasReceber.ParamByName('DATAINICIO').AsDate := filtrodateinicio.Date;
  end;

  if filtrodatefinal.Checked then
  begin
    adicionarfiltro(' AND ' + Campodata + '<= :DATAFINAL');
    dmcontasReceber.cdscontasReceber.Params.CreateParam(ftDate, 'DATAFINAL', ptInput);
    dmcontasReceber.cdscontasReceber.ParamByName('DATAFINAL').AsDate := filtrodatefinal.Date;
  end;

end;

procedure Tfrmconatsreceberconsultar.FiltrarNumero;
begin
  if edtnumero.Text = '' then
    exit;
  adicionarfiltro(' AND NUMERO = :NUMERO');
  dmcontasReceber.cdscontasReceber.Params.CreateParam(ftSTRING, 'NUMERO', ptInput);
  dmcontasReceber.cdscontasReceber.ParamByName('NUMERO').AsString := edtnumero.Text;
end;

procedure Tfrmconatsreceberconsultar.FiltrarParcela;
var
  parcela: integer;
begin
  if edtparcela.Text = '' then
    exit;

  if not trystrtoint(edtparcela.Text, parcela) then
  begin
    Application.MessageBox('Número da Parcela Inválido!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  adicionarfiltro('AND PARCELA = :PARCELA');
  dmcontasReceber.cdscontasReceber.Params.CreateParam(ftInteger, 'PARCELA', ptInput);
  dmcontasReceber.cdscontasReceber.ParamByName('PARCELA').AsInteger := parcela;

end;

procedure Tfrmconatsreceberconsultar.Filtrarstatus;
begin
  if cbfiltrarstatus.ItemIndex = -1 then
    exit;

  case cbfiltrarstatus.ItemIndex of
    0:
      adicionarfiltro('AND STATUS =  ''A''');
    1:
      adicionarfiltro('AND STATUS =  ''B''');
    2:
      adicionarfiltro('AND STATUS =  ''C''');
  end;
end;

procedure Tfrmconatsreceberconsultar.FormShow(Sender: TObject);
begin
  Pesquisar;
end;

procedure Tfrmconatsreceberconsultar.Habilitardatas(aValue: boolean);
begin
  filtrodateinicio.Enabled := aValue;
  filtrodatefinal.Enabled := aValue;
end;

procedure Tfrmconatsreceberconsultar.Limparfiltro;
begin
  FFiltropesquisar := '';
end;

procedure Tfrmconatsreceberconsultar.Pesquisar;
begin
  SplitView1.Opened := false;
  Limparfiltro;
  dmcontasReceber.cdscontasReceber.Params.Clear;

  FiltrarData;
  FiltrarNumero;
  FiltrarParcela;
  Filtrarstatus;

  dmcontasReceber.cdscontasReceber.CLOSE;
  dmcontasReceber.cdscontasReceber.CommandText := ' SELECT * FROM CONTAS_RECEBER WHERE 1 = 1 ' + FFiltropesquisar;
  dmcontasReceber.cdscontasReceber.Open;

  lblquantidadereceber.Caption := Format(' Quantidade de Registro: %d', [Datasource1.DataSet.RecordCount]);
  lbltotalrecebimentos.Caption := ' Total de Recebimentos: R$ ' +
    Tutilitario.FormataValor(dmcontasReceber.cdscontasReceber.FieldByName('Total').AsString);

end;

end.
