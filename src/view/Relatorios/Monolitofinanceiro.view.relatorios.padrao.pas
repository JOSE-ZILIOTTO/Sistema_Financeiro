unit Monolitofinanceiro.view.relatorios.padrao;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  RLReport, Data.DB,
  Monolitofinanceiro.model.usuario;

type
  TrelPadrao = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    lblnome: TRLLabel;
    DataSource1: TDataSource;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Dataset(aValue: TDataset);
    procedure preview;
  end;

var
  relPadrao: TrelPadrao;

implementation

{$R *.dfm}
{ TrelPadrao }

procedure TrelPadrao.Dataset(aValue: TDataset);
begin
  DataSource1.Dataset := aValue;
end;

procedure TrelPadrao.preview;
begin
  RLReport1.preview;
end;

procedure TrelPadrao.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  lblnome.Caption := Format('Impresso por %s em %s',
  [dmusuario.Getusuario.Nomeusuariologado, FormatDateTime('dd/mm/yyyy', now)]);
end;

end.
