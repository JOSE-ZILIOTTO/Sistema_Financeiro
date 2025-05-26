unit Monolitofinanceiro.model.entidades.Contasreceber;

interface
type

TModelcontasreceber = class
  private
    Fdatavenda: Tdate;
    Fvalorparcela: currency;
    Fvalorvenda: currency;
    Fdatavencimento: Tdate;
    Fdocumneto: string;
    Fid: string;
    Fvalorabatido: currency;
    FStatus: string;
    Fdecrição: string;
    Fdatacadastro: Tdate;
    Fdatarecebimento: Tdate;
    Fparcela: integer;
    procedure Setdatacadastro(const Value: Tdate);
    procedure Setdatarecebimento(const Value: Tdate);
    procedure Setdatavencimento(const Value: Tdate);
    procedure Setdatavenda(const Value: Tdate);
    procedure Setdecrição(const Value: string);
    procedure Setdocumneto(const Value: string);
    procedure Setid(const Value: string);
    procedure Setparcela(const Value: integer);
    procedure SetStatus(const Value: string);
    procedure Setvalorabatido(const Value: currency);
    procedure Setvalorparcela(const Value: currency);
    procedure Setvalorvenda(const Value: currency);
  public
      property id: string read Fid write Setid;
    property documneto: string read Fdocumneto write Setdocumneto;
    property decrição: string read Fdecrição write Setdecrição;
    property parcela: integer read Fparcela write Setparcela;
    property valorparcela: currency read Fvalorparcela write Setvalorparcela;
    property valorvenda: currency read Fvalorvenda write Setvalorvenda;
    property valorabatido: currency read Fvalorabatido write Setvalorabatido;
    property datavenda: Tdate read Fdatavenda write Setdatavenda;
    property datacadastro: Tdate read Fdatacadastro write Setdatacadastro;
    property datavencimento: Tdate read Fdatavencimento write Setdatavencimento;
    property datarecebimento: Tdate read Fdatarecebimento write Setdatarecebimento;
    property Status: string read FStatus write SetStatus;
end;

implementation

{ TModelcontasreceber }

procedure TModelcontasreceber.Setdatacadastro(const Value: Tdate);
begin
  Fdatacadastro := Value;
end;

procedure TModelcontasreceber.Setdatarecebimento(const Value: Tdate);
begin
  Fdatarecebimento := Value;
end;

procedure TModelcontasreceber.Setdatavencimento(const Value: Tdate);
begin
  Fdatavencimento := Value;
end;

procedure TModelcontasreceber.Setdatavenda(const Value: Tdate);
begin
  Fdatavenda := Value;
end;

procedure TModelcontasreceber.Setdecrição(const Value: string);
begin
  Fdecrição := Value;
end;

procedure TModelcontasreceber.Setdocumneto(const Value: string);
begin
  Fdocumneto := Value;
end;

procedure TModelcontasreceber.Setid(const Value: string);
begin
  Fid := Value;
end;

procedure TModelcontasreceber.Setparcela(const Value: integer);
begin
  Fparcela := Value;
end;

procedure TModelcontasreceber.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TModelcontasreceber.Setvalorabatido(const Value: currency);
begin
  Fvalorabatido := Value;
end;

procedure TModelcontasreceber.Setvalorparcela(const Value: currency);
begin
  Fvalorparcela := Value;
end;

procedure TModelcontasreceber.Setvalorvenda(const Value: currency);
begin
  Fvalorvenda := Value;
end;

end.
