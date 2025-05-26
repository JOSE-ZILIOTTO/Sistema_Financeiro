object dmCaixa: TdmCaixa
  Height = 480
  Width = 640
  object sqlcaixa: TFDQuery
    Connection = dmconexao.SQlconexao
    SQL.Strings = (
      'select *  from caixas')
    Left = 88
    Top = 72
    object sqlcaixanumero_doc: TStringField
      FieldName = 'numero_doc'
      Origin = 'numero_doc'
      Required = True
      Size = 50
    end
    object sqlcaixavalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlcaixatipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 1
    end
    object sqlcaixadata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object sqlcaixaid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object sqlcaixadescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object dspCaixa: TDataSetProvider
    DataSet = sqlcaixa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 176
    Top = 72
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'numero_doc'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'valor'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'tipo'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 1
      end
      item
        Name = 'data_cadastro'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'id'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 36
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspCaixa'
    StoreDefs = True
    Left = 264
    Top = 80
    object cdsCaixanumero_doc: TStringField
      FieldName = 'numero_doc'
      Origin = 'numero_doc'
      Required = True
      Size = 50
    end
    object cdsCaixavalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCaixatipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 1
    end
    object cdsCaixadata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
    object cdsCaixaid: TStringField
      FieldName = 'id'
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdsCaixadescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  object sqlcaixaextrato: TFDQuery
    Active = True
    Connection = dmconexao.SQlconexao
    SQL.Strings = (
      'select *  from caixas')
    Left = 144
    Top = 192
  end
end
