inherited Frmcaixa: TFrmcaixa
  Caption = 'Caixa'
  ClientWidth = 771
  OnCreate = FormCreate
  ExplicitWidth = 787
  TextHeight = 21
  inherited PnlPrincipal: TCardPanel
    Width = 771
    inherited CardCadastro: TCard
      Width = 769
      object lblnumerodoc: TLabel [0]
        Left = 9
        Top = 72
        Width = 129
        Height = 25
        Caption = 'N'#176' Documento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lbldescricao: TLabel [1]
        Left = 45
        Top = 113
        Width = 82
        Height = 25
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblvalor: TLabel [2]
        Left = 62
        Top = 154
        Width = 44
        Height = 25
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      inherited Panel1: TPanel
        Width = 769
        inherited Btnfecharcadastro: TButton
          Left = 680
        end
        inherited btnSalvar: TButton
          Left = 591
        end
      end
      object edtnumerodoc: TEdit
        Left = 144
        Top = 72
        Width = 385
        Height = 29
        TabOrder = 1
      end
      object edtdescricao: TEdit
        Left = 144
        Top = 113
        Width = 385
        Height = 29
        TabOrder = 2
      end
      object edtvalor: TEdit
        Left = 144
        Top = 154
        Width = 385
        Height = 29
        TabOrder = 3
      end
      object RadioGroup1: TRadioGroup
        Left = 9
        Top = 208
        Width = 592
        Height = 113
        Caption = 'Tipo'
        Columns = 2
        Items.Strings = (
          'Receita'
          'Despesa')
        TabOrder = 4
      end
    end
    inherited Cardpesquisa: TCard
      Width = 769
      inherited pnlpesquisa: TPanel
        Width = 769
        object lblseletipo: TLabel [1]
          Left = 267
          Top = 9
          Width = 37
          Height = 21
          Caption = 'Tipos'
        end
        inherited btnpesquisar: TButton
          Left = 680
          ExplicitTop = 0
        end
        object cbtipos: TComboBox
          Left = 267
          Top = 36
          Width = 145
          Height = 29
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 2
          Text = 'Todos'
          Items.Strings = (
            'Todos'
            'Despesas'
            'Receitas')
        end
      end
      inherited pnlpesquisabotoes: TPanel
        Width = 769
        inherited Btnfechar: TButton
          Left = 680
        end
        inherited btnImprimir: TButton
          OnClick = btnImprimirClick
          ExplicitLeft = 273
        end
      end
      inherited PnlGrid: TPanel
        Width = 769
        inherited DBGrid1: TDBGrid
          Width = 769
          Color = clWhite
          Font.Color = clWindow
          Font.Style = [fsBold]
          ParentFont = False
          Columns = <
            item
              Expanded = False
              FieldName = 'numero_doc'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 300
              Visible = True
            end
            item
              Alignment = taLeftJustify
              Expanded = False
              FieldName = 'valor'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tipo'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'data_cadastro'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'id'
              Visible = False
            end>
        end
      end
    end
  end
  inherited ImageList1: TImageList
    Left = 737
    Top = 362
  end
  inherited DataSource1: TDataSource
    DataSet = dmCaixa.cdsCaixa
  end
end
