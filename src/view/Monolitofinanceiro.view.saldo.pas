unit Monolitofinanceiro.view.saldo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXPanels,
  Vcl.ComCtrls,Monolitofinanceiro.model.Caixa,
  Monolitofinanceiro.view.Cadastropadrao,
  Monolitofinanceiro.model.entidades.Caixa.Resumo,
  System.DateUtils, Monolitofinanceiro.Utilitario;

type
  TFrmSaldo = class(Tform)
    pnlprincipal: TPanel;
    pnltop: TPanel;
    pnlmeio: TPanel;
    btnpesquisar: TButton;
    ImageList1: TImageList;
    dateinicial: TDateTimePicker;
    datefinal: TDateTimePicker;
    lbldatainicial: TLabel;
    lbldatafinal: TLabel;
    StackPanel1: TStackPanel;
    Panel1: TPanel;
    Label1: TLabel;
    lblsaldofinal: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    lblsaldoparcial: TLabel;
    Panel3: TPanel;
    Label5: TLabel;
    lbltotalentradas: TLabel;
    Panel4: TPanel;
    Label7: TLabel;
    lblinicialcaixa: TLabel;
    Panel5: TPanel;
    Label9: TLabel;
    lbltotalsaidas: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnpesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure pesquisar;
    Class function new (Aowner : Tcomponent) : TFrmSaldo;
    function embed (Value : TPanel) : TFrmSaldo;

  end;

var
  FrmSaldo: TFrmSaldo;

implementation

{$R *.dfm}
{ TFrmSaldo }

procedure TFrmSaldo.btnpesquisarClick(Sender: TObject);
begin
pesquisar;
end;

function TFrmSaldo.embed(Value: TPanel): TFrmSaldo;
begin
 result := self;
 self.Parent := Value;
end;

procedure TFrmSaldo.FormShow(Sender: TObject);
begin
dateinicial.Date := IncDay(now -7);
datefinal.Date := now;
Pesquisar;
end;

class function TFrmSaldo.new(Aowner: Tcomponent): TFrmSaldo;
begin
  result := self.Create(Aowner);

end;

procedure TFrmSaldo.pesquisar;
var
  resumoCaixa: TMODELRESUMOCAIXA;
begin
  lblinicialcaixa.Caption := '';
  lbltotalentradas.Caption := '';
  lbltotalsaidas.Caption := '';
  lblsaldoparcial.Caption := '';
  lblsaldofinal.Caption := '';

  ResumoCaixa := dmcaixa.Resumocaixa(dateinicial.date, datefinal.Date);
  try
    lblinicialcaixa.Caption := Tutilitario.fomatmoeda(resumoCaixa.Saldoincial);
  lbltotalentradas.Caption := Tutilitario.fomatmoeda (resumoCaixa.Totalentradas);
  lbltotalsaidas.Caption := Tutilitario.fomatmoeda (resumoCaixa.totalSaidas);
  lblsaldoparcial.Caption := Tutilitario.fomatmoeda (resumoCaixa.Saldoparcial);
  lblsaldofinal.Caption := Tutilitario.fomatmoeda(resumoCaixa.Saldofinal);

  finally
    resumoCaixa.Free;
  end;
end;

end.
