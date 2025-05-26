unit Monolitofinanceiro.view.contasPagar.Consultar;

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
  Vcl.StdCtrls,
  System.ImageList,
  Vcl.ImgList,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Monolitofinanceiro.model.contasPagar,
  Vcl.ComCtrls,
  Vcl.WinXPanels,
  Monolitofinanceiro.view.Cadastropadrao,
  Vcl.WinXCtrls,
  Monolitofinanceiro.view.contaspagar.Baixar,
  Monolitofinanceiro.Utilitario,
  Monolitofinanceiro.view.contasPagar.Detalhes;

type
  Tfrmcontaspagarconsultar = class(TForm)
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
  frmcontaspagarconsultar: Tfrmcontaspagarconsultar;

implementation

{$R *.dfm}
{ Tfrmconatsreceberconsultar }

procedure Tfrmcontaspagarconsultar.adicionarfiltro(aValue: string);
begin
  FFiltropesquisar := FFiltropesquisar + ' ' + aValue;
end;

procedure Tfrmcontaspagarconsultar.btnBaixarClick(Sender: TObject);
begin
FrmBaixarContaspagar.Baixarcontapagar(DataSource1.DataSet.FieldByName('ID').AsString);
if FrmBaixarContaspagar.ModalResult = mrOK then
   dmcontaspagar.cdscontaspagar.Refresh;
end;

procedure Tfrmcontaspagarconsultar.btnDetalhesClick(Sender: TObject);
begin
frmcontasPagardetalhes.ExibircontasPagardetalhes(Datasource1.DataSet.FieldByName('ID').AsString);
end;

procedure Tfrmcontaspagarconsultar.BtnfecharconsultaClick(Sender: TObject);
begin
  CLOSE;
end;

procedure Tfrmcontaspagarconsultar.btnfiltrosClick(Sender: TObject);
begin
  SplitView1.Opened := not SplitView1.Opened;
end;

procedure Tfrmcontaspagarconsultar.btnpesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure Tfrmcontaspagarconsultar.cbfiltrarstatusKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    cbfiltrarstatus.ItemIndex := -1;
end;

procedure Tfrmcontaspagarconsultar.cbfiltrotipodataKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    cbfiltrotipodata.ItemIndex := -1;
  Habilitardatas(false);
end;

procedure Tfrmcontaspagarconsultar.cbfiltrotipodataSelect(Sender: TObject);
begin
  Habilitardatas(true);
end;

procedure Tfrmcontaspagarconsultar.Datasource1DataChange(Sender: TObject; Field: TField);
begin
btnBaixar.Enabled := Datasource1.DataSet.FieldByName('STATUS').AsString = 'A';
end;

procedure Tfrmcontaspagarconsultar.FiltrarData;
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
      Campodata := 'DATA_COMPRA';
    1:
      Campodata := 'DATA_VENCIMENTO';
    2:
      Campodata := 'DATA_PAGAMENTO';
  end;

  if filtrodateinicio.Checked then
  begin
    adicionarfiltro(' AND ' + Campodata + '>= :DATAINICIO');
    dmcontasPagar.CDScontaspagar.Params.CreateParam(ftDate, 'DATAINICIO', ptInput);
    dmcontasPagar.CDScontaspagar.ParamByName('DATAINICIO').AsDate := filtrodateinicio.Date;
  end;

  if filtrodatefinal.Checked then
  begin
    adicionarfiltro(' AND ' + Campodata + '<= :DATAFINAL');
    dmcontasPagar.CDScontaspagar.Params.CreateParam(ftDate, 'DATAFINAL', ptInput);
    dmcontasPagar.CDScontaspagar.ParamByName('DATAFINAL').AsDate := filtrodatefinal.Date;
  end;

end;

procedure Tfrmcontaspagarconsultar.FiltrarNumero;
begin
  if edtnumero.Text = '' then
    exit;
  adicionarfiltro(' AND NUMERO = :NUMERO');
  dmcontaspagar.CDScontaspagar.Params.CreateParam(ftSTRING, 'NUMERO', ptInput);
  dmcontaspagar.CDScontaspagar.ParamByName('NUMERO').ASSTRING := edtnumero.Text;
end;

procedure Tfrmcontaspagarconsultar.FiltrarParcela;
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
  dmcontaspagar.CDScontaspagar.Params.CreateParam(ftInteger, 'PARCELA', ptInput);
  dmcontaspagar.CDScontaspagar.ParamByName('PARCELA').AsInteger := parcela;

end;

procedure Tfrmcontaspagarconsultar.Filtrarstatus;
begin
 if cbfiltrarstatus.ItemIndex = -1  then
 exit;

 case cbfiltrarstatus.ItemIndex of
 0 : adicionarfiltro('AND STATUS =  ''A''');
 1 : adicionarfiltro('AND STATUS =  ''B''');
 2 : adicionarfiltro('AND STATUS =  ''C''');
 end;
end;

procedure Tfrmcontaspagarconsultar.FormShow(Sender: TObject);
begin
Pesquisar;
end;

procedure Tfrmcontaspagarconsultar.Habilitardatas(aValue: boolean);
begin
  filtrodateinicio.Enabled := aValue;
  filtrodatefinal.Enabled := aValue;
end;

procedure Tfrmcontaspagarconsultar.Limparfiltro;
begin
  FFiltropesquisar := '';
end;

procedure Tfrmcontaspagarconsultar.Pesquisar;
begin
  SplitView1.Opened := false;
  Limparfiltro;
  dmcontaspagar.CDScontaspagar.Params.Clear;

  FiltrarData;
  FiltrarNumero;
  FiltrarParcela;
  Filtrarstatus;

  dmcontaspagar.CDScontaspagar.CLOSE;
  dmcontaspagar.CDScontaspagar.CommandText := ' SELECT * FROM CONTAS_PAGAR WHERE 1 = 1 ' + FFiltropesquisar;
  dmcontaspagar.CDScontaspagar.Open;

  lblquantidadereceber.Caption := Format(' Quantidade de Registro: %d',[ Datasource1.DataSet.RecordCount]);
  lbltotalrecebimentos.Caption := ' Total de Recebimentos: R$ ' + Tutilitario.FormataValor(dmcontaspagar.CDScontaspagar.FieldByName('Total').AsString);

end;

end.
