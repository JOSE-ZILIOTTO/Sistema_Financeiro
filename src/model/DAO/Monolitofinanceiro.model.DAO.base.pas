unit Monolitofinanceiro.model.DAO.base;

interface

uses
  Monolitofinanceiro.model.Resources.interfaces,
  Monolitofinanceiro.model.Resources.Query, System.Contnrs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
 TDAObase = class

 protected
  FQuery : IQuery;
 public
  constructor Create ; virtual;

  function Update (Value : Tobject) : Tobject; virtual; abstract;
  function Insert (Value : Tobject) : Tobject; virtual; abstract;
  function FindAll : TobjectList; virtual; abstract;
  function FindById (aID : Variant) : Tobject; virtual; abstract;
  function FindWhere(aKey : string; aVAlue : Variant): TobjectList; virtual; abstract;
 end;

implementation

{ TDAObase }

constructor TDAObase.Create;
begin
FQuery := TQuery.new;
end;

end.
