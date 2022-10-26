inherited frmVendas: TfrmVendas
  Caption = 'Vendas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = TabListagem
    inherited TabListagem: TTabSheet
      inherited grdListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'NRNOTA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMISSAO'
            Width = 96
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
            Width = 357
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_VENDA'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_VENDA'
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERACAO_VENDA'
            Width = 143
            Visible = True
          end>
      end
    end
    inherited TabSheet2: TTabSheet
      object lblTextoCliente: TLabel
        Left = 290
        Top = 16
        Width = 33
        Height = 13
        Caption = 'Cliente'
      end
      object lblTextoEmissao: TLabel
        Left = 124
        Top = 16
        Width = 38
        Height = 13
        Caption = 'Emiss'#227'o'
      end
      object edtNrnota: TLabeledEdit
        Tag = 9
        Left = 8
        Top = 32
        Width = 97
        Height = 21
        EditLabel.Width = 23
        EditLabel.Height = 13
        EditLabel.Caption = 'Nota'
        TabOrder = 0
      end
      object lkpCliente: TDBLookupComboBox
        Tag = 1
        Left = 290
        Top = 39
        Width = 463
        Height = 21
        KeyField = 'CODIGO'
        ListField = 'NOME'
        ListSource = dtmVenda.dtsClient
        TabOrder = 2
      end
      object edtEmissao: TDateEdit
        Tag = 1
        Left = 124
        Top = 32
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
      end
      object Panel1: TPanel
        Left = 0
        Top = 65
        Width = 1072
        Height = 563
        Align = alBottom
        TabOrder = 3
        object pnlCima: TPanel
          Left = 1
          Top = 1
          Width = 1070
          Height = 89
          Align = alTop
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object Label1: TLabel
            Left = 7
            Top = 32
            Width = 38
            Height = 13
            Caption = 'Produto'
          end
          object lblTextoQuantidade: TLabel
            Left = 392
            Top = 32
            Width = 56
            Height = 13
            Caption = 'Quantidade'
          end
          object lblTextoUnitário: TLabel
            Left = 527
            Top = 32
            Width = 64
            Height = 13
            Caption = 'Valor Unit'#225'rio'
          end
          object lblTextoTotal: TLabel
            Left = 662
            Top = 32
            Width = 51
            Height = 13
            Caption = 'Valor Total'
          end
          object lkpProdutos: TDBLookupComboBox
            Left = 7
            Top = 48
            Width = 370
            Height = 21
            KeyField = 'CODIGO'
            ListField = 'DESCRICAO'
            ListSource = dtmVenda.dtsProduto
            TabOrder = 2
            OnExit = lkpProdutosExit
          end
          object edtQuantidade: TCurrencyEdit
            Tag = 1
            Left = 392
            Top = 48
            Width = 121
            Height = 21
            DisplayFormat = '0.00;-0.00'
            TabOrder = 3
          end
          object edtUnitario: TCurrencyEdit
            Tag = 1
            Left = 527
            Top = 48
            Width = 121
            Height = 21
            TabOrder = 4
            OnExit = edtUnitarioExit
          end
          object edtTotal: TCurrencyEdit
            Tag = 1
            Left = 662
            Top = 48
            Width = 121
            Height = 21
            TabStop = False
            ParentColor = True
            ReadOnly = True
            TabOrder = 0
          end
          object btnAdicionar: TBitBtn
            Left = 804
            Top = 46
            Width = 75
            Height = 25
            Caption = 'Adicionar'
            ImageIndex = 0
            Images = ImageList1
            TabOrder = 5
            OnClick = btnAdicionarClick
          end
          object btnRemover: TBitBtn
            Left = 904
            Top = 47
            Width = 75
            Height = 25
            Caption = 'Remover'
            ImageIndex = 8
            Images = ImageList1
            TabOrder = 1
            TabStop = False
            OnClick = btnRemoverClick
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 90
          Width = 1070
          Height = 430
          Align = alClient
          TabOrder = 1
          object grdVenda: TDBGrid
            Left = 1
            Top = 1
            Width = 1068
            Height = 428
            TabStop = False
            Align = alClient
            DataSource = dtmVenda.dtsItensVenda
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = grdVendaCellClick
            OnDblClick = grdVendaDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'C'#243'digo'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descri'#231#227'o'
                Width = 499
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Quantidade'
                Width = 123
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Unit'#225'rio'
                Width = 103
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Total'
                Width = 85
                Visible = True
              end>
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 520
          Width = 1070
          Height = 42
          Align = alBottom
          TabOrder = 2
          object lblTextoVenda: TLabel
            Left = 804
            Top = 8
            Width = 61
            Height = 13
            Caption = 'Valor Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtValorVenda: TCurrencyEdit
            Tag = 1
            Left = 882
            Top = 6
            Width = 121
            Height = 21
            MaxLength = 10
            ParentColor = True
            ReadOnly = True
            TabOrder = 0
          end
          object rgpPagamento: TRadioGroup
            Left = 1
            Top = 3
            Width = 368
            Height = 33
            BiDiMode = bdLeftToRight
            Caption = 'Forma de Pagamento'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              #192' VISTA'
              #192' PRAZO')
            ParentBiDiMode = False
            TabOrder = 1
          end
        end
      end
      object rgpVenda: TRadioGroup
        Left = 782
        Top = 5
        Width = 101
        Height = 90
        Caption = 'Tipo de Venda'
        ItemIndex = 0
        Items.Strings = (
          'Venda'
          'Pr'#233'-Venda'
          'Or'#231'amento')
        TabOrder = 4
      end
    end
  end
  inherited pnlBaixo: TPanel
    inherited btnAlterar: TBitBtn
      Enabled = False
    end
    inherited btnNavegar: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'select v.nrnota, v.emissao, v.cliente,c.nome, v.tipo_venda, '
      'v.valor_venda, v.operacao_venda  '
      'from venda v'
      'inner join cliente c on c.codigo = v.cliente')
    Left = 948
    object qryListagemNRNOTA: TIntegerField
      DisplayLabel = 'Nota'
      FieldName = 'NRNOTA'
      Required = True
    end
    object qryListagemEMISSAO: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
    end
    object qryListagemCLIENTE: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'CLIENTE'
      Required = True
    end
    object qryListagemNOME: TWideStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME'
      Size = 35
    end
    object qryListagemTIPO_VENDA: TWideStringField
      DisplayLabel = 'Pagamento'
      FieldName = 'TIPO_VENDA'
      Size = 1
    end
    object qryListagemVALOR_VENDA: TExtendedField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_VENDA'
      DisplayFormat = ',R$ #0.00'
      Precision = 19
    end
    object qryListagemOPERACAO_VENDA: TWideStringField
      DisplayLabel = 'Opera'#231#227'o'
      FieldName = 'OPERACAO_VENDA'
      Size = 1
    end
  end
end
