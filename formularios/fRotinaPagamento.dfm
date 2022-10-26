object frmRotinaPagamento: TfrmRotinaPagamento
  Left = 0
  Top = 0
  Caption = 'Rotina De Pagamento'
  ClientHeight = 268
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PixelsPerInch = 115
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 40
    Align = alTop
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 382
    object lblFormaDePagamento: TLabel
      Left = 8
      Top = 11
      Width = 156
      Height = 18
      Caption = 'Forma De Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 40
    Width = 420
    Height = 148
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 370
    ExplicitHeight = 170
    object lblDataVencimento: TLabel
      Left = 200
      Top = 78
      Width = 142
      Height = 18
      Caption = 'Data de Vencimento'
    end
    object rdgFPgto: TRadioGroup
      Left = 200
      Top = 6
      Width = 169
      Height = 67
      Caption = 'Forma de Pagamento'
      ItemIndex = 0
      Items.Strings = (
        'A Vista'
        'A Prazo')
      TabOrder = 0
      OnClick = rdgFPgtoClick
    end
    object rdgOperacao: TRadioGroup
      Left = 8
      Top = 6
      Width = 170
      Height = 123
      Caption = 'Opera'#231#227'o'
      ItemIndex = 0
      Items.Strings = (
        'Orcamento'
        'Pr'#233'-Venda'
        'Venda')
      TabOrder = 1
    end
    object dtpVencimento: TDateTimePicker
      Left = 200
      Top = 102
      Width = 121
      Height = 26
      Date = 44511.000000000000000000
      Time = 0.577430787037883400
      TabOrder = 2
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 228
    Width = 420
    Height = 40
    Align = alBottom
    Color = clTeal
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 251
    ExplicitWidth = 382
    object btnSalva: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 38
      Align = alLeft
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvaClick
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 188
    Width = 420
    Height = 40
    Align = alBottom
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 211
    ExplicitWidth = 382
    object lblNotaTotal: TLabel
      Left = 8
      Top = 10
      Width = 95
      Height = 18
      Caption = 'Total da Nota:'
    end
    object edtNotaTotal: TEdit
      Left = 110
      Top = 7
      Width = 110
      Height = 26
      ReadOnly = True
      TabOrder = 0
    end
  end
end
