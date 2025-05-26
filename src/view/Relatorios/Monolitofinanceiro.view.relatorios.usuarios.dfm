inherited relusuarios: Trelusuarios
  Caption = 'relusuarios'
  TextHeight = 15
  inherited RLReport1: TRLReport
    inherited RLBand2: TRLBand
      inherited RLLabel2: TRLLabel
        Left = 258
        Width = 202
        Caption = 'Rela'#231#227'o de Usu'#225'rios'
        ExplicitLeft = 258
        ExplicitWidth = 202
      end
    end
    inherited RLBand3: TRLBand
      Height = 30
      ExplicitHeight = 30
      object RLLabel3: TRLLabel
        Left = 0
        Top = 0
        Width = 60
        Height = 24
        Align = faLeftTop
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 329
        Top = 0
        Width = 57
        Height = 24
        Align = faTopOnly
        Caption = 'Login'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 652
        Top = 0
        Width = 66
        Height = 24
        Align = faRightTop
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    inherited RLBand4: TRLBand
      Top = 175
      Height = 20
      ExplicitTop = 175
      ExplicitHeight = 20
      object RLDBText2: TRLDBText
        Left = 337
        Top = 0
        Width = 57
        Height = 24
        Align = faTopOnly
        DataField = 'Login'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 0
        Top = 0
        Width = 60
        Height = 24
        Align = faLeftTop
        DataField = 'Nome'
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
        Left = 652
        Top = 0
        Width = 66
        Height = 24
        Align = faRightTop
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
      Top = 195
      Height = 22
      ExplicitTop = 195
      ExplicitHeight = 22
    end
  end
end
