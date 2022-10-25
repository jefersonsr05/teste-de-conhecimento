object frmConsultaVenda: TfrmConsultaVenda
  Left = 0
  Top = 0
  Caption = 'Consulta Vendas'
  ClientHeight = 663
  ClientWidth = 1027
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFiltros: TPanel
    Left = 0
    Top = 41
    Width = 1027
    Height = 72
    Align = alTop
    TabOrder = 0
    object cmbFiltro: TComboBox
      Left = 16
      Top = 6
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'cmbFiltro'
      Items.Strings = (
        'Data'
        'Numero Venda'
        'Cliente')
    end
    object dtpFiltroData: TDateTimePicker
      Left = 184
      Top = 29
      Width = 145
      Height = 21
      Date = 44858.000000000000000000
      Time = 0.528858067133114700
      TabOrder = 1
    end
    object chbFiltoData: TCheckBox
      Left = 184
      Top = 6
      Width = 97
      Height = 17
      Caption = 'Filtrar por data'
      TabOrder = 2
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 622
    Width = 1027
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnAlterar: TButton
      Left = 106
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 0
    end
    object btnAtualizar: TButton
      Left = 316
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Atualizar'
      TabOrder = 1
    end
    object btnExcluir: TButton
      Left = 211
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 2
    end
    object btnInserir: TButton
      Left = 1
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Inserir'
      TabOrder = 3
    end
    object btnSair: TButton
      Left = 526
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Sair'
      TabOrder = 4
      OnClick = btnSairClick
    end
    object btnRelatorio: TButton
      Left = 421
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Relat'#243'rio'
      TabOrder = 5
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 1027
    Height = 41
    Align = alTop
    Caption = 'Consulta Vendas'
    TabOrder = 2
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 113
    Width = 1027
    Height = 509
    Align = alClient
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 1025
      Height = 507
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
