inherited frmFiltroProduto: TfrmFiltroProduto
  Caption = 'frmFiltroProduto'
  ClientHeight = 249
  ClientWidth = 502
  OnShow = FormShow
  ExplicitWidth = 518
  ExplicitHeight = 288
  PixelsPerInch = 115
  TextHeight = 18
  inherited pnlTitulo: TPanel
    Width = 502
    ExplicitWidth = 502
  end
  inherited Panel2: TPanel
    Width = 502
    Height = 169
    ExplicitWidth = 502
    ExplicitHeight = 169
    inherited cbxListaTodos: TCheckBox
      Left = 178
      Top = 8
      Width = 169
      Caption = 'Lista todos Produtos'
      OnClick = cbxListaTodosClick
      ExplicitLeft = 178
      ExplicitTop = 8
      ExplicitWidth = 169
    end
    object rdgFiltro: TRadioGroup
      Left = 16
      Top = 6
      Width = 137
      Height = 105
      Caption = 'Ordenar por:'
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'Data')
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 178
      Top = 31
      Width = 305
      Height = 130
      Color = clTeal
      ParentBackground = False
      TabOrder = 2
      object lblMenValor: TLabel
        Left = 166
        Top = 13
        Width = 88
        Height = 18
        Caption = 'Menor Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblMaiValor: TLabel
        Left = 166
        Top = 69
        Width = 84
        Height = 18
        Caption = 'Maior Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object rdgBusca: TRadioGroup
        Left = 21
        Top = 13
        Width = 124
        Height = 105
        Caption = 'Buscar por:'
        Color = clBtnFace
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          'Pre'#231'o'
          'Saldo')
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
      end
      object edtMenValor: TEdit
        Left = 166
        Top = 35
        Width = 123
        Height = 26
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 1
      end
      object edtMaiValor: TEdit
        Left = 166
        Top = 93
        Width = 123
        Height = 26
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 2
      end
    end
  end
  inherited pnlBotoes: TPanel
    Top = 209
    Width = 502
    ExplicitTop = 209
    ExplicitWidth = 502
    inherited btnVisualizar: TButton
      OnClick = btnVisualizarClick
    end
    inherited btnLimpar: TButton
      Left = 401
      Visible = False
      ExplicitLeft = 401
    end
  end
end
