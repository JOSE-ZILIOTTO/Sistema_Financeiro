unit Monolitofinanceiro.model.DAO.usuario;

interface

uses
  Monolitofinanceiro.model.entidades.usuario,
  System.Contnrs,
  Monolitofinanceiro.model.DAO.base,
  Data.DB,
  System.Generics.Collections,
  System.TypInfo,
  System.Math,
  System.StrUtils,
  SysUtils,
  Monolitofinanceiro.Utilitario,
  FireDAC.DatS,
  BCrypt,
  System.Variants;

type
  TDAOUsuario = class(TDAObase)

  private
    FEndity: Tmodelentidadeusuario;

    function SelectById(Value: String): Tmodelentidadeusuario;
    function Datasettoendity(Value: Tdataset): Tmodelentidadeusuario;
    function DatasettoList(Value: Tdataset): TobjectList<Tmodelentidadeusuario>;

    procedure UpdateClass(Classin: Tmodelentidadeusuario; var Classout: Tmodelentidadeusuario);
  public
    constructor Create; override;
    destructor Destroy; override;

    function Update(Value: Tobject): Tobject; override;
    function Insert(Value: Tobject): Tobject; override;
    function FindAll: TobjectList; override;
    function FindById(aID: Variant): Tobject; override;
    function FindWhere(aKey: string; aVAlue: Variant): TobjectList; override;

    function FindOneWhere(aKey: string; aVAlue: Variant): Tobject;
  end;

implementation

{ TDAOUsuario }

constructor TDAOUsuario.Create;
begin
  inherited;
  FEndity := Tmodelentidadeusuario.Create;
end;

function TDAOUsuario.Datasettoendity(Value: Tdataset): Tmodelentidadeusuario;
begin
  result := nil;

  if Value.RecordCount > 0 then
  begin
    result := Tmodelentidadeusuario.Create;
    try
      result.Nomeusuariologado := Value.FieldByName('NOME').AsString;
      result.loginusuariologado := Value.FieldByName('LOGIN').AsString;
      result.Senha := Value.FieldByName('SENHA').AsString;
      result.idusuariologado := Value.FieldByName('ID').AsString;
      result.senhaTemporaria := NOT(Value.FieldByName('SENHA_TEMPORARIA').AsString = 'S');
      result.Administrador := NOT(Value.FieldByName('ADMINISTRADOR').AsString = 'S');

    except
      result.Free;
      raise;
    end;
  end;

end;

function TDAOUsuario.DatasettoList(Value: Tdataset): TobjectList<Tmodelentidadeusuario>;
begin
  result := TobjectList<Tmodelentidadeusuario>.Create;
  try
    Value.First;
    while not Value.Eof do
    begin
      result.Add(Datasettoendity(Value));
      Value.next;

    end;
  except
    result.Free;
    raise;
  end;
end;

destructor TDAOUsuario.Destroy;
begin
  FEndity.Free;
  inherited;
end;

function TDAOUsuario.FindAll: TobjectList;
begin
  var
  LLista := DatasettoList(FQuery.SQL('select * from usuario ').ExecSql);

  result := TobjectList.Create;
  for var I in LLista do
    result.Add(I);

end;

function TDAOUsuario.FindById(aID: Variant): Tobject;
begin
  result := SelectById(vartostr(aID));
end;

function TDAOUsuario.FindOneWhere(aKey: string; aVAlue: Variant): Tobject;
begin
  var
  LDataset := FQuery.SQL('select *from usuario where' + aKey + ' = ' + aKey + 'Limit 1').Params(aKey, aVAlue).ExecSql;

  result := Datasettoendity(LDataset);
end;

function TDAOUsuario.FindWhere(aKey: string; aVAlue: Variant): TobjectList;
begin
 var
  LLista := DatasettoList(FQuery.SQL('select * from usuario '+ akey + ' = ' +akey )
  .Params(akey, avalue)
  .ExecSql);

  result := TobjectList.Create;
  for var I in LLista do
    result.Add(I);
end;

function TDAOUsuario.Insert(Value: Tobject): Tobject;
begin
  var
  Lusuario := Tmodelentidadeusuario(Value);
  var
  Lid := Tutilitario.getId;
  var
  LSQL := 'INSERT INTO USUARIOS (ID,NOME,LOGIN,SENHA,STATUS,DATA_CADASTRO,SENHA_TEMPORARIA,ADMINISTRADOR) ' +
    'VALUES (:ID,:NOME,:LOGIN,:SENHA,:STATUS,:DATA_CADASTRO,:SENHA_TEMPORARIA,:ADMINISTRADOR)';
  var
  LDataset := FQuery.SQL(LSQL).Params('id', Lid)
    .Params('NOME', Lusuario.Nomeusuariologado)
    .Params('LOGIN', Lusuario.loginusuariologado)
    .Params('SENHA', TBCrypt.GenerateHash(Lusuario.Senha))
    .Params('DATA_CADASTRO', datetostr(now))
    .Params('SENHA_TEMPORARIA', ifthen(Lusuario.senhaTemporaria, 'S', 'N'))
    .Params('ADMINISTRADOR', ifthen(Lusuario.Administrador, 'S', 'N'))
    .Params('STATUS', 'A').ExecSql;

  result := SelectById(Lid);
end;

function TDAOUsuario.SelectById(Value: String): Tmodelentidadeusuario;
begin
  result := Datasettoendity(FQuery.SQL('SELECT * FROM USUARIO WHERE ID = :ID').Params('ID', Value).ExecSql);
end;

function TDAOUsuario.Update(Value: Tobject): Tobject;
begin
  var
  Lusuario := SelectById(Tmodelentidadeusuario(Value).idusuariologado);
  UpdateClass(Tmodelentidadeusuario(Value), Lusuario);

  FQuery.SQL('update from usuario set nome= :nome, login= :login, senha = :senha,' + ' senha_temporaria = ' +
    ifthen(Lusuario.senhaTemporaria, 'S', 'N') + ',administrador = ' + ifthen(Lusuario.Administrador, 'S', 'N') +
    ' where id = :id').Params('nome', Lusuario.Nomeusuariologado).Params('login', Lusuario.loginusuariologado)
    .Params('id', Lusuario.idusuariologado).ExecSql;

  result := Lusuario
end;

procedure TDAOUsuario.UpdateClass(Classin: Tmodelentidadeusuario; var Classout: Tmodelentidadeusuario);
begin
  var
    LListaPropertyin: TpropList;
  var
    LListaPropertyout: TpropList;

  GetPropList(Typeinfo(Tmodelentidadeusuario), tkAny, @LListaPropertyin);
  GetPropList(Typeinfo(Tmodelentidadeusuario), tkAny, @LListaPropertyout);

  for var I := Low(LListaPropertyin) to High(LListaPropertyin) do
  begin
    var
    Lvaluein := GetPropValue(Classin, LListaPropertyin[I]^.Name);
    for var O := Low(LListaPropertyout) to High(LListaPropertyout) do
    begin
      var
      Lvalueout := GetPropValue(Classin, LListaPropertyout[O]^.Name);
      if (LListaPropertyin[I]^.Name = LListaPropertyout[O]^.Name) and (Lvaluein <> Lvalueout) then
        SetPropValue(Classout, LListaPropertyout[O]^.Name, Lvaluein);
    end;

  end;

end;

end.
