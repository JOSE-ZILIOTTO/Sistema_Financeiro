unit Monolitofinanceiro.view.Caixa;

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
  Data.DB,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.WinXPanels,
  Monolitofinanceiro.model.Caixa,
  Monolitofinanceiro.Utilitario,
  Monolitofinanceiro.view.Cadastropadrao,
  Monolitofinanceiro.view.relatorios.caixa;

type
  TFrmcaixa = class(TFrmCadastroPadrao)
    lblnumerodoc: TLabel;
    lbldescricao: TLabel;
    lblvalor: TLabel;
    edtnumerodoc: TEdit;
    edtdescricao: TEdit;
    edtvalor: TEdit;
    RadioGroup1: TRadioGroup;
    cbtipos: TComboBox;
    lblseletipo: TLabel;

    procedure btnSalvarClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure pesquisar; override;
  end;

var
  Frmcaixa: TFrmcaixa;

implementation

{$R *.dfm}
{ TFrmCadastroPadrao1 }



procedure TFrmcaixa.btnalterarClick(Sender: TObject);
begin

edtnumerodoc.Text := dmCaixa.cdsCaixanumero_doc.AsString;
edtdescricao.Text := dmCaixa.cdsCaixadescricao.AsString;
edtvalor.Text := dmCaixa.cdsCaixavalor.AsString;

if dmCaixa.cdsCaixatipo.AsString = 'R' then
RadioGroup1.ItemIndex := 0
else
RadioGroup1.ItemIndex := 1;

  inherited;
end;

procedure TFrmcaixa.btnImprimirClick(Sender: TObject);
begin
  inherited;
relrelatoriocaixa.Dataset(DataSource1.DataSet);
relrelatoriocaixa.preview;
end;

procedure TFrmcaixa.btnSalvarClick(Sender: TObject);
var
  LTipo: string;
begin
  if edtnumerodoc.Text = '' then
  begin
    edtnumerodoc.SetFocus;
    Application.MessageBox('O campo Numero do Documento não pode  ser vazio', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  if edtvalor.Text = '' then
  begin
    edtvalor.SetFocus;
    Application.MessageBox('O campo Valor não pode  ser vazio', ' Atenção!', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if RadioGroup1.ItemIndex = -1 then
    begin
    Application.MessageBox('Selecione um Tipo!', ' Atenção!', MB_OK + MB_ICONWARNING);
  Abort;
    end;
  LTipo := 'R';
  if RadioGroup1.ItemIndex = 1 then
    LTipo := 'D';

  if DataSource1.State in [dsInsert] then
  begin
    dmcaixa.cdsCaixaid.Asstring := Tutilitario.getId;
    dmcaixa.cdsCaixadata_cadastro.AsDateTime := now;
  end;
  dmcaixa.cdsCaixanumero_doc.AsString := trim(edtnumerodoc.Text);
  dmcaixa.cdsCaixadescricao.AsString := trim(edtdescricao.Text);
  dmcaixa.cdsCaixavalor.AsCurrency := strtofloat(edtvalor.Text);
  dmcaixa.cdsCaixatipo.AsString := LTipo;

  inherited;
end;

procedure TFrmcaixa.FormCreate(Sender: TObject);
begin
  inherited;
edtvalor.OnKeyPress := Tutilitario.KeyPressvalor;
end;

procedure TFrmcaixa.pesquisar;
var
Filtropesquisa : string;
FiltroTipo : string;
begin

case  cbtipos.ItemIndex of
2 : FiltroTipo := ' AND TIPO = ''R''';
1 : FiltroTipo := ' AND TIPO = ''D''';
end;


  Filtropesquisa := Tutilitario.likepesquisar(Edtpesquisa.Text, DBGrid1);
  dmcaixa.cdsCaixa.Close;
  dmcaixa.cdsCaixa.CommandText := 'select * from caixas where 1 = 1  ' + filtropesquisa + FiltroTipo ;
  dmcaixa.cdsCaixa.open;
    inherited;
end;

end.
