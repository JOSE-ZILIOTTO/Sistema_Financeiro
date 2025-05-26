object Frmprincipal: TFrmprincipal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Monolitofianceiro'
  ClientHeight = 407
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  Padding.Left = 3
  Menu = MainMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 25
  object StatusBar1: TStatusBar
    Left = 3
    Top = 368
    Width = 564
    Height = 39
    Panels = <
      item
        Width = 150
      end
      item
        Width = 300
      end>
  end
  object pnlPrincipal: TPanel
    Left = 3
    Top = 0
    Width = 564
    Height = 368
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 6
  end
  object MainMenu1: TMainMenu
    Left = 416
    Top = 240
    object mnucadastro: TMenuItem
      Caption = 'Cadastro'
      object usuarios: TMenuItem
        Caption = 'Cadastro usuarios'
        OnClick = usuariosClick
      end
    end
    object mnufinanceiro: TMenuItem
      Caption = 'Financeiro'
      object mnucaixa: TMenuItem
        Caption = 'Caixa'
        OnClick = mnucaixaClick
      end
      object mnuContaspagar: TMenuItem
        Caption = 'Contas a Pagar'
        OnClick = mnuContaspagarClick
      end
      object ContasReceber: TMenuItem
        Caption = 'Contas a Receber'
        OnClick = ContasReceberClick
      end
      object mnucontareceberconsulta: TMenuItem
        Caption = 'Consultar Contas a receber'
        OnClick = mnucontareceberconsultaClick
      end
      object mnuConsultarcontaspagar: TMenuItem
        Caption = 'Consultar Contas a Pagar'
        OnClick = mnuConsultarcontaspagarClick
      end
    end
    object mnurelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      object mnuresumocaixa: TMenuItem
        Caption = 'Resumo do Caixa'
        OnClick = mnuresumocaixaClick
      end
      object mnuextratocaixa: TMenuItem
        Caption = 'Extrato do Caixa'
        OnClick = mnuextratocaixaClick
      end
    end
    object mnuajuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 504
    Top = 312
  end
end
