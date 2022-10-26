object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 521
  Width = 617
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    SQLHourGlass = True
    HostName = 'localhost'
    Port = 3050
    Database = ''
    User = 'SYSDBA'
    Password = 'masterkey'
    Protocol = 'firebirdd-2.5'
    Left = 256
    Top = 176
  end
  object qryScriptVendas: TZQuery
    Connection = ConexaoDB
    Params = <>
    Left = 328
    Top = 16
  end
  object qryProdutos: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'select * from produtos')
    Params = <>
    Left = 408
    Top = 16
    object qryProdutosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qryProdutosDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryProdutosREFERENCIA: TWideStringField
      FieldName = 'REFERENCIA'
      Size = 15
    end
    object qryProdutosUNIDADE: TWideStringField
      FieldName = 'UNIDADE'
      Size = 4
    end
    object qryProdutosDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
    end
    object qryProdutosPRECO_VENDA: TExtendedField
      FieldName = 'PRECO_VENDA'
      Precision = 19
    end
    object qryProdutosSALDO: TExtendedField
      FieldName = 'SALDO'
      Precision = 19
    end
  end
  object qryClientes: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'select codigo,nome,endereco,cidade, fone, celular from cliente')
    Params = <>
    Left = 480
    Top = 16
    object qryClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qryClientesNOME: TWideStringField
      FieldName = 'NOME'
      Size = 35
    end
    object qryClientesENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      Size = 35
    end
    object qryClientesCIDADE: TWideStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object qryClientesFONE: TWideStringField
      FieldName = 'FONE'
      Size = 15
    end
    object qryClientesCELULAR: TWideStringField
      FieldName = 'CELULAR'
      Size = 15
    end
  end
  object qryItensVendas: TZQuery
    Connection = ConexaoDB
    Params = <>
    Left = 552
    Top = 16
  end
end
