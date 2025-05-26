object dmcontasReceber: TdmcontasReceber
  Height = 480
  Width = 640
  object sqlcontasReceber: TFDQuery
    Active = True
    Connection = dmconexao.SQlconexao
    SQL.Strings = (
      'select * from contas_receber')
    Left = 88
    Top = 72
  end
  object dspcontasReceber: TDataSetProvider
    DataSet = sqlcontasReceber
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 72
  end
  object cdscontasReceber: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    CommandText = 'select * from contas_receber'
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
        Name = 'valor_venda'
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
        Name = 'data_venda'
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
        Name = 'data_recebimento'
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
    ProviderName = 'dspcontasReceber'
    StoreDefs = True
    Left = 312
    Top = 72
    object cdscontasReceberid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdscontasRecebernumero: TStringField
      FieldName = 'numero'
      Origin = 'numero'
      Required = True
      Size = 50
    end
    object cdscontasReceberdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object cdscontasReceberparcela: TIntegerField
      FieldName = 'parcela'
      Origin = 'parcela'
      Required = True
    end
    object cdscontasRecebervalor_venda: TFMTBCDField
      FieldName = 'valor_venda'
      Origin = 'valor_venda'
      Required = True
      DisplayFormat = 'R$0.00 ; R$ -0.00;'
      Precision = 18
      Size = 2
    end
    object cdscontasRecebervalor_parcela: TFMTBCDField
      FieldName = 'valor_parcela'
      Origin = 'valor_parcela'
      Required = True
      DisplayFormat = 'R$0.00 ; R$ -0.00;'
      Precision = 18
      Size = 2
    end
    object cdscontasRecebervalor_abatido: TFMTBCDField
      FieldName = 'valor_abatido'
      Origin = 'valor_abatido'
      Required = True
      DisplayFormat = 'R$0.00 ; R$ -0.00;'
      Precision = 18
      Size = 2
    end
    object cdscontasReceberdata_venda: TDateField
      FieldName = 'data_venda'
      Origin = 'data_venda'
      Required = True
    end
    object cdscontasReceberdata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
    object cdscontasReceberdata_vencimento: TDateField
      FieldName = 'data_vencimento'
      Origin = 'data_vencimento'
      Required = True
    end
    object cdscontasReceberdata_recebimento: TDateField
      FieldName = 'data_recebimento'
      Origin = 'data_recebimento'
    end
    object cdscontasReceberstatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdscontasReceberTotal: TAggregateField
      FieldName = 'Total'
      Active = True
      DisplayName = ''
      Expression = 'SUM(valor_parcela)'
    end
  end
  object sqlcontasReceberdetalhes: TFDQuery
    AggregatesActive = True
    Connection = dmconexao.SQlconexao
    SQL.Strings = (
      'select * from contas_receber_detalhes'
      '  ')
    Left = 96
    Top = 152
    object sqlcontasReceberdetalhesid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object sqlcontasReceberdetalhesid_contas_receber: TStringField
      FieldName = 'id_contas_receber'
      Origin = 'id_contas_receber'
      Required = True
      FixedChar = True
      Size = 36
    end
    object sqlcontasReceberdetalhesdetalhes: TStringField
      FieldName = 'detalhes'
      Origin = 'detalhes'
      Required = True
      Size = 100
    end
    object sqlcontasReceberdetalhesnumero_doc: TStringField
      FieldName = 'numero_doc'
      Origin = 'numero_doc'
      Size = 50
    end
    object sqlcontasReceberdetalhesvalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      DisplayFormat = 'R$0.00 ; R$ -0.00;'
      Precision = 18
      Size = 2
    end
    object sqlcontasReceberdetalhesdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object sqlcontasReceberdetalhesusuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 50
    end
    object sqlcontasReceberdetalheslogin: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'login'
      Origin = 'login'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object sqlcontasReceberdetalhessenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object sqlcontasReceberdetalhesstatus: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'status'
      Origin = 'status'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object sqlcontasReceberdetalhesdata_cadastro: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      ProviderFlags = []
      ReadOnly = True
    end
    object sqlcontasReceberdetalhessenha_temporaria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha_temporaria'
      Origin = 'senha_temporaria'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object sqlcontasReceberdetalhesid_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'id_1'
      Origin = 'id'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 36
    end
    object sqlcontasReceberdetalhesNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 36
    end
    object sqlcontasReceberdetalhesTotal: TAggregateField
      FieldName = 'Total'
      DisplayName = ''
      Expression = 'SUM(valor)'
    end
  end
  object sqlrelcontasreceberdetalhado: TFDQuery
    AggregatesActive = True
    Connection = dmconexao.SQlconexao
    SQL.Strings = (
      '')
    Left = 280
    Top = 152
    object sqlrelcontasreceberdetalhadoid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 36
    end
    object sqlrelcontasreceberdetalhadoid_contas_receber: TStringField
      FieldName = 'id_contas_receber'
      Origin = 'id_contas_receber'
      Required = True
      FixedChar = True
      Size = 36
    end
    object sqlrelcontasreceberdetalhadodetalhes: TStringField
      FieldName = 'detalhes'
      Origin = 'detalhes'
      Required = True
      Size = 100
    end
    object sqlrelcontasreceberdetalhadonumero_doc: TStringField
      FieldName = 'numero_doc'
      Origin = 'numero_doc'
      Size = 50
    end
    object sqlrelcontasreceberdetalhadovalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlrelcontasreceberdetalhadodata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object sqlrelcontasreceberdetalhadousuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 50
    end
    object sqlrelcontasreceberdetalhadonumero: TStringField
      FieldName = 'numero'
      Origin = 'numero'
      Required = True
      Size = 50
    end
    object sqlrelcontasreceberdetalhadodescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 200
    end
    object sqlrelcontasreceberdetalhadoparcela: TIntegerField
      FieldName = 'parcela'
      Origin = 'parcela'
      Required = True
    end
    object sqlrelcontasreceberdetalhadovalor_venda: TFMTBCDField
      FieldName = 'valor_venda'
      Origin = 'valor_venda'
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlrelcontasreceberdetalhadovalor_parcela: TFMTBCDField
      FieldName = 'valor_parcela'
      Origin = 'valor_parcela'
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlrelcontasreceberdetalhadovalor_abatido: TFMTBCDField
      FieldName = 'valor_abatido'
      Origin = 'valor_abatido'
      Required = True
      Precision = 18
      Size = 2
    end
    object sqlrelcontasreceberdetalhadodata_venda: TDateField
      FieldName = 'data_venda'
      Origin = 'data_venda'
      Required = True
    end
    object sqlrelcontasreceberdetalhadodata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
    object sqlrelcontasreceberdetalhadodata_vencimento: TDateField
      FieldName = 'data_vencimento'
      Origin = 'data_vencimento'
      Required = True
    end
    object sqlrelcontasreceberdetalhadodata_recebimento: TDateField
      FieldName = 'data_recebimento'
      Origin = 'data_recebimento'
    end
    object sqlrelcontasreceberdetalhadostatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object sqlrelcontasreceberdetalhadoid_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'id_1'
      Origin = 'id'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 36
    end
    object AggregateField1: TAggregateField
      FieldName = 'Total'
      DisplayName = ''
      Expression = 'SUM(valor)'
    end
  end
end
