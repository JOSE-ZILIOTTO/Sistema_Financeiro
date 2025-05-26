inherited relrelatorioPagar: TrelrelatorioPagar
  Caption = 'relrelatorioPagar'
  TextHeight = 15
  inherited RLReport1: TRLReport
    inherited RLBand2: TRLBand
      inherited RLLabel2: TRLLabel
        Left = 226
        Width = 266
        Caption = 'Rela'#231#227'o de Contas a Pagar'
        ExplicitLeft = 226
        ExplicitWidth = 266
      end
    end
    inherited RLBand3: TRLBand
      object RLLabel4: TRLLabel
        Left = 0
        Top = 11
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
      object RLLabel9: TRLLabel
        Left = 154
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
      object RLLabel10: TRLLabel
        Left = 344
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
      object RLLabel11: TRLLabel
        Left = 464
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
      object RLLabel12: TRLLabel
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
      Height = 48
      ExplicitHeight = 48
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
      object RLDBText3: TRLDBText
        Left = 154
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
        Left = 344
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
        Left = 464
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
    end
    inherited RLBand5: TRLBand
      Top = 264
      ExplicitTop = 264
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 229
      Width = 718
      Height = 35
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
