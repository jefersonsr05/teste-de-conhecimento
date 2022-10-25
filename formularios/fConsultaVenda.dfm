object frmConsultaVenda: TfrmConsultaVenda
  Left = 0
  Top = 0
  Caption = 'frmConsultaVenda'
  ClientHeight = 570
  ClientWidth = 972
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object pnlPesquisa: TPanel
    Left = 0
    Top = 41
    Width = 972
    Height = 88
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -308
    ExplicitWidth = 1092
    object cbxFiltro: TComboBox
      Left = 14
      Top = 6
      Width = 145
      Height = 27
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = 'Id'
      Items.Strings = (
        'Id'
        'Cliente'
        'Vendedor'
        'F.Pagamento')
    end
    object edtPesquisar: TEdit
      Left = 14
      Top = 39
      Width = 145
      Height = 27
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
    end
    object pnlData: TPanel
      Left = 181
      Top = 6
      Width = 161
      Height = 75
      Color = clTeal
      ParentBackground = False
      TabOrder = 2
      Visible = False
      object lblFiltroData: TLabel
        Left = 39
        Top = 10
        Width = 102
        Height = 18
        Caption = 'Filtrar por data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object cbxFiltraData: TCheckBox
        Left = 16
        Top = 11
        Width = 129
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object dtpEmissao: TDateTimePicker
        Left = 16
        Top = 34
        Width = 129
        Height = 27
        Date = 44505.000000000000000000
        Time = 0.461487210646737300
        TabOrder = 0
      end
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 530
    Width = 972
    Height = 40
    Align = alBottom
    Color = clTeal
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = -308
    ExplicitTop = 342
    ExplicitWidth = 1092
    object btnAtualizar: TButton
      Left = 361
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Atualizar'
      TabOrder = 4
    end
    object btnIncluir: TButton
      Left = 1
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Incluir'
      TabOrder = 0
    end
    object btnAlterar: TButton
      Left = 91
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 1
    end
    object btnSair: TButton
      Left = 541
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Sair'
      TabOrder = 6
    end
    object btnExcluir: TButton
      Left = 181
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 2
    end
    object btnRelat: TButton
      Left = 451
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Relat'#243'rio'
      TabOrder = 5
    end
    object btnVisualizar: TButton
      Left = 271
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Visualizar'
      TabOrder = 3
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 129
    Width = 972
    Height = 401
    Align = alClient
    Caption = 'pnlGrid'
    TabOrder = 2
    ExplicitLeft = -308
    ExplicitTop = -208
    ExplicitWidth = 1092
    ExplicitHeight = 590
    object grdConsulta: TDBGrid
      Left = 1
      Top = 1
      Width = 970
      Height = 399
      Align = alClient
      DataSource = dtmConexao.dtsVenda
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'Id'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FK_CLIENTE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome Cliente'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FK_VENDEDOR'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOME_1'
          Title.Caption = 'Nome Vendedor'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FK_FORMAPAGAMENTO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Forma de Pagamento'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS'
          Width = 300
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'DESCONTO'
          Title.Caption = 'Desconto'
          Width = 100
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'TOTAL'
          Title.Caption = 'Total'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMISSAO'
          Title.Caption = 'Emiss'#227'o'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_VENCIMENTO'
          Title.Caption = 'Vencimento'
          Width = 130
          Visible = True
        end>
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 972
    Height = 41
    Align = alTop
    Color = clTeal
    ParentBackground = False
    TabOrder = 3
    ExplicitLeft = -308
    ExplicitWidth = 1092
  end
end
