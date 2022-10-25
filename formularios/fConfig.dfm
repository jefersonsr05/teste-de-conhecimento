object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es'
  ClientHeight = 224
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 115
  TextHeight = 21
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 41
    Align = alTop
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 725
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 183
    Width = 652
    Height = 41
    Align = alBottom
    Color = clTeal
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 517
    ExplicitWidth = 725
    object btnSalvar: TButton
      Left = 1
      Top = 1
      Width = 100
      Height = 39
      Align = alLeft
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 101
      Top = 1
      Width = 100
      Height = 39
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 652
    Height = 142
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 725
    ExplicitHeight = 476
    object pgcConfig: TPageControl
      Left = 1
      Top = 1
      Width = 650
      Height = 140
      ActivePage = tbsGeral
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 723
      ExplicitHeight = 474
      object tbsGeral: TTabSheet
        Caption = 'Geral'
        ImageIndex = 2
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 642
          Height = 104
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 715
          ExplicitHeight = 438
          object Label1: TLabel
            Left = 3
            Top = 24
            Width = 290
            Height = 21
            Caption = 'Escolha a cor padr'#227'o das programa:'
          end
          object ColorBox: TColorBox
            Left = 299
            Top = 24
            Width = 145
            Height = 22
            DefaultColorColor = clTeal
            NoneColorColor = clTeal
            Selected = clTeal
            TabOrder = 0
          end
          object btnAplicar: TButton
            Left = 491
            Top = 24
            Width = 75
            Height = 40
            Caption = 'Aplicar'
            TabOrder = 1
            OnClick = btnAplicarClick
          end
        end
      end
    end
  end
end
