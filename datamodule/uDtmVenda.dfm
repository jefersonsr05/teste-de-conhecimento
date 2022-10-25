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
      
        'select codigo,descricao,preco_venda,saldo from produtos where co' +
        'digo = codigo')
    Params = <>
    Left = 32
    Top = 96
    object qryProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qryProdutoDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryProdutoPRECO_VENDA: TExtendedField
      FieldName = 'PRECO_VENDA'
      Precision = 19
    end
    object qryProdutoSALDO: TExtendedField
      FieldName = 'SALDO'
      Precision = 19
    end
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 160
    object codigo: TIntegerField
      FieldName = 'C'#243'digo'
    end
    object descricao: TStringField
      FieldName = 'Descri'#231#227'o'
      Size = 35
    end
    object quantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object unitario: TFloatField
      FieldName = 'Unit'#225'rio'
    end
    object total: TFloatField
      FieldName = 'Total'
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
