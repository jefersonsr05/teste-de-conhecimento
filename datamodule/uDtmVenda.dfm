object dtmVenda: TdtmVenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 407
  Width = 515
  object qryCliente: TZQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'select codigo,nome from cliente')
    Params = <>
    Left = 32
    Top = 32
    object qryClienteCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object qryClienteNOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 35
    end
  end
  object qryProduto: TZQuery
    Connection = dtmConexao.ConexaoDB
    SQL.Strings = (
      'select codigo,descricao,preco_venda,saldo from produtos')
    Params = <>
    Left = 32
    Top = 96
    object qryProdutoCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Required = True
    end
    object qryProdutoDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryProdutoPRECO_VENDA: TExtendedField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECO_VENDA'
      Precision = 19
    end
    object qryProdutoSALDO: TExtendedField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
      Precision = 19
    end
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 160
    object cdsItensVendaprodutoCod: TIntegerField
      FieldName = 'produtoCod'
    end
    object cdsItensVendaProdutoDescricao: TStringField
      FieldName = 'ProdutoDescricao'
      Size = 35
    end
    object cdsItensVendaquantidader: TFloatField
      FieldName = 'quantidader'
    end
    object cdsItensVendavalorUn: TFloatField
      FieldName = 'valorUn'
    end
    object cdsItensVendavalorTotalProduto: TFloatField
      FieldName = 'valorTotalProduto'
    end
    object cdsItensVendavalorTotalVenda: TAggregateField
      FieldName = 'valorTotalVenda'
      DisplayName = ''
      Expression = 'sum(valorTotalProduto)'
    end
  end
  object dtsClient: TDataSource
    DataSet = qryCliente
    Left = 120
    Top = 32
  end
  object dtsProduto: TDataSource
    DataSet = qryProduto
    Left = 120
    Top = 96
  end
  object dtsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 120
    Top = 160
  end
end
