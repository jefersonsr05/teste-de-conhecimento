inherited frmCadProdutos: TfrmCadProdutos
  Caption = 'Cadastro de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited TabSheet2: TTabSheet
      object lblTextoVenda: TLabel
        Left = 106
        Top = 133
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
        Left = 444
        Top = 97
        Width = 26
        Height = 13
        Caption = 'Saldo'
      end
      object Label1: TLabel
        Left = 444
        Top = 173
        Width = 62
        Height = 13
        Caption = #218'ltima Venda'
      end
      object edtCodigo: TLabeledEdit
        Tag = 9
        Left = 8
        Top = 24
        Width = 75
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 5
        NumbersOnly = True
        TabOrder = 0
      end
      object edtDescricao: TLabeledEdit
        Tag = 1
        Left = 106
        Top = 24
        Width = 413
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 35
        TabOrder = 1
      end
      object edtReferencia: TLabeledEdit
        Left = 106
        Top = 64
        Width = 327
        Height = 21
        EditLabel.Width = 52
        EditLabel.Height = 13
        EditLabel.Caption = 'Refer'#234'ncia'
        MaxLength = 15
        TabOrder = 2
      end
      object edtUnidade: TLabeledEdit
        Tag = 1
        Left = 464
        Top = 64
        Width = 55
        Height = 21
        EditLabel.Width = 39
        EditLabel.Height = 13
        EditLabel.Caption = 'Unidade'
        MaxLength = 4
        TabOrder = 3
      end
      object edtPrecoVenda: TCurrencyEdit
        Tag = 1
        Left = 106
        Top = 152
        Width = 121
        Height = 21
        MaxLength = 10
        TabOrder = 4
      end
      object edtSaldo: TCurrencyEdit
        Left = 444
        Top = 112
        Width = 75
        Height = 21
        DisplayFormat = '0.00;-0.00'
        MaxLength = 5
        TabOrder = 5
      end
      object edtDataVenda: TDatePicker
        Left = 444
        Top = 192
        Date = 44856.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        TabOrder = 6
      end
    end
  end
  inherited pnlBaixo: TPanel
    inherited btnNavegar: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    Active = True
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
