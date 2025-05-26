unit Monolitofinanceiro.model.entidades.Caixa.Resumo;

interface
type
TMODELRESUMOCAIXA = class
private
    FtotalSaidas: Currency;
    FTotalentradas: Currency;
    FSaldoincial: Currency;
    procedure SetSaldoincial(const Value: Currency);
    procedure SetTotalentradas(const Value: Currency);
    procedure SettotalSaidas(const Value: Currency);
public
 property Saldoincial : Currency read FSaldoincial write SetSaldoincial;
 property Totalentradas : Currency read FTotalentradas write SetTotalentradas;
 property totalSaidas : Currency  read FtotalSaidas write SettotalSaidas;
 function Saldoparcial : Currency;
 function Saldofinal : Currency;
end;

implementation

{ TMODELRESUMOCAIXA }

function TMODELRESUMOCAIXA.Saldofinal: Currency;
begin
result := FSaldoincial + Saldoparcial;
end;

function TMODELRESUMOCAIXA.Saldoparcial: Currency;
begin
  result := FTotalentradas - FtotalSaidas;
end;

procedure TMODELRESUMOCAIXA.SetSaldoincial(const Value: Currency);
begin
  FSaldoincial := Value;
end;

procedure TMODELRESUMOCAIXA.SetTotalentradas(const Value: Currency);
begin
  FTotalentradas := Value;
end;

procedure TMODELRESUMOCAIXA.SettotalSaidas(const Value: Currency);
begin
  FtotalSaidas := Value;
end;

end.
