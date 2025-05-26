object dmusuario: Tdmusuario
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object sqlusuarios: TFDQuery
    Active = True
    Connection = dmconexao.SQlconexao
    SQL.Strings = (
      'select *from usuarios')
    Left = 88
    Top = 72
  end
  object dspusuarios: TDataSetProvider
    DataSet = sqlusuarios
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 176
    Top = 72
  end
  object cdsusuarios: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 36
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 36
      end
      item
        Name = 'login'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'senha'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'status'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'data_cadastro'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'senha_temporaria'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Administrador'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspusuarios'
    StoreDefs = True
    Left = 264
    Top = 80
    object cdsusuariosid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 36
    end
    object cdsusuariosnome: TStringField
      FieldName = 'nome'
      Origin = 'NOME'
      Size = 36
    end
    object cdsusuarioslogin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Size = 50
    end
    object cdsusuariossenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 60
    end
    object cdsusuariosstatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 50
    end
    object cdsusuariosdata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
    object cdsusuariosSenha_temporaria: TStringField
      FieldKind = fkCalculated
      FieldName = 'Senha_temporaria'
      Size = 1
      Calculated = True
    end
    object cdsusuariosAdministrador: TStringField
      FieldName = 'Administrador'
      Origin = 'Administrador'
      FixedChar = True
      Size = 1
    end
  end
end
