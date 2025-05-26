unit Monolitofinanceiro.view.relatorios.caixa.extrato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Monolitofinanceiro.view.relatorios.padraoAgrupado, Data.DB, RLReport,
  Monolitofinanceiro.model.entidades.Caixa.Resumo,
  Monolitofinanceiro.Utilitario;

type
  Trelcaixaextrato = class(Trelpadraoagrupado)
    RLBand3: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLBand6: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand7: TRLBand;
    RLLabel7: TRLLabel;
    lblsaldoanterior: TRLLabel;
    RLLabel9: TRLLabel;
    lbltotalentradas: TRLLabel;
    lbltotalsaidas: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    lblsaldofinal: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  procedure resumocaixa( resumocaixa : TModelresumocaixa);
  end;

var
  relcaixaextrato: Trelcaixaextrato;

implementation

{$R *.dfm}

{ Trelcaixaextrato }

procedure Trelcaixaextrato.resumocaixa(resumocaixa: TModelresumocaixa);
begin

  lblsaldoanterior.Caption := Tutilitario.fomatmoeda(ResumoCaixa.Saldoincial);
  lbltotalentradas.Caption := Tutilitario.fomatmoeda(ResumoCaixa.Totalentradas);
  lbltotalsaidas.Caption := Tutilitario.fomatmoeda(ResumoCaixa.totalSaidas);
  lblsaldofinal.Caption := Tutilitario.fomatmoeda(ResumoCaixa.Saldofinal);
end;

end.
