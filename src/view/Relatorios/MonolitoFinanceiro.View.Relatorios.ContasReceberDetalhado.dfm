inherited RelContasReceberDetalhado: TRelContasReceberDetalhado
  Caption = 'RelContasReceberDetalhado'
  ClientWidth = 777
  ExplicitWidth = 793
  TextHeight = 15
  inherited RLReport1: TRLReport
    DataSource = DataSource1
    ForcePrepare = False
    inherited RLBand2: TRLBand
      inherited RLLabel2: TRLLabel
        Left = 163
        Width = 391
        Caption = 'Rela'#231#227'o de Contas a Receber Detalhado'
        ExplicitLeft = 163
        ExplicitWidth = 391
      end
    end
    inherited RLBand5: TRLBand
      Top = 321
      ExplicitTop = 321
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 145
      Width = 718
      Height = 176
      DataFields = 'ID'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBText1: TRLDBText
          Left = 0
          Top = 0
          Width = 287
          Height = 24
          Align = faLeftTop
          DataField = 'data_vencimento'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = 'Vencimento: '
        end
        object RLDBText2: TRLDBText
          Left = 270
          Top = 0
          Width = 125
          Height = 24
          Align = faTopOnly
          DataField = 'numero'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = 'Doc: '
        end
        object RLDBText3: TRLDBText
          Left = 401
          Top = 0
          Width = 135
          Height = 24
          Align = faTopOnly
          DataField = 'status'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = 'Status: '
        end
        object RLDBText4: TRLDBText
          Left = 528
          Top = 0
          Width = 190
          Height = 24
          Align = faRightTop
          DataField = 'valor_Parcela'
          DataSource = DataSource1
          DisplayMask = 'R$ ,0.00;R$ -,0.00;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = 'Valor:'
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 33
        Width = 718
        Height = 32
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel3: TRLLabel
          Left = 16
          Top = 0
          Width = 129
          Height = 24
          Align = faTopOnly
          Caption = 'Recebimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 171
          Top = 0
          Width = 89
          Height = 24
          Align = faTopOnly
          Caption = 'Detalhes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 664
          Top = 0
          Width = 54
          Height = 24
          Align = faRightTop
          Alignment = taRightJustify
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 65
        Width = 718
        Height = 24
        GreenBarPrint = True
        object RLDBText5: TRLDBText
          Left = 16
          Top = 0
          Width = 47
          Height = 24
          Align = faTopOnly
          DataField = 'data'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 171
          Top = 0
          Width = 85
          Height = 24
          Align = faTopOnly
          DataField = 'detalhes'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 666
          Top = 0
          Width = 52
          Height = 24
          Align = faRightTop
          Alignment = taRightJustify
          DataField = 'valor'
          DataSource = DataSource1
          DisplayMask = 'R$ ,0.00;R$ -,0.00;'
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
        Top = 89
        Width = 718
        Height = 40
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 343
          Top = 0
          Width = 375
          Height = 26
          Align = faRightTop
          Alignment = taRightJustify
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = False
          DataField = 'valor_abatido'
          DataSource = DataSource1
          DisplayMask = 'R$ ,0.00;R$ -,0.00;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Info = riLastText
          ParentFont = False
          Text = 'Total Recebido'
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    Left = 733
    Top = 476
  end
end
