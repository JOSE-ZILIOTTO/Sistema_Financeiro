unit Monolitofinanceiro.view.relatorios.caixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Monolitofinanceiro.view.relatorios.padraoAgrupado, Data.DB, RLReport;

type
  Trelrelatoriocaixa = class(Trelpadraoagrupado)
    RLBand3: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLBand4: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relrelatoriocaixa: Trelrelatoriocaixa;

implementation

{$R *.dfm}

end.
