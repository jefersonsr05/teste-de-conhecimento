inherited frmCadastroVenda: TfrmCadastroVenda
  Caption = 'Criar Vendas, Or'#231'amentos e Pr'#233'-Vendas'
  ClientHeight = 506
  ClientWidth = 1025
  WindowState = wsMaximized
  ExplicitWidth = 1041
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1025
    ExplicitWidth = 1025
    inherited BitBtnSair: TBitBtn
      Left = 911
      ExplicitLeft = 911
    end
    inherited BitBtnExcluir: TBitBtn
      Enabled = False
    end
  end
  object PanelCabecalhoVenda: TPanel [1]
    Left = 0
    Top = 65
    Width = 1025
    Height = 80
    Align = alTop
    TabOrder = 1
    object LabelNrNota: TLabel
      Left = 16
      Top = 16
      Width = 74
      Height = 13
      Caption = 'N'#218'MERO NOTA'
      FocusControl = DBEditNrNota
    end
    object LabelEmissao: TLabel
      Left = 176
      Top = 16
      Width = 45
      Height = 13
      Caption = 'EMISS'#195'O'
    end
    object LabelCliente: TLabel
      Left = 336
      Top = 16
      Width = 103
      Height = 13
      Caption = 'C'#211'DIGO DO CLIENTE'
      FocusControl = DBEditCodCLiente
    end
    object LabelTipoVenda: TLabel
      Left = 640
      Top = 16
      Width = 76
      Height = 13
      Caption = 'TIPO DE VENDA'
    end
    object LabelOpVenda: TLabel
      Left = 816
      Top = 14
      Width = 108
      Height = 13
      Caption = 'OPERA'#199#195'O DE VENDA'
    end
    object DBEditNrNota: TDBEdit
      Left = 16
      Top = 35
      Width = 134
      Height = 21
      DataField = 'NRNOTA'
      DataSource = DataSourceCadastro
      Enabled = False
      TabOrder = 0
    end
    object DBEditCodCLiente: TDBEdit
      Left = 336
      Top = 35
      Width = 233
      Height = 21
      DataField = 'CLIENTE'
      DataSource = DataSourceCadastro
      TabOrder = 1
    end
    object ButtonCliente: TButton
      Left = 575
      Top = 32
      Width = 34
      Height = 25
      TabOrder = 2
      OnClick = ButtonClienteClick
    end
    object DBComboBoxTipoVenda: TDBComboBox
      Left = 640
      Top = 35
      Width = 145
      Height = 21
      DataField = 'TIPO_VENDA'
      DataSource = DataSourceCadastro
      Items.Strings = (
        'A VISTA'
        'PRAZO')
      TabOrder = 3
    end
    object DBComboBoxOpVenda: TDBComboBox
      Left = 816
      Top = 33
      Width = 145
      Height = 21
      DataField = 'OPERACAO_VENDA'
      DataSource = DataSourceCadastro
      Items.Strings = (
        'Or'#231'amento'
        'Pr'#233'-Venda'
        'Venda')
      TabOrder = 4
    end
    object DBEditEmissao: TDBEdit
      Left = 176
      Top = 35
      Width = 134
      Height = 21
      DataField = 'EMISSAO'
      DataSource = DataSourceCadastro
      Enabled = False
      TabOrder = 5
    end
  end
  object PanelProdutos: TPanel [2]
    Left = 0
    Top = 145
    Width = 1025
    Height = 80
    Align = alTop
    TabOrder = 2
    object LabelProduto: TLabel
      Left = 96
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Produto'
      FocusControl = DBEditProduto
    end
    object LabelQtde: TLabel
      Left = 440
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Quantidade'
      FocusControl = DBEditQtde
    end
    object LabelValorUnit: TLabel
      Left = 538
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Valor Unit'#225'rio'
      FocusControl = DBEditValorUnit
    end
    object LabelValorTotalVenda: TLabel
      Left = 656
      Top = 16
      Width = 99
      Height = 13
      Caption = 'Valor Total da Venda'
      FocusControl = DBEditValorTotalVenda
    end
    object LabelLcto: TLabel
      Left = 16
      Top = 16
      Width = 26
      Height = 13
      Caption = 'LCTO'
      FocusControl = DBEditLcto
    end
    object DBEditProduto: TDBEdit
      Left = 96
      Top = 35
      Width = 262
      Height = 21
      DataField = 'PRODUTO'
      DataSource = DataSourceItemNota
      TabOrder = 0
    end
    object DBEditQtde: TDBEdit
      Left = 440
      Top = 35
      Width = 65
      Height = 21
      DataField = 'QTDE'
      DataSource = DataSourceItemNota
      TabOrder = 1
    end
    object DBEditValorUnit: TDBEdit
      Left = 536
      Top = 35
      Width = 89
      Height = 21
      DataField = 'VALOR_UNIT'
      DataSource = DataSourceItemNota
      TabOrder = 2
    end
    object DBEditValorTotalVenda: TDBEdit
      Left = 656
      Top = 35
      Width = 137
      Height = 21
      DataField = 'VALOR_TOTAL'
      DataSource = DataSourceItemNota
      TabOrder = 3
    end
    object ButtonProduto: TButton
      Left = 375
      Top = 32
      Width = 34
      Height = 25
      TabOrder = 4
      OnClick = ButtonProdutoClick
    end
    object DBEditLcto: TDBEdit
      Left = 16
      Top = 35
      Width = 57
      Height = 21
      DataField = 'LCTO'
      DataSource = DataSourceItemNota
      Enabled = False
      TabOrder = 5
    end
    object ButtonAdicionar: TButton
      Left = 816
      Top = 16
      Width = 89
      Height = 41
      Caption = 'ADICIONAR'
      TabOrder = 6
    end
    object ButtonExcluir: TButton
      Left = 920
      Top = 16
      Width = 89
      Height = 41
      Caption = 'EXCLUIR'
      TabOrder = 7
    end
  end
  object PanelItems: TPanel [3]
    Left = 0
    Top = 225
    Width = 1025
    Height = 281
    Align = alClient
    TabOrder = 3
    ExplicitLeft = 448
    ExplicitTop = 264
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGridItensVenda: TDBGrid
      Left = 1
      Top = 1
      Width = 1023
      Height = 279
      Align = alClient
      DataSource = DataSourceItemNota
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'LCTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Title.Caption = 'Cod'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescricaoProduto'
          Title.Caption = 'Produto'
          Width = 350
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDE'
          Title.Caption = 'Quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_UNIT'
          Title.Caption = 'Valor Unit'#225'rio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Title.Caption = 'Valor Total'
          Visible = True
        end>
    end
  end
  inherited DataSourceCadastro: TDataSource
    Left = 984
    Top = 304
  end
  inherited FDQueryCadastro: TFDQuery
    BeforePost = FDQueryCadastroBeforePost
    SQL.Strings = (
      'select * from venda;')
    Left = 984
    Top = 240
    object FDQueryCadastroNRNOTA: TIntegerField
      FieldName = 'NRNOTA'
      Origin = 'NRNOTA'
      Required = True
    end
    object FDQueryCadastroEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object FDQueryCadastroCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Required = True
    end
    object FDQueryCadastroTIPO_VENDA: TWideStringField
      FieldName = 'TIPO_VENDA'
      Origin = 'TIPO_VENDA'
      FixedChar = True
      Size = 1
    end
    object FDQueryCadastroVALOR_VENDA: TBCDField
      FieldName = 'VALOR_VENDA'
      Origin = 'VALOR_VENDA'
      Precision = 18
    end
    object FDQueryCadastroOPERACAO_VENDA: TWideStringField
      FieldName = 'OPERACAO_VENDA'
      Origin = 'OPERACAO_VENDA'
      FixedChar = True
      Size = 1
    end
  end
  inherited FDUpdateSQLCadastro: TFDUpdateSQL
    Left = 984
    Top = 376
  end
  inherited FDTransactionCadastro: TFDTransaction
    Left = 984
    Top = 440
  end
  object FDQueryProduto: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from produtos;')
    Left = 840
    Top = 240
  end
  object DataSourceItemNota: TDataSource
    DataSet = FDQueryItemNota
    Left = 408
    Top = 304
  end
  object FDQueryItemNota: TFDQuery
    AfterInsert = FDQueryItemNotaAfterInsert
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from item_venda'
      'where nr_venda = :nr_venda')
    Left = 408
    Top = 376
    ParamData = <
      item
        Name = 'NR_VENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryItemNotaLCTO: TIntegerField
      FieldName = 'LCTO'
      Origin = 'LCTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryItemNotaNR_VENDA: TIntegerField
      FieldName = 'NR_VENDA'
      Origin = 'NR_VENDA'
    end
    object FDQueryItemNotaPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
    end
    object FDQueryItemNotaQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Precision = 18
    end
    object FDQueryItemNotaVALOR_UNIT: TBCDField
      FieldName = 'VALOR_UNIT'
      Origin = 'VALOR_UNIT'
      Precision = 18
    end
    object FDQueryItemNotaVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
    end
    object FDQueryItemNotaDescricaoProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'DescricaoProduto'
      LookupDataSet = FDQueryProduto
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO'
      Size = 35
      Lookup = True
    end
  end
end
