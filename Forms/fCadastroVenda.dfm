inherited frmCadastroVenda: TfrmCadastroVenda
  Caption = 'Criar Vendas, Or'#231'amentos e Pr'#233'-Vendas'
  ClientHeight = 506
  ClientWidth = 1025
  WindowState = wsMaximized
  OnActivate = FormActivate
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
    object LabelNomeCliente: TLabel
      Left = 465
      Top = 40
      Width = 85
      Height = 13
      Caption = 'LabelNomeCliente'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
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
      Width = 73
      Height = 21
      DataField = 'CLIENTE'
      DataSource = DataSourceCadastro
      TabOrder = 1
      OnExit = DBEditCodCLienteExit
    end
    object ButtonCliente: TButton
      Left = 415
      Top = 35
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
    Height = 88
    Align = alTop
    TabOrder = 2
    object LabelProduto: TLabel
      Left = 96
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object LabelQtde: TLabel
      Left = 440
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object LabelValorUnit: TLabel
      Left = 538
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Valor Unit'#225'rio'
    end
    object LabelValorTotalVenda: TLabel
      Left = 656
      Top = 16
      Width = 99
      Height = 13
      Caption = 'Valor Total da Venda'
    end
    object LabelLcto: TLabel
      Left = 16
      Top = 16
      Width = 26
      Height = 13
      Caption = 'LCTO'
    end
    object LabelDescProd: TLabel
      Left = 225
      Top = 40
      Width = 70
      Height = 13
      Caption = 'LabelDescProd'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object ButtonProduto: TButton
      Left = 175
      Top = 32
      Width = 34
      Height = 25
      TabOrder = 0
      OnClick = ButtonProdutoClick
    end
    object ButtonAdicionar: TButton
      Left = 816
      Top = 16
      Width = 89
      Height = 41
      Caption = 'ADICIONAR'
      TabOrder = 1
      OnClick = ButtonAdicionarClick
    end
    object ButtonExcluir: TButton
      Left = 920
      Top = 16
      Width = 89
      Height = 41
      Caption = 'EXCLUIR'
      TabOrder = 2
    end
    object EditProduto: TEdit
      Left = 96
      Top = 35
      Width = 73
      Height = 21
      TabOrder = 3
      OnExit = EditProdutoExit
    end
    object EditQtd: TEdit
      Left = 440
      Top = 35
      Width = 74
      Height = 21
      TabOrder = 4
    end
    object EditValorUnit: TEdit
      Left = 538
      Top = 35
      Width = 95
      Height = 21
      TabOrder = 5
    end
    object EditValorTotal: TEdit
      Left = 656
      Top = 35
      Width = 113
      Height = 21
      TabOrder = 6
    end
    object EditLcto: TEdit
      Left = 16
      Top = 35
      Width = 57
      Height = 21
      TabOrder = 7
    end
  end
  object PanelItems: TPanel [3]
    Left = 0
    Top = 233
    Width = 1025
    Height = 273
    Align = alClient
    TabOrder = 3
    object DBGridItensVenda: TDBGrid
      Left = 1
      Top = 1
      Width = 1023
      Height = 271
      Align = alClient
      DataSource = DataSourceItemNota
      ReadOnly = True
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
          FieldName = 'NR_VENDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_UNIT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescProduto'
          Visible = True
        end>
    end
  end
  inherited DataSourceCadastro: TDataSource
    Left = 984
    Top = 304
  end
  inherited FDQueryCadastro: TFDQuery
    AfterOpen = FDQueryCadastroAfterOpen
    BeforePost = FDQueryCadastroBeforePost
    AfterScroll = FDQueryCadastroAfterScroll
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
    object FDQueryProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryProdutoDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 35
    end
    object FDQueryProdutoREFERENCIA: TWideStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 15
    end
    object FDQueryProdutoUNIDADE: TWideStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 4
    end
    object FDQueryProdutoDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Origin = 'DATA_VENDA'
    end
    object FDQueryProdutoPRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      Precision = 18
    end
    object FDQueryProdutoSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
    end
  end
  object DataSourceItemNota: TDataSource
    DataSet = FDQueryItemNota
    Left = 408
    Top = 304
  end
  object FDQueryItemNota: TFDQuery
    AfterPost = FDQueryItemNotaAfterPost
    AfterCancel = FDQueryItemNotaAfterCancel
    AfterDelete = FDQueryItemNotaAfterDelete
    Connection = dmDados.FDConnection
    Transaction = FDTransactionItemNota
    SQL.Strings = (
      'select * from item_venda'
      'where nr_venda = :nr_venda')
    Left = 408
    Top = 368
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
    object FDQueryItemNotaDescProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'DescProduto'
      LookupDataSet = FDQueryProduto
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PRODUTO'
      Size = 35
      Lookup = True
    end
  end
  object FDTransactionItemNota: TFDTransaction
    Connection = dmDados.FDConnection
    Left = 408
    Top = 425
  end
  object FDQueryCliente: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from cliente')
    Left = 96
    Top = 337
  end
end
