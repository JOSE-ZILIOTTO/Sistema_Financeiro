object dmcontaspagar: Tdmcontaspagar
  Height = 480
  Width = 640
  object sqlcontaspagar: TFDQuery
    Connection = dmconexao.SQlconexao
    SQL.Strings = (
      'select * from contas_pagar')
    Left = 88
    Top = 72
  end
  object dspcontaspagar: TDataSetProvider
    DataSet = sqlcontaspagar
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 176
    Top = 72
  end
  object cdscontaspagar: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    CommandText = 'select * from contas_pagar'
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 36
      end
      item
        Name = 'numero'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'parcela'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'valor_compra'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'valor_parcela'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'valor_abatido'
        Attributes = [faRequired]
        DataType = ftFMTBcd
        Precision = 18
        Size = 2
      end
      item
        Name = 'data_compra'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'data_cadastro'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'data_vencimento'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'data_pagamento'
        DataType = ftDate
      end
      item
        Name = 'status'
        Attributes = [faRequired, faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspcontaspagar'
    StoreDefs = True
    Left = 272
    Top = 80
    object cdscontaspagarid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdscontaspagarnumero: TStringField
      FieldName = 'numero'
      Origin = 'numero'
      Required = True
      Size = 50
    end
    object cdscontaspagardescrição: TStringField
      FieldName = 'descricao'
      Origin = '"descri'#231#227'o"'
      Size = 200
    end
    object cdscontaspagarparcela: TIntegerField
      FieldName = 'parcela'
      Origin = 'parcela'
      Required = True
    end
    object cdscontaspagarvalor_compra: TFMTBCDField
      FieldName = 'valor_compra'
      Origin = 'valor_compra'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdscontaspagarvalor_parcela: TFMTBCDField
      FieldName = 'valor_parcela'
      Origin = 'valor_parcela'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdscontaspagarvalor_abatido: TFMTBCDField
      FieldName = 'valor_abatido'
      Origin = 'valor_abatido'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdscontaspagardata_compra: TDateField
      FieldName = 'data_compra'
      Origin = 'data_compra'
      Required = True
    end
    object cdscontaspagardata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
    object cdscontaspagardata_vencimento: TDateField
      FieldName = 'data_vencimento'
      Origin = 'data_vencimento'
      Required = True
    end
    object cdscontaspagardata_pagamento: TDateField
      FieldName = 'data_pagamento'
      Origin = 'data_pagamento'
    end
    object cdscontaspagarstatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdscontaspagarTotal: TAggregateField
      FieldName = 'Total'
      Active = True
      DisplayName = ''
      Expression = 'SUM(valor_parcela)'
    end
  end
  object sqlcontasPagardetalhes: TFDQuery
    AggregatesActive = True
    Connection = dmconexao.SQlconexao
    SQL.Strings = (
      'select * from contas_Pagar_detalhes'
      '  ')
    Left = 336
    Top = 240
    object sqlcontasPagardetalhesid: TStringField
      FieldName = 'id'
      Origin = 'id_contas_pagar'
      Required = True
      FixedChar = True
      Size = 36
    end
    object sqlcontasPagardetalhesdetalhes: TStringField
      FieldName = 'detalhes'
      Origin = 'detalhes'
      Required = True
      Size = 100
    end
    object sqlcontasPagardetalhesid_contas_pagar: TStringField
      FieldName = 'id_contas_pagar'
      Origin = 'id_contas_pagar'
      Required = True
      FixedChar = True
      Size = 36
    end
    object sqlcontasPagardetalhesnumero_doc: TStringField
      FieldName = 'numero_doc'
      Origin = 'numero_doc'
      Size = 50
    end
    object sqlcontasPagardetalhesvalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlcontasPagardetalhesdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object sqlcontasPagardetalhesusuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 50
    end
    object sqlcontasPagardetalhesNome: TStringField
      FieldName = 'Nome'
    end
    object sqlcontasPagardetalhesTotal: TAggregateField
      FieldName = 'Total'
      DisplayName = ''
      Expression = 'SUM(valor)'
    end
  end
end
