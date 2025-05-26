unit Monolitofinanceiro.model.entidades.ContaspagarDetalhe;

interface

type

  TModelContaPagarDetalhe = class

  private
    Fvalor: currency;
    Fdetalhes: string;
    Fid: string;
    Fidcontapagar: string;
    Fusuario: string;
    Fdata: Tdate;
    procedure Setdata(const Value: Tdate);
    procedure Setdetalhes(const Value: string);
    procedure Setid(const Value: string);
    procedure Setidcontapagar(const Value: string);
    procedure Setusuario(const Value: string);
    procedure Setvalor(const Value: currency);
  public

    property id: string read Fid write Setid;
    property idcontapagar: string read Fidcontapagar write Setidcontapagar;
    property detalhes: string read Fdetalhes write Setdetalhes;
    property valor: currency read Fvalor write Setvalor;
    property data: Tdate read Fdata write Setdata;
    property usuario: string read Fusuario write Setusuario;
  end;

implementation

{ TModelContaPagarDetalhe }

procedure TModelContaPagarDetalhe.Setdata(const Value: Tdate);
begin
  Fdata := Value;
end;

procedure TModelContaPagarDetalhe.Setdetalhes(const Value: string);
begin
  Fdetalhes := Value;
end;

procedure TModelContaPagarDetalhe.Setid(const Value: string);
begin
  Fid := Value;
end;

procedure TModelContaPagarDetalhe.Setidcontapagar(const Value: string);
begin
  Fidcontapagar := Value;
end;

procedure TModelContaPagarDetalhe.Setusuario(const Value: string);
begin
  Fusuario := Value;
end;

procedure TModelContaPagarDetalhe.Setvalor(const Value: currency);
begin
  Fvalor := Value;
end;

end.
