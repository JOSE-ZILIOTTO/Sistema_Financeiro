unit Monolitofinanceiro.model.entidades.Caixa.Lancamento;

interface

type

TModelCaixalancamento = class
private
    FValor: currency;
    FNumeroDoc: string;
    FDescricao: string;
    FID: string;
    FDataCadastro: Tdate;
    FTipo: string;
    procedure SetDataCadastro(const Value: Tdate);
    procedure SetDescricao(const Value: string);
    procedure SetID(const Value: string);
    procedure SetNumeroDoc(const Value: string);
    procedure SetTipo(const Value: string);
    procedure SetValor(const Value: currency);

public

property ID : string read FID write SetID;
property NumeroDoc : string read FNumeroDoc write SetNumeroDoc;
property Descricao : string read FDescricao write SetDescricao;
property Valor : currency read FValor write SetValor;
property Tipo : string read FTipo write SetTipo;
property DataCadastro : Tdate read FDataCadastro write SetDataCadastro;
end;

implementation

{ TModelCaixalancamento }

procedure TModelCaixalancamento.SetDataCadastro(const Value: Tdate);
begin
  FDataCadastro := Value;
end;

procedure TModelCaixalancamento.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TModelCaixalancamento.SetID(const Value: string);
begin
  FID := Value;
end;

procedure TModelCaixalancamento.SetNumeroDoc(const Value: string);
begin
  FNumeroDoc := Value;
end;

procedure TModelCaixalancamento.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

procedure TModelCaixalancamento.SetValor(const Value: currency);
begin
  FValor := Value;
end;

end.
