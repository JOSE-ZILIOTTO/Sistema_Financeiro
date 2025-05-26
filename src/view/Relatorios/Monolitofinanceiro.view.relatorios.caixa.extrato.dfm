inherited relcaixaextrato: Trelcaixaextrato
  Caption = 'relcaixaextrato'
  TextHeight = 15
  inherited RLReport1: TRLReport
    DataSource = DataSource1
    inherited RLBand5: TRLBand
      Top = 407
      ExplicitTop = 407
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 145
      Width = 718
      Height = 40
      BandType = btColumnHeader
      object RLLabel3: TRLLabel
        Left = 0
        Top = 0
        Width = 51
        Height = 24
        Align = faLeftTop
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 144
        Top = 0
        Width = 137
        Height = 24
        Align = faTopOnly
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 312
        Top = 0
        Width = 213
        Height = 24
        Align = faTopOnly
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 624
        Top = 0
        Width = 94
        Height = 24
        Align = faRightTop
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 185
      Width = 718
      Height = 222
      DataFields = 'data_cadastro'
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 27
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBText1: TRLDBText
          Left = 3
          Top = 3
          Width = 141
          Height = 24
          DataField = 'data_cadastro'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 27
        Width = 718
        Height = 30
        object RLDBText2: TRLDBText
          Left = 140
          Top = 0
          Width = 121
          Height = 24
          Align = faTopOnly
          DataField = 'numero_doc'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 287
          Top = 0
          Width = 98
          Height = 24
          Align = faTopOnly
          DataField = 'descricao'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 666
          Top = 0
          Width = 52
          Height = 24
          Align = faRightTop
          Alignment = taRightJustify
          DataField = 'valor'
          DataSource = DataSource1
          DisplayMask = 'R$0.00;R$-0.00;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 57
        Width = 718
        Height = 165
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object RLLabel7: TRLLabel
          Left = 372
          Top = 1
          Width = 138
          Height = 24
          Align = faTopOnly
          Caption = 'Saldo Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lblsaldoanterior: TRLLabel
          Left = 571
          Top = 6
          Width = 147
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 372
          Top = 30
          Width = 141
          Height = 24
          Caption = 'Total de Entradas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lbltotalentradas: TRLLabel
          Left = 571
          Top = 36
          Width = 147
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lbltotalsaidas: TRLLabel
          Left = 571
          Top = 66
          Width = 127
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel12: TRLLabel
          Left = 372
          Top = 60
          Width = 153
          Height = 24
          Caption = 'Total de Sa'#237'das'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 373
          Top = 82
          Width = 110
          Height = 24
          Caption = 'Saldo Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lblsaldofinal: TRLLabel
          Left = 571
          Top = 96
          Width = 113
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    Left = 696
    Top = 440
  end
end
