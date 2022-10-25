inherited frmCadastroVenda: TfrmCadastroVenda
  Caption = 'Criar Vendas, Or'#231'amentos e Pr'#233'-Vendas'
  ClientHeight = 518
  ClientWidth = 1023
  WindowState = wsMaximized
  OnActivate = FormActivate
  ExplicitWidth = 1039
  ExplicitHeight = 557
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1023
    ExplicitWidth = 1023
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
    Width = 1023
    Height = 80
    Align = alTop
    Color = clGradientInactiveCaption
    Enabled = False
    ParentBackground = False
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
      Left = 848
      Top = 16
      Width = 76
      Height = 13
      Caption = 'TIPO DE VENDA'
    end
    object LabelOpVenda: TLabel
      Left = 681
      Top = 16
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
      TabOrder = 1
    end
    object DBEditCodCLiente: TDBEdit
      Left = 336
      Top = 35
      Width = 73
      Height = 21
      DataField = 'CLIENTE'
      DataSource = DataSourceCadastro
      TabOrder = 2
      OnExit = DBEditCodCLienteExit
    end
    object ButtonCliente: TButton
      Left = 415
      Top = 35
      Width = 34
      Height = 25
      TabOrder = 0
      OnClick = ButtonClienteClick
    end
    object DBComboBoxTipoVenda: TDBComboBox
      Left = 848
      Top = 35
      Width = 145
      Height = 21
      Style = csDropDownList
      DataField = 'TIPO_VENDA'
      DataSource = DataSourceCadastro
      Items.Strings = (
        'A VISTA'
        'PRAZO')
      TabOrder = 4
    end
    object DBComboBoxOpVenda: TDBComboBox
      Left = 681
      Top = 35
      Width = 145
      Height = 21
      Style = csDropDownList
      DataField = 'OPERACAO_VENDA'
      DataSource = DataSourceCadastro
      Items.Strings = (
        'Or'#231'amento'
        'Pr'#233'-Venda'
        'Venda')
      TabOrder = 3
      OnExit = DBComboBoxOpVendaExit
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
    Width = 1023
    Height = 72
    Align = alTop
    Color = 16776176
    Enabled = False
    ParentBackground = False
    TabOrder = 2
    object LabelProduto: TLabel
      Left = 96
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object LabelQtde: TLabel
      Left = 392
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object LabelValorUnit: TLabel
      Left = 490
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Valor Unit'#225'rio'
    end
    object LabelValorTotalVenda: TLabel
      Left = 600
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Total Produto'
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
    object Label1: TLabel
      Left = 704
      Top = 16
      Width = 84
      Height = 13
      Caption = 'Valor Total Venda'
      FocusControl = DBEditTotalVenda
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 927
      Top = 23
      Width = 215
      Height = 43
      Caption = 'Para Excluir um Item adicionado d'#234' um duplo clique sobre o mesmo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6248624
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      WordWrap = True
    end
    object ButtonProduto: TButton
      Left = 175
      Top = 32
      Width = 34
      Height = 25
      TabOrder = 7
      OnClick = ButtonProdutoClick
    end
    object ButtonAdicionar: TButton
      Left = 816
      Top = 16
      Width = 89
      Height = 41
      Caption = 'ADICIONAR'
      TabOrder = 6
      OnClick = ButtonAdicionarClick
    end
    object EditProduto: TEdit
      Left = 96
      Top = 35
      Width = 73
      Height = 21
      TabOrder = 0
      OnExit = EditProdutoExit
    end
    object EditQtd: TEdit
      Left = 392
      Top = 35
      Width = 74
      Height = 21
      TabOrder = 2
      OnExit = EditQtdExit
    end
    object EditValorUnit: TEdit
      Left = 490
      Top = 35
      Width = 87
      Height = 21
      TabOrder = 3
      OnExit = EditValorUnitExit
    end
    object EditValorTotal: TEdit
      Left = 600
      Top = 35
      Width = 81
      Height = 21
      TabOrder = 5
    end
    object EditLcto: TEdit
      Left = 16
      Top = 35
      Width = 57
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object DBEditTotalVenda: TDBEdit
      Left = 704
      Top = 35
      Width = 84
      Height = 21
      DataField = 'VALOR_VENDA'
      DataSource = DataSourceCadastro
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
  end
  object PanelItems: TPanel [3]
    Left = 0
    Top = 217
    Width = 1023
    Height = 301
    Align = alClient
    TabOrder = 3
    object DBGridItensVenda: TDBGrid
      Left = 1
      Top = 1
      Width = 1021
      Height = 299
      Align = alClient
      DataSource = DataSourceItemNota
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridItensVendaDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'LCTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRODUTO'
          Title.Caption = 'Cod Produto'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescProduto'
          Title.Caption = 'Descri'#231#227'o do Produto'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDE'
          Title.Caption = 'Quantidade'
          Width = 100
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
          Title.Caption = 'Total Produto'
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
  object FDQueryProduto: TFDQuery [8]
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from produtos;')
    Left = 56
    Top = 272
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
  object DataSourceItemNota: TDataSource [9]
    DataSet = FDQueryItemNota
    Left = 408
    Top = 304
  end
  object FDQueryItemNota: TFDQuery [10]
    AfterPost = FDQueryItemNotaAfterPost
    AfterCancel = FDQueryItemNotaAfterCancel
    AfterDelete = FDQueryItemNotaAfterDelete
    Connection = dmDados.FDConnection
    Transaction = FDTransactionItemNota
    SQL.Strings = (
      'select * from item_venda'
      'where nr_venda = :nr_venda'
      '')
    Left = 408
    Top = 368
    ParamData = <
      item
        Name = 'NR_VENDA'
        ParamType = ptInput
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
  object FDTransactionItemNota: TFDTransaction [11]
    Connection = dmDados.FDConnection
    Left = 408
    Top = 425
  end
  object FDQueryCliente: TFDQuery [12]
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from cliente')
    Left = 56
    Top = 329
  end
  object DataSource1: TDataSource [13]
    DataSet = FDQueryProduto
    Left = 504
    Top = 256
  end
  object FDQueryProduto1: TFDQuery [14]
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select * from produtos;')
    Left = 56
    Top = 385
  end
  object FDQueryItemVenda: TFDQuery [15]
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'SELECT max(lcto) FROM item_venda')
    Left = 56
    Top = 441
    object FDQueryItemVendaMAX: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MAX'
      Origin = '"MAX"'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDQuery1: TFDQuery
    Connection = dmDados.FDConnection
    Left = 280
    Top = 305
  end
end
