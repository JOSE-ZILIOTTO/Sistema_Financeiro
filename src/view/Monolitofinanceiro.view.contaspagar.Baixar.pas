unit Monolitofinanceiro.view.contaspagar.Baixar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  Monolitofinanceiro.model.entidades.contaspagar, Monolitofinanceiro.model.contaspagar,Monolitofinanceiro.Utilitario,
  Monolitofinanceiro.model.entidades.ContaspagarDetalhe,
  Monolitofinanceiro.model.usuario;

type
  TFrmBaixarContasPagar = class(TForm)
    PnlPrincipal: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lblnumerodocumento: TLabel;
    lblparcelaexibir: TLabel;
    lbldatevencimento: TLabel;
    lblvalorparcelaexibir: TLabel;
    lblvalorabatidoexibir: TLabel;
    lblvalorabatido: TLabel;
    lblvalorparcela: TLabel;
    lblvencimento: TLabel;
    lblparcela: TLabel;
    lbldocumento: TLabel;
    lblobservacao: TLabel;
    lblvalor: TLabel;
    edtobservacao: TEdit;
    edtvalor: TEdit;
    Panel2: TPanel;
    Btnfecharcadastro: TButton;
    btnBaixar: TButton;
    ImageList1: TImageList;
    procedure BtnfecharcadastroClick(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtvalorExit(Sender: TObject);
  private
    FID: string;
  public
    { Public declarations }

    procedure Baixarcontapagar(ID: string);
  end;

var
  FrmBaixarContasPagar: TFrmBaixarContasPagar;

implementation

{$R *.dfm}
{ TFrmBaixarContasPagar }

procedure TFrmBaixarContasPagar.Baixarcontapagar(ID: string);
var
  Contapagar: TModelcontaspagar;
begin
  FID := trim(ID);
  if FID.IsEmpty then
    raise Exception.Create('ID do contas a pagar inválido!');
  Contapagar := dmcontaspagar.Getcontaspagar(FID);
  try
    if Contapagar.Status = 'B' then
      raise Exception.Create('Não é possível baixar um documento já baixado!');

    if Contapagar.Status = 'C' then
      raise Exception.Create('Não é póssível baixar um documento já cancelado!');

      lblnumerodocumento.Caption := Contapagar.documneto;
      lblparcelaexibir.Caption := inttostr(Contapagar.parcela);
      lbldatevencimento.Caption := FormatDateTime('dd/mm/yyyy', Contapagar.datavencimento);
      lblvalorabatidoexibir.Caption := Tutilitario.FormataValor(contapagar.valorabatido);
      lblvalorparcelaexibir.Caption := Tutilitario.FormataValor(contapagar.valorparcela);
      edtobservacao.Text := '';
      edtvalor.Text := '';

      self.ShowModal;
  finally
    Contapagar.Free;
  end;


end;

procedure TFrmBaixarContasPagar.btnBaixarClick(Sender: TObject);
var

Contapagardetalhe :  TModelContaPagarDetalhe;
valorabater :currency;
begin
if trim(edtobservacao.Text) = '' then
begin
  edtobservacao.SetFocus;
  application.MessageBox('A observação não pode ser vazia', 'Atenção',MB_OK + MB_ICONWARNING);
  abort;
end;

Valorabater := 0;
TryStrToCurr(edtvalor.Text,valorabater);

if valorabater <= 0 then
begin
  edtvalor.SetFocus;
  application.MessageBox('Valor inválido!', 'Atenção',MB_OK + MB_ICONWARNING);
  abort;
end;

contapagardetalhe := TModelContaPagarDetalhe.Create;
try
  Contapagardetalhe.idcontapagar := Fid;
  Contapagardetalhe.detalhes := edtobservacao.text;
  Contapagardetalhe.valor := valorabater;
  Contapagardetalhe.data := now;
  Contapagardetalhe.usuario := dmusuario.Getusuario.idusuariologado;

  try
  dmcontaspagar.BaixarContaPagar(Contapagardetalhe);
  application.MessageBox('Documento Baixado com sucesso!', 'Atenção',MB_OK + MB_ICONINFORMATION);
  ModalResult := mrOk;
  except on E : Exception do
   application.MessageBox(Pwidechar(E.Message), 'Erro ao Baixar documento',MB_OK + MB_ICONWARNING);

  end;
finally
  Contapagardetalhe.Free
end;
end;

procedure TFrmBaixarContasPagar.BtnfecharcadastroClick(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TFrmBaixarContasPagar.edtvalorExit(Sender: TObject);
begin
edtvalor.Text := Tutilitario.FormataValor(edtvalor.Text);
end;

procedure TFrmBaixarContasPagar.FormCreate(Sender: TObject);
begin
edtvalor.OnKeyPress := Tutilitario.KeyPressvalor;
end;

end.
