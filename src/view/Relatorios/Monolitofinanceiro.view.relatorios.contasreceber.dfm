inherited relcontasreceber: Trelcontasreceber
  Caption = 'relcontasreceber'
  TextHeight = 15
  inherited RLReport1: TRLReport
    Top = 8
    ExplicitTop = 8
    inherited RLBand2: TRLBand
      inherited RLLabel2: TRLLabel
        Left = 228
        Width = 261
        Caption = 'Rela'#231#227'o Contas a Receber'
        ExplicitLeft = 228
        ExplicitWidth = 261
      end
    end
    inherited RLBand3: TRLBand
      Height = 28
      BandType = btDetail
      ExplicitHeight = 28
      object RLLabel5: TRLLabel
        Left = 0
        Top = -2
        Width = 115
        Height = 24
        Align = faLeftOnly
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 146
        Top = 0
        Width = 140
        Height = 24
        Align = faTopOnly
        Caption = 'N'#176' Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 336
        Top = 0
        Width = 78
        Height = 24
        Align = faTopOnly
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 456
        Top = 0
        Width = 66
        Height = 24
        Align = faTopOnly
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 560
        Top = 0
        Width = 158
        Height = 24
        Align = faRightTop
        Caption = 'Valor da parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    inherited RLBand4: TRLBand
      Top = 173
      Height = 26
      ExplicitTop = 173
      ExplicitHeight = 26
      object RLDBText1: TRLDBText
        Left = 0
        Top = 0
        Width = 115
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
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 583
        Top = 0
        Width = 135
        Height = 24
        Align = faRightTop
        DataField = 'Valor_parcela'
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
        Left = 162
        Top = 0
        Width = 75
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
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 336
        Top = 0
        Width = 78
        Height = 24
        Align = faTopOnly
        DataField = 'Parcela'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 456
        Top = 0
        Width = 66
        Height = 24
        Align = faTopOnly
        DataField = 'Status'
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
    inherited RLBand5: TRLBand
      Top = 228
      ExplicitTop = 228
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 199
      Width = 718
      Height = 29
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object lblvalortotal: TRLLabel
        Left = 664
        Top = 1
        Width = 54
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
  end
end
