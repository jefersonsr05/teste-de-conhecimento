object frmConsultaProduto: TfrmConsultaProduto
  Left = 0
  Top = 0
  Caption = 'frmConsultaProduto'
  ClientHeight = 476
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPesquisa: TPanel
    Left = 0
    Top = 41
    Width = 783
    Height = 80
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -223
    ExplicitWidth = 1006
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
      Text = 'Descri'#231#227'o'
      OnChange = cbxFiltroChange
      Items.Strings = (
        'Descri'#231#227'o'
        'Codigo')
    end
    object edtPesquisar: TEdit
      Left = 181
      Top = 6
      Width = 145
      Height = 27
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = edtPesquisarChange
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 436
    Width = 783
    Height = 40
    Align = alBottom
    Color = clTeal
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = -223
    ExplicitTop = 424
    ExplicitWidth = 1006
    object btnAtualizar: TButton
      Left = 361
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Atualizar'
      TabOrder = 4
      OnClick = btnAtualizarClick
    end
    object btnIncluir: TButton
      Left = 1
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 91
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
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
      OnClick = btnExcluirClick
    end
    object btnRelat: TButton
      Left = 451
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Relat'#243'rio'
      TabOrder = 5
      OnClick = btnRelatClick
    end
    object btnVisualizar: TButton
      Left = 271
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Visualizar'
      TabOrder = 3
      OnClick = btnVisualizarClick
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 121
    Width = 783
    Height = 315
    Align = alClient
    Caption = 'pnlGrid'
    TabOrder = 2
    ExplicitLeft = -223
    ExplicitTop = 19
    ExplicitWidth = 1006
    ExplicitHeight = 445
    object grdConsulta: TDBGrid
      Left = 1
      Top = 1
      Width = 781
      Height = 313
      Align = alClient
      Color = clWhite
      DataSource = dtmConexao.dtsProdutos
      DefaultDrawing = False
      GradientEndColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Arial'
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
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Caption = 'Refer'#234'ncia'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUSTO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Custo'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Pre'#231'o'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALDO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Saldo'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PESO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Peso'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'UN'
          Visible = True
        end>
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 41
    Align = alTop
    Color = clTeal
    ParentBackground = False
    TabOrder = 3
    ExplicitLeft = -223
    ExplicitWidth = 1006
  end
end
