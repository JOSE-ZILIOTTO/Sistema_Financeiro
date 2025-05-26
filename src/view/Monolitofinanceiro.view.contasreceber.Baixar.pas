unit Monolitofinanceiro.view.contasreceber.Baixar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  Monolitofinanceiro.model.entidades.contaspagar, Monolitofinanceiro.model.contaspagar,Monolitofinanceiro.Utilitario,
  Monolitofinanceiro.model.entidades.ContaspagarDetalhe,
  Monolitofinanceiro.model.usuario,
  Monolitofinanceiro.model.entidades.Contasreceber,
  Monolitofinanceiro.model.contasReceber,
  Monolitofinanceiro.model.entidades.Contasreceberdetalhe;

type
  TFrmBaixarContasreceber = class(TForm)
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

    procedure Baixarcontareceber(ID: string);
  end;

var
  FrmBaixarContasreceber: TFrmBaixarContasreceber;

implementation

{$R *.dfm}
{ TFrmBaixarContasPagar }

procedure TFrmBaixarContasreceber.Baixarcontareceber(ID: string);
var
  Contareceber: TModelcontasreceber;
begin
  FID := trim(ID);
  if FID.IsEmpty then
    raise Exception.Create('ID do contas a pagar inválido!');
  Contareceber := dmcontasreceber.Getcontasreceber(FID);
  try
    if Contareceber.Status = 'B' then
      raise Exception.Create('Não é possível baixar um documento já baixado!');

    if Contareceber.Status = 'C' then
      raise Exception.Create('Não é póssível baixar um documento já cancelado!');

      lblnumerodocumento.Caption := Contareceber.documneto;
      lblparcelaexibir.Caption := inttostr(Contareceber.parcela);
      lbldatevencimento.Caption := FormatDateTime('dd/mm/yyyy', Contareceber.datavencimento);
      lblvalorabatidoexibir.Caption := Tutilitario.FormataValor(Contareceber.valorabatido);
      lblvalorparcelaexibir.Caption := Tutilitario.FormataValor(Contareceber.valorparcela);
      edtobservacao.Text := '';
      edtvalor.Text := '';

      self.ShowModal;
  finally
    Contareceber.Free;
  end;


end;

procedure TFrmBaixarContasreceber.btnBaixarClick(Sender: TObject);
var

Contareceberdetalhe :  TModelContareceberDetalhe;
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

Contareceberdetalhe := TModelContareceberDetalhe.Create;
try
  Contareceberdetalhe.idcontareceber := Fid;
  Contareceberdetalhe.detalhes := edtobservacao.text;
  Contareceberdetalhe.valor := valorabater;
  Contareceberdetalhe.data := now;
  Contareceberdetalhe.usuario := dmusuario.Getusuario.idusuariologado;

  try
  dmcontasreceber.BaixarContareceber(Contareceberdetalhe);
  application.MessageBox('Documento Baixado com sucesso!', 'Atenção',MB_OK + MB_ICONINFORMATION);
  ModalResult := mrOk;
  except on E : Exception do
   application.MessageBox(Pwidechar(E.Message), 'Erro ao Baixar documento',MB_OK + MB_ICONWARNING);

  end;
finally
  Contareceberdetalhe.Free
end;
end;

procedure TFrmBaixarContasreceber.BtnfecharcadastroClick(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TFrmBaixarContasreceber.edtvalorExit(Sender: TObject);
begin
edtvalor.Text := Tutilitario.FormataValor(edtvalor.Text);
end;

procedure TFrmBaixarContasreceber .FormCreate(Sender: TObject);
begin
edtvalor.OnKeyPress := Tutilitario.KeyPressvalor;
end;

end.
