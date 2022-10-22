inherited frmCadastroVenda: TfrmCadastroVenda
  Caption = 'Criar Vendas, Or'#231'amentos e Pr'#233'-Vendas'
  ClientHeight = 506
  ClientWidth = 1025
  ExplicitWidth = 1041
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1025
    inherited BitBtnSair: TBitBtn
      Left = 904
      ExplicitLeft = 904
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
      FocusControl = DBEdit2
    end
    object LabelCliente: TLabel
      Left = 336
      Top = 16
      Width = 41
      Height = 13
      Caption = 'CLIENTE'
      FocusControl = DBEdit3
    end
    object LabelTipoVenda: TLabel
      Left = 640
      Top = 16
      Width = 76
      Height = 13
      Caption = 'TIPO DE VENDA'
      FocusControl = DBEdit4
    end
    object LabelOpVenda: TLabel
      Left = 752
      Top = 16
      Width = 108
      Height = 13
      Caption = 'OPERA'#199#195'O DE VENDA'
      FocusControl = DBEdit6
    end
    object DBEditNrNota: TDBEdit
      Left = 16
      Top = 32
      Width = 134
      Height = 21
      DataField = 'NRNOTA'
      DataSource = DataSourceCadastro
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 176
      Top = 32
      Width = 134
      Height = 21
      DataField = 'EMISSAO'
      DataSource = DataSourceCadastro
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 336
      Top = 32
      Width = 281
      Height = 21
      DataField = 'CLIENTE'
      DataSource = DataSourceCadastro
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 640
      Top = 32
      Width = 17
      Height = 21
      DataField = 'TIPO_VENDA'
      DataSource = DataSourceCadastro
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 752
      Top = 32
      Width = 17
      Height = 21
      DataField = 'OPERACAO_VENDA'
      DataSource = DataSourceCadastro
      TabOrder = 4
    end
  end
  object PanelProdutos: TPanel [2]
    Left = 0
    Top = 145
    Width = 1025
    Height = 72
    Align = alTop
    TabOrder = 2
  end
  object DBGridProdutos: TDBGrid [3]
    Left = 0
    Top = 217
    Width = 1025
    Height = 289
    Align = alClient
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  inherited DataSourceCadastro: TDataSource
    Left = 984
    Top = 304
  end
  inherited FDQueryCadastro: TFDQuery
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
end
