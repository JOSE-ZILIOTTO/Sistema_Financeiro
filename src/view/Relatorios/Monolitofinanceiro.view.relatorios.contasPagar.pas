unit Monolitofinanceiro.view.relatorios.contasPagar;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Monolitofinanceiro.view.relatorios.padrao,
  Monolitofinanceiro.Utilitario,
  Data.DB, RLReport;

type
  TrelrelatorioPagar = class(TrelPadrao)
    RLLabel4: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand6: TRLBand;
    lblvalortotal: TRLLabel;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relrelatorioPagar: TrelrelatorioPagar;

implementation

{$R *.dfm}

procedure TrelrelatorioPagar.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
  lblvalortotal.Caption := 'Total R$' + Tutilitario.FormataValor(DataSource1.DataSet.FieldByName('Total').Asstring);

end;

end.
