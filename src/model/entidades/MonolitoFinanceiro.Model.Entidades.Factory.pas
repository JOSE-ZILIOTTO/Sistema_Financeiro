unit MonolitoFinanceiro.Model.Entidades.Factory;

interface

uses
  MonolitoFinanceiro.EntityManager,
  MonolitoFinanceiro.Model.Entidades.Usuario,
  Monolitofinanceiro.model.entidades.Contasreceber,
  Monolitofinanceiro.model.entidades.Contasreceberdetalhe,
  Monolitofinanceiro.model.entidades.Contaspagar,
  Monolitofinanceiro.model.entidades.ContaspagarDetalhe,
  MonolitoFinanceiro.Model.Entidades.Caixa.Lancamento,
  MonolitoFinanceiro.Model.Entidades.Caixa.Resumo;

type
  TUsuarioFactory = class(TInterfacedObject, IEntityFactory<TModelEntidadeUsuario>)
  public
    function CreateEntity: TModelEntidadeUsuario;
  end;

  TContaReceberFactory = class(TInterfacedObject, IEntityFactory<TModelcontasreceber>)
  public
    function CreateEntity: TModelcontasreceber;
  end;

  TContaReceberDetalheFactory = class(TInterfacedObject, IEntityFactory<TModelContaReceberDetalhe>)
  public
    function CreateEntity: TModelContaReceberDetalhe;
  end;

  TContaPagarFactory = class(TInterfacedObject, IEntityFactory<TModelcontaspagar>)
  public
    function CreateEntity: TModelcontaspagar;
  end;

  TContaPagarDetalheFactory = class(TInterfacedObject, IEntityFactory<TModelContaPagarDetalhe>)
  public
    function CreateEntity: TModelContaPagarDetalhe;
  end;

  TResumoCaixaFactory = class(TInterfacedObject, IEntityFactory<TModelResumoCaixa>)
  public
    function CreateEntity: TModelResumoCaixa;
  end;

  TCaixaLancamentoFactory = class(TInterfacedObject, IEntityFactory<TModelCaixaLancamento>)
  public
    function CreateEntity: TModelCaixaLancamento;
  end;

implementation

{ TUsuarioFactory }

function TUsuarioFactory.CreateEntity: TModelEntidadeUsuario;
begin
  Result := TModelEntidadeUsuario.Create;
end;

{ TContaReceberFactory }

function TContaReceberFactory.CreateEntity: TModelcontasreceber;
begin
  Result := TModelcontasreceber.Create;
end;

{ TContaReceberDetalheFactory }

function TContaReceberDetalheFactory.CreateEntity: TModelContaReceberDetalhe;
begin
  Result := TModelContaReceberDetalhe.Create;
end;

{ TResumoCaixaFactory }

function TResumoCaixaFactory.CreateEntity: TModelResumoCaixa;
begin
  Result := TModelResumoCaixa.create;
end;

{ TContaPagarFactory }

function TContaPagarFactory.CreateEntity: TModelcontaspagar;
begin
  Result := TModelcontaspagar.create;
end;

{ TContaPagarDetalheFactory }

function TContaPagarDetalheFactory.CreateEntity: TModelContaPagarDetalhe;
begin
  Result := TModelContaPagarDetalhe.create;
end;

{ TCaixaLancamentoFactory }

function TCaixaLancamentoFactory.CreateEntity: TModelCaixaLancamento;
begin
  Result := TModelCaixaLancamento.create;
end;

end.
