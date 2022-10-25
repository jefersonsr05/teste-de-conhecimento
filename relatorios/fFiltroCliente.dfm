object frmFiltroCliente: TfrmFiltroCliente
  Left = 0
  Top = 0
  Caption = 'Filtragem do Relat'#243'rio'
  ClientHeight = 285
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 115
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 375
    Height = 205
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 398
    ExplicitHeight = 227
    object chkListaTodos: TCheckBox
      Left = 8
      Top = 157
      Width = 161
      Height = 17
      Caption = 'Listar todos Clientes'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = chkListaTodosClick
    end
    object rdgOrdem: TRadioGroup
      Left = 8
      Top = 7
      Width = 161
      Height = 129
      Caption = 'Ordenar por:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'CEP')
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object edtBusca: TEdit
      Left = 187
      Top = 153
      Width = 153
      Height = 26
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
    end
    object rdgBusca: TRadioGroup
      Left = 187
      Top = 7
      Width = 153
      Height = 129
      Caption = 'Buscar por:'
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'E-Mail')
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 245
    Width = 375
    Height = 40
    Align = alBottom
    Color = clTeal
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 267
    ExplicitWidth = 398
    object btnVisualizar: TButton
      Left = 1
      Top = 1
      Width = 96
      Height = 38
      Align = alLeft
      Caption = 'Visualizar'
      TabOrder = 0
      OnClick = btnVisualizarClick
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 40
    Align = alTop
    Color = clTeal
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 398
  end
end
