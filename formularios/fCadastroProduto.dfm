object frmCadastroProduto: TfrmCadastroProduto
  Left = 0
  Top = 0
  Caption = 'frmCadastroProduto'
  ClientHeight = 365
  ClientWidth = 686
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 686
    Height = 41
    Align = alTop
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 831
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 41
    Width = 686
    Height = 284
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = 36
    ExplicitHeight = 321
    object lblID: TLabel
      Left = 16
      Top = 8
      Width = 19
      Height = 18
      Caption = 'ID:'
    end
    object lblReferencia: TLabel
      Left = 16
      Top = 128
      Width = 80
      Height = 18
      Caption = 'Refer'#234'ncia:'
    end
    object lblDescricao: TLabel
      Left = 16
      Top = 67
      Width = 76
      Height = 18
      Caption = 'Descri'#231#227'o:'
    end
    object lblPreco: TLabel
      Left = 464
      Top = 67
      Width = 46
      Height = 18
      Caption = 'Pre'#231'o:'
    end
    object lblDataVenda: TLabel
      Left = 143
      Top = 191
      Width = 87
      Height = 18
      Caption = 'Data Venda:'
    end
    object lblSaldo: TLabel
      Left = 464
      Top = 128
      Width = 45
      Height = 18
      Caption = 'Saldo:'
    end
    object lblkUnidade: TLabel
      Left = 16
      Top = 191
      Width = 63
      Height = 18
      Caption = 'Unidade:'
    end
    object edtID: TEdit
      Left = 16
      Top = 32
      Width = 60
      Height = 26
      TabStop = False
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtDescricao: TEdit
      Left = 16
      Top = 91
      Width = 385
      Height = 26
      CharCase = ecUpperCase
      MaxLength = 35
      TabOrder = 1
    end
    object edtReferencia: TEdit
      Left = 16
      Top = 152
      Width = 385
      Height = 26
      CharCase = ecUpperCase
      MaxLength = 15
      TabOrder = 2
    end
    object edtPreco: TEdit
      Left = 464
      Top = 91
      Width = 150
      Height = 26
      TabOrder = 3
      OnKeyPress = edtPrecoKeyPress
    end
    object edtSaldo: TEdit
      Left = 464
      Top = 152
      Width = 150
      Height = 26
      TabOrder = 4
      OnKeyPress = edtSaldoKeyPress
    end
    object edtUnidade: TEdit
      Left = 16
      Top = 215
      Width = 97
      Height = 26
      MaxLength = 4
      TabOrder = 5
    end
    object dtpDataVenda: TDateTimePicker
      Left = 143
      Top = 215
      Width = 130
      Height = 26
      Date = 44859.000000000000000000
      Time = 0.662989305557857800
      TabOrder = 6
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 325
    Width = 686
    Height = 40
    Align = alBottom
    Color = clTeal
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 548
    ExplicitWidth = 831
    object btnSair: TButton
      Left = 91
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSairClick
      ExplicitLeft = 140
      ExplicitTop = 6
    end
    object btnSalvar: TButton
      Left = 1
      Top = 1
      Width = 90
      Height = 38
      Align = alLeft
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnSalvarClick
      ExplicitLeft = 23
    end
  end
end
