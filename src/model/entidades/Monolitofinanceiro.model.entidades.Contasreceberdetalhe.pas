unit Monolitofinanceiro.model.entidades.Contasreceberdetalhe;

interface

type

TModelContareceberDetalhe = class
  private
    Fvalor: currency;
    Fidcontareceber: string;
    Fdetalhes: string;
    Fid: string;
    Fusuario: string;
    Fdata: Tdate;
    procedure Setdata(const Value: Tdate);
    procedure Setdetalhes(const Value: string);
    procedure Setid(const Value: string);
    procedure Setidcontareceber(const Value: string);
    procedure Setusuario(const Value: string);
    procedure Setvalor(const Value: currency);
  public
      property id: string read Fid write Setid;
    property idcontareceber: string read Fidcontareceber write Setidcontareceber;
    property detalhes: string read Fdetalhes write Setdetalhes;
    property valor: currency read Fvalor write Setvalor;
    property data: Tdate read Fdata write Setdata;
    property usuario: string read Fusuario write Setusuario;
end;

implementation

{ TModelContareceberDetalhe }

procedure TModelContareceberDetalhe.Setdata(const Value: Tdate);
begin
  Fdata := Value;
end;

procedure TModelContareceberDetalhe.Setdetalhes(const Value: string);
begin
  Fdetalhes := Value;
end;

procedure TModelContareceberDetalhe.Setid(const Value: string);
begin
  Fid := Value;
end;

procedure TModelContareceberDetalhe.Setidcontareceber(const Value: string);
begin
  Fidcontareceber := Value;
end;

procedure TModelContareceberDetalhe.Setusuario(const Value: string);
begin
  Fusuario := Value;
end;

procedure TModelContareceberDetalhe.Setvalor(const Value: currency);
begin
  Fvalor := Value;
end;

end.
