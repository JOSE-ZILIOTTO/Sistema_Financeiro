inherited relrelatoriocaixa: Trelrelatoriocaixa
  Caption = 'relrelatoriocaixa'
  ClientWidth = 790
  ExplicitWidth = 806
  TextHeight = 15
  inherited RLReport1: TRLReport
    DataSource = DataSource1
    inherited RLBand2: TRLBand
      inherited RLLabel2: TRLLabel
        Left = 272
        Width = 173
        Caption = 'Rela'#231#227'o do Caixa'
        ExplicitLeft = 272
        ExplicitWidth = 173
      end
    end
    inherited RLBand5: TRLBand
      Top = 226
      ExplicitTop = 226
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
        Left = 127
        Top = 0
        Width = 121
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
        Left = 254
        Top = 0
        Width = 108
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
        Left = 666
        Top = 0
        Width = 52
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
    object RLBand4: TRLBand
      Left = 38
      Top = 185
      Width = 718
      Height = 41
      object RLDBText1: TRLDBText
        Left = 3
        Top = 3
        Width = 110
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
      object RLDBText2: TRLDBText
        Left = 127
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
        Left = 254
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
  end
end
