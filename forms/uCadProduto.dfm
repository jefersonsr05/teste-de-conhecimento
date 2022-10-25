inherited frmCadProdutos: TfrmCadProdutos
  Caption = 'Cadastro de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = TabSheet2
    inherited TabSheet2: TTabSheet
      object pnlMeio: TPanel
        Left = 0
        Top = 169
        Width = 1072
        Height = 459
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 1001
        ExplicitHeight = 483
        object lblUltimaVenda: TLabel
          Left = 170
          Top = 88
          Width = 62
          Height = 13
          Caption = #218'ltima Venda'
        end
        object lblTextoVenda: TLabel
          Left = 170
          Top = 21
          Width = 87
          Height = 13
          Caption = 'Pre'#231'o de venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblTextoSaldo: TLabel
          Left = 528
          Top = 21
          Width = 26
          Height = 13
          Caption = 'Saldo'
        end
        object edtSaldo: TCurrencyEdit
          Left = 528
          Top = 37
          Width = 75
          Height = 21
          DisplayFormat = '0.00;-0.00'
          MaxLength = 5
          TabOrder = 0
        end
        object edtDataVenda: TDatePicker
          Left = 170
          Top = 104
          Width = 121
          Height = 25
          Date = 44856.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          TabOrder = 1
          TabStop = False
        end
        object edtPrecoVenda: TCurrencyEdit
          Tag = 1
          Left = 170
          Top = 37
          Width = 121
          Height = 21
          MaxLength = 10
          TabOrder = 2
        end
      end
      object pnlCima: TPanel
        Left = 0
        Top = 0
        Width = 1072
        Height = 169
        Align = alTop
        TabOrder = 0
        object pnlCimaCima: TPanel
          Left = 1
          Top = 1
          Width = 1070
          Height = 48
          Align = alTop
          TabOrder = 0
          OnClick = pnlCimaCimaClick
          object lblGrandeDescricao: TLabel
            Left = 223
            Top = 8
            Width = 92
            Height = 23
            Caption = 'Descricao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblGrandeCodigo: TLabel
            Left = 168
            Top = 8
            Width = 37
            Height = 23
            Caption = 'Cod'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object edtCodigo: TLabeledEdit
          Tag = 9
          Left = 52
          Top = 75
          Width = 75
          Height = 21
          TabStop = False
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo'
          MaxLength = 5
          NumbersOnly = True
          TabOrder = 1
        end
        object edtDescricao: TLabeledEdit
          Tag = 1
          Left = 169
          Top = 79
          Width = 413
          Height = 21
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o'
          MaxLength = 35
          TabOrder = 2
        end
        object edtReferencia: TLabeledEdit
          Left = 169
          Top = 127
          Width = 327
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = 'Refer'#234'ncia'
          MaxLength = 15
          TabOrder = 3
        end
        object edtUnidade: TLabeledEdit
          Tag = 1
          Left = 527
          Top = 127
          Width = 55
          Height = 21
          EditLabel.Width = 39
          EditLabel.Height = 13
          EditLabel.Caption = 'Unidade'
          MaxLength = 4
          TabOrder = 4
        end
      end
    end
  end
  inherited pnlBaixo: TPanel
    inherited btnNavegar: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'select * from produtos')
    object qryListagemCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CODIGO'
      Required = True
    end
    object qryListagemDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 51
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryListagemREFERENCIA: TWideStringField
      DisplayLabel = 'Refer'#234'ncia'
      DisplayWidth = 22
      FieldName = 'REFERENCIA'
      Size = 15
    end
    object qryListagemUNIDADE: TWideStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 8
      FieldName = 'UNIDADE'
      Size = 4
    end
    object qryListagemPRECO_VENDA: TExtendedField
      DisplayLabel = 'Pre'#231'o de venda'
      DisplayWidth = 19
      FieldName = 'PRECO_VENDA'
      Precision = 19
    end
    object qryListagemSALDO: TExtendedField
      DisplayLabel = 'Saldo'
      DisplayWidth = 17
      FieldName = 'SALDO'
      Precision = 19
    end
  end
end
