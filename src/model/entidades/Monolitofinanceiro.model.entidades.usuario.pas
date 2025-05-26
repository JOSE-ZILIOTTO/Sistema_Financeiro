unit Monolitofinanceiro.model.entidades.usuario;

interface
type
Tmodelentidadeusuario = class
private
    Floginusuariologado: string;
    FNomeusuariologado: string;
    Fidusuariologado: string;
    FSenha: string;
    Fsenhatemporaria: Boolean;
    FAdministrador: boolean;


    procedure setidusuariologado(const Value: string);
    procedure setloginusuariologado(const Value: string);
    procedure setNomeusuariologado(const Value: string);
    procedure SetSenha(const Value: string);
    procedure Setsenhatemporaria(const Value: Boolean);
    procedure SetAdministrador(const Value: boolean);

public
    property Nomeusuariologado: string read FNomeusuariologado write setNomeusuariologado;
    property loginusuariologado: string read Floginusuariologado write setloginusuariologado;
    property idusuariologado: string read Fidusuariologado write setidusuariologado;
    property Senha : string read FSenha write SetSenha;
    property senhaTemporaria :Boolean read Fsenhatemporaria write Setsenhatemporaria;
    property Administrador : boolean read FAdministrador write SetAdministrador;
 end;
implementation

{ Tmodelentidadeusuario }

procedure Tmodelentidadeusuario.SetAdministrador(const Value: boolean);
begin
  FAdministrador := Value;
end;

procedure Tmodelentidadeusuario.setidusuariologado(const Value: string);
begin
  Fidusuariologado := Value;
end;

procedure Tmodelentidadeusuario.setloginusuariologado(const Value: string);
begin
  Floginusuariologado := Value;
end;

procedure Tmodelentidadeusuario.setNomeusuariologado(const Value: string);
begin
  FNomeusuariologado := Value;
end;

procedure Tmodelentidadeusuario.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure Tmodelentidadeusuario.Setsenhatemporaria(const Value: Boolean);
begin
  Fsenhatemporaria := Value;
end;

end.
