unit Monolitofinanceiro.view.relatorios.usuarios;

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
  Monolitofinanceiro.view.relatorios.padrao,
  Data.DB,
  Monolitofinanceiro.Utilitario,
  RLReport;

type
  Trelusuarios = class(TrelPadrao)
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relusuarios: Trelusuarios;

implementation

{$R *.dfm}

end.
