unit Monolitofinanceiro.view.relatorios.padraoAgrupado;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, RLReport, Data.DB,
  Monolitofinanceiro.model.usuario;

type
  Trelpadraoagrupado = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
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
  relpadraoagrupado: Trelpadraoagrupado;

implementation

{$R *.dfm}

{ TForm1 }

procedure Trelpadraoagrupado.Dataset(aValue: TDataset);
begin
 DataSource1.Dataset := aValue;
end;

procedure Trelpadraoagrupado.preview;
begin
RLReport1.Preview;
end;

procedure Trelpadraoagrupado.RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  lblnome.Caption := Format('Impresso por %s em %s',
  [dmusuario.Getusuario.Nomeusuariologado, FormatDateTime('dd/mm/yyyy', now)]);
end;

end.
