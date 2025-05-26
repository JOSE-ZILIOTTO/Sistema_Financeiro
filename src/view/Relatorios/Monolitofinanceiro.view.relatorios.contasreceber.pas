unit Monolitofinanceiro.view.relatorios.contasreceber;

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
  Trelcontasreceber = class(TrelPadrao)
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel3: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLBand6: TRLBand;
    lblvalortotal: TRLLabel;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relcontasreceber: Trelcontasreceber;

implementation

{$R *.dfm}

procedure Trelcontasreceber.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;
 lblvalortotal.Caption := 'Total R$' + Tutilitario.FormataValor(DataSource1.DataSet.FieldByName('Total').Asstring);
end;

end.
