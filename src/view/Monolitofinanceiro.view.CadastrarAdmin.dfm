object frmcadastraradministrador: Tfrmcadastraradministrador
  Left = 0
  Top = 0
  Caption = 'Cadastrar Administrador'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 153
    Width = 624
    Height = 288
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Right = 10
    ParentFont = False
    TabOrder = 0
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 614
      Height = 288
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 50
      Padding.Right = 50
      TabOrder = 0
      object lblsenha: TLabel
        Left = 50
        Top = 0
        Width = 514
        Height = 21
        Align = alTop
        Caption = 'Senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 43
      end
      object lblconfirmar: TLabel
        Left = 50
        Top = 50
        Width = 514
        Height = 21
        Align = alTop
        Caption = 'Confirme sua senha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 138
      end
      object edtsenha: TEdit
        Left = 50
        Top = 21
        Width = 514
        Height = 29
        Align = alTop
        TabOrder = 1
      end
      object edtconfirm: TEdit
        Left = 50
        Top = 71
        Width = 514
        Height = 29
        Align = alTop
        BevelOuter = bvRaised
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 50
        Top = 161
        Width = 514
        Height = 56
        BevelOuter = bvNone
        TabOrder = 2
        object btnConfirmar: TButton
          Left = 344
          Top = 0
          Width = 170
          Height = 56
          Align = alRight
          Caption = 'Confirmar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnConfirmarClick
        end
        object btnCancelar: TButton
          Left = 0
          Top = 0
          Width = 170
          Height = 56
          Align = alLeft
          Caption = 'Cancelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnCancelarClick
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 153
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbltitulo: TLabel
      Left = 0
      Top = 45
      Width = 624
      Height = 32
      Align = alTop
      Alignment = taCenter
      Caption = '      Informe a sua nova senha'
      Color = clDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 309
    end
    object lbltituloprincipau: TLabel
      Left = 0
      Top = 0
      Width = 624
      Height = 45
      Align = alTop
      Alignment = taCenter
      Caption = '    Administrador'
      Color = clDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -33
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 260
    end
  end
end
