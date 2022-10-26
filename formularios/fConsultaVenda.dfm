object frmConsultaVenda: TfrmConsultaVenda
  Left = 0
  Top = 0
  Caption = 'frmConsultaVenda'
  ClientHeight = 570
  ClientWidth = 1062
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object pnlPesquisa: TPanel
    Left = 0
    Top = 41
    Width = 1062
    Height = 88
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 972
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
      Text = 'N'#176' Nota'
      OnChange = cbxFiltroChange
      Items.Strings = (
        'N'#176' Nota'
        'N'#176' Cliente'
        'Cliente Nome')
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
      OnChange = edtPesquisarChange
    end
    object pnlData: TPanel
      Left = 181
      Top = 5
      Width = 161
      Height = 75
      Color = clTeal
      ParentBackground = False
      TabOrder = 2
      Visible = False
      object lblFiltroData: TLabel
        Left = 39
        Top = 5
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
        Top = 6
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
    Width = 1062
    Height = 40
    Align = alBottom
    Color = clTeal
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 972
    object btnAtualizar: TButton
      Left = 271
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Atualizar'
      TabOrder = 3
      OnClick = btnAtualizarClick
      ExplicitLeft = 361
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
      Visible = False
      OnClick = btnAlterarClick
    end
    object btnSair: TButton
      Left = 451
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Sair'
      TabOrder = 5
      ExplicitLeft = 541
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
      Left = 361
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Relat'#243'rio'
      TabOrder = 4
      ExplicitLeft = 451
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 129
    Width = 1062
    Height = 401
    Align = alClient
    Caption = 'pnlGrid'
    TabOrder = 2
    ExplicitWidth = 972
    object grdConsulta: TDBGrid
      Left = 1
      Top = 1
      Width = 1060
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
          FieldName = 'NRNOTA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMISSAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OPERACAO_VENDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_VENDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_VENDA'
          Visible = True
        end>
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1062
    Height = 41
    Align = alTop
    Color = clTeal
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 972
  end
end
