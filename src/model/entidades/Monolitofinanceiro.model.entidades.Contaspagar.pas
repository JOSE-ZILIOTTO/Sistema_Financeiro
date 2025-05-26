unit Monolitofinanceiro.model.entidades.Contaspagar;

interface

type

  TModelcontaspagar = class
  private
    Fvalorparcela: currency;
    Fdatacompra: Tdate;
    Fdatavencimento: Tdate;
    Fdatapagamento: Tdate;
    Fdocumneto: string;
    Fid: string;
    Fvalorabatido: currency;
    Fvalorcompra: currency;
    FStatus: string;
    Fdecrição: string;
    Fdatacadastro: Tdate;
    Fparcela: integer;
    procedure Setdatacadastro(const Value: Tdate);
    procedure Setdatacompra(const Value: Tdate);
    procedure Setdatapagamento(const Value: Tdate);
    procedure Setdatavencimento(const Value: Tdate);
    procedure Setdecrição(const Value: string);
    procedure Setdocumneto(const Value: string);
    procedure Setid(const Value: string);
    procedure Setparcela(const Value: integer);
    procedure SetStatus(const Value: string);
    procedure Setvalorabatido(const Value: currency);
    procedure Setvalorcompra(const Value: currency);
    procedure Setvalorparcela(const Value: currency);
  public
    property id: string read Fid write Setid;
    property documneto: string read Fdocumneto write Setdocumneto;
    property decrição: string read Fdecrição write Setdecrição;
    property parcela: integer read Fparcela write Setparcela;
    property valorparcela: currency read Fvalorparcela write Setvalorparcela;
    property valorcompra: currency read Fvalorcompra write Setvalorcompra;
    property valorabatido: currency read Fvalorabatido write Setvalorabatido;
    property datacompra: Tdate read Fdatacompra write Setdatacompra;
    property datacadastro: Tdate read Fdatacadastro write Setdatacadastro;
    property datavencimento: Tdate read Fdatavencimento write Setdatavencimento;
    property datapagamento: Tdate read Fdatapagamento write Setdatapagamento;
    property Status: string read FStatus write SetStatus;
  end;

implementation

{ TModelcontaspagar }

procedure TModelcontaspagar.Setdatacadastro(const Value: Tdate);
begin
  Fdatacadastro := Value;
end;

procedure TModelcontaspagar.Setdatacompra(const Value: Tdate);
begin
  Fdatacompra := Value;
end;

procedure TModelcontaspagar.Setdatapagamento(const Value: Tdate);
begin
  Fdatapagamento := Value;
end;

procedure TModelcontaspagar.Setdatavencimento(const Value: Tdate);
begin
  Fdatavencimento := Value;
end;

procedure TModelcontaspagar.Setdecrição(const Value: string);
begin
  Fdecrição := Value;
end;

procedure TModelcontaspagar.Setdocumneto(const Value: string);
begin
  Fdocumneto := Value;
end;

procedure TModelcontaspagar.Setid(const Value: string);
begin
  Fid := Value;
end;

procedure TModelcontaspagar.Setparcela(const Value: integer);
begin
  Fparcela := Value;
end;

procedure TModelcontaspagar.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TModelcontaspagar.Setvalorabatido(const Value: currency);
begin
  Fvalorabatido := Value;
end;

procedure TModelcontaspagar.Setvalorcompra(const Value: currency);
begin
  Fvalorcompra := Value;
end;

procedure TModelcontaspagar.Setvalorparcela(const Value: currency);
begin
  Fvalorparcela := Value;
end;

end.
