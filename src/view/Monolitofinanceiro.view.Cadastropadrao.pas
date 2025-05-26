unit Monolitofinanceiro.view.Cadastropadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.WinXPanels,
  System.ImageList, Vcl.ImgList, Datasnap.DBClient, Vcl.WinXCtrls;

type
  TFrmCadastroPadrao = class(TForm)
    PnlPrincipal: TCardPanel;
    CardCadastro: TCard;
    Cardpesquisa: TCard;
    pnlpesquisa: TPanel;
    pnlpesquisabotoes: TPanel;
    PnlGrid: TPanel;
    DBGrid1: TDBGrid;
    Edtpesquisa: TEdit;
    Label1: TLabel;
    btnpesquisar: TButton;
    ImageList1: TImageList;
    Btnfechar: TButton;
    btnImprimir: TButton;
    Excluir: TButton;
    btnalterar: TButton;
    btnincluir: TButton;
    Panel1: TPanel;
    Btnfecharcadastro: TButton;
    btnSalvar: TButton;
    DataSource1: TDataSource;
    procedure btnincluirClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure BtnfecharClick(Sender: TObject);
    procedure BtnfecharcadastroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure btnpesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitarBotoes;
  public
    { Public declarations }
    procedure pesquisar; virtual;
    procedure LimparCampos;
  end;

var
  FrmCadastroPadrao: TFrmCadastroPadrao;

implementation

{$R *.dfm}

procedure TFrmCadastroPadrao.btnalterarClick(Sender: TObject);
begin
  TClientDataSet(DataSource1.DataSet).Edit;
  PnlPrincipal.ActiveCard := CardCadastro;
end;

procedure TFrmCadastroPadrao.BtnfecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastroPadrao.btnincluirClick(Sender: TObject);
begin
  LimparCampos;
  TClientDataSet(DataSource1.DataSet).Insert;
  PnlPrincipal.ActiveCard := CardCadastro;
end;

procedure TFrmCadastroPadrao.btnpesquisarClick(Sender: TObject);
begin
pesquisar;
end;

procedure TFrmCadastroPadrao.btnSalvarClick(Sender: TObject);
var
  mensagem: string;
begin
  mensagem := 'Registro Alterado com sucesso!';

  if TClientDataSet(DataSource1.DataSet).State in [dsinsert] then
    mensagem := 'Registro incluído com sucesso!';

  TClientDataSet(DataSource1.DataSet).Post;
  TClientDataSet(DataSource1.DataSet).ApplyUpdates(0);
  Application.MessageBox(pwidechar(mensagem), ' Atenção!', MB_OK + MB_ICONINFORMATION);
  pesquisar;
  PnlPrincipal.ActiveCard := Cardpesquisa;
end;

procedure TFrmCadastroPadrao.ExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir o registro?', 'pergunta', MB_yesno) <> mryes then
    exit;

  try
    TClientDataSet(DataSource1.DataSet).Delete;
    TClientDataSet(DataSource1.DataSet).ApplyUpdates(0);
    Application.MessageBox('Registro excluído com sucesso', ' Atenção!', MB_OK + MB_ICONINFORMATION);
    pesquisar;
  except
    on E: Exception do
      Application.MessageBox(pwidechar(E.Message), 'Erro ao excluir o registro', MB_OK + MB_ICONERROR)

  end;

end;

procedure TFrmCadastroPadrao.FormShow(Sender: TObject);
begin
  PnlPrincipal.ActiveCard := Cardpesquisa;
  pesquisar;
end;

procedure TFrmCadastroPadrao.HabilitarBotoes;
begin
  Excluir.Enabled := not DataSource1.DataSet.IsEmpty;
  btnalterar.Enabled := not DataSource1.DataSet.IsEmpty;
end;

procedure TFrmCadastroPadrao.LimparCampos;
var
  contador: integer;
begin
  for contador := 0 to Pred(ComponentCount) do
  begin
    if components[contador] is TCustomEdit then
      TCustomEdit(components[contador]).Clear
    else if components[contador] is TToggleSwitch then
      TToggleSwitch(components[contador]).State := tssOn
    else if components[contador] is TRadioGroup then
      TRadioGroup(components[contador]).ItemIndex := -1;

  end;

end;

procedure TFrmCadastroPadrao.pesquisar;
begin
  HabilitarBotoes;
end;

procedure TFrmCadastroPadrao.BtnfecharcadastroClick(Sender: TObject);
begin
  TClientDataSet(DataSource1.DataSet).cancel;
  PnlPrincipal.ActiveCard := Cardpesquisa;
end;

end.
