inherited Frmusuarios: TFrmusuarios
  Caption = 'Cadastro de usuarios'
  TextHeight = 21
  inherited PnlPrincipal: TCardPanel
    inherited CardCadastro: TCard
      object lblnome: TLabel [0]
        Left = 48
        Top = 51
        Width = 46
        Height = 21
        Caption = 'Nome:'
      end
      object lbllogin: TLabel [1]
        Left = 48
        Top = 99
        Width = 39
        Height = 21
        Caption = 'Login'
      end
      object lblstatus: TLabel [2]
        Left = 48
        Top = 182
        Width = 42
        Height = 21
        Caption = 'Status'
      end
      object edtnome: TEdit
        Left = 128
        Top = 48
        Width = 377
        Height = 29
        TabOrder = 1
      end
      object edtlogin: TEdit
        Left = 128
        Top = 96
        Width = 377
        Height = 29
        TabOrder = 2
      end
      object ToggleSwitch1: TToggleSwitch
        Left = 128
        Top = 182
        Width = 130
        Height = 23
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 3
      end
    end
    inherited Cardpesquisa: TCard
      inherited pnlpesquisa: TPanel
        inherited Edtpesquisa: TEdit
          Top = 42
          ExplicitTop = 42
        end
        inherited btnpesquisar: TButton
          ExplicitTop = 0
        end
      end
      inherited pnlpesquisabotoes: TPanel
        inherited btnImprimir: TButton
          OnClick = btnImprimirClick
        end
      end
      inherited PnlGrid: TPanel
        inherited DBGrid1: TDBGrid
          PopupMenu = mnuviewusuario
          Columns = <
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Width = 287
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'login'
              Title.Caption = 'Login'
              Width = 289
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = 'Status'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Administrador'
              Width = 112
              Visible = True
            end>
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 665
    Top = 418
  end
  inherited DataSource1: TDataSource
    AutoEdit = False
    DataSet = dmusuario.cdsusuarios
  end
  object mnuviewusuario: TPopupMenu
    Left = 561
    Top = 210
    object mnulimparpassword: TMenuItem
      Caption = 'Limpar senha'
      OnClick = mnulimparpasswordClick
    end
  end
end
