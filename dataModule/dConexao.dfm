object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 455
  Width = 268
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Marketing\Documents\alexandre\teste-de-conheci' +
        'mento\BANCO\MC_TESTE.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 30
    Top = 11
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 
      'C:\Users\Marketing\Documents\alexandre\teste-de-conhecimento\fbc' +
      'lient.dll'
    Left = 139
    Top = 10
  end
  object qryConsultaClientes: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT      '
      'CODIGO      '
      ', NOME      '
      ', ENDERECO  '
      ', BAIRRO    '
      ', CIDADE    '
      ', CEP       '
      ', UF        '
      ', FONE      '
      ', CELULAR   '
      ', EMAIL     '
      'FROM CLIENTE')
    Left = 136
    Top = 66
    object qryConsultaClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConsultaClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 35
    end
    object qryConsultaClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 35
    end
    object qryConsultaClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
    end
    object qryConsultaClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object qryConsultaClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object qryConsultaClientesUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object qryConsultaClientesFONE: TStringField
      FieldName = 'FONE'
      Origin = 'FONE'
      Size = 15
    end
    object qryConsultaClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
    object qryConsultaClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
  end
  object dtsClientes: TDataSource
    DataSet = qryConsultaClientes
    Left = 33
    Top = 67
  end
  object dtsProdutos: TDataSource
    DataSet = qryConsultaProdutos
    Left = 32
    Top = 128
  end
  object qryConsultaProdutos: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select'
      '  P.ID'
      ', P.FK_UNIDADE'
      ', P.DESCRICAO'
      ', P.REFERENCIA'
      ', P.PRECO'
      ', P.CUSTO'
      ', P.SALDO'
      ', P.PESO'
      ', P.FOTO'
      ', U.unidade'
      'from PRODUTO  P'
      'INNER JOIN UNIDADE U'
      'ON P.fk_unidade = U.id')
    Left = 136
    Top = 125
    object qryConsultaProdutosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConsultaProdutosFK_UNIDADE: TIntegerField
      FieldName = 'FK_UNIDADE'
      Origin = 'FK_UNIDADE'
      Required = True
    end
    object qryConsultaProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 35
    end
    object qryConsultaProdutosREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 15
    end
    object qryConsultaProdutosPRECO: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = '#,#0.00'
      Precision = 18
    end
    object qryConsultaProdutosCUSTO: TBCDField
      FieldName = 'CUSTO'
      Origin = 'CUSTO'
      DisplayFormat = '#,#0.00'
      Precision = 18
    end
    object qryConsultaProdutosSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      DisplayFormat = '#,#0.00'
      Precision = 18
    end
    object qryConsultaProdutosPESO: TBCDField
      FieldName = 'PESO'
      Origin = 'PESO'
      DisplayFormat = '#,#0.00'
      Precision = 18
    end
    object qryConsultaProdutosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryConsultaProdutosUNIDADE: TStringField
      Alignment = taCenter
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 3
    end
  end
  object qryConsultaFPagamento: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM FORMAPAGAMENTO')
    Left = 152
    Top = 198
    object qryConsultaFPagamentoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryConsultaFPagamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 25
    end
    object qryConsultaFPagamentoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dtsFPagamento: TDataSource
    DataSet = qryConsultaFPagamento
    Left = 32
    Top = 200
  end
  object qryVenda: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '  V.ID'
      ', V.FK_CLIENTE'
      ', C.NOME'
      ''
      ', V.FK_VENDEDOR'
      ', VN.NOME'
      ''
      ', V.FK_FORMAPAGAMENTO'
      ', FP.DESCRICAO'
      ''
      ', V.OBS'
      ', V.DESCONTO'
      ', V.TOTAL'
      ', V.EMISSAO'
      ', V.DATA_VENCIMENTO'
      ''
      'from VENDA V'
      ' inner join CLIENTE C'
      ' on V.FK_CLIENTE = C.ID'
      ''
      'inner join VENDEDOR VN'
      ' on V.FK_VENDEDOR = VN.ID'
      ' '
      'inner join FORMAPAGAMENTO FP'
      ' on V.FK_FORMAPAGAMENTO = FP.ID')
    Left = 144
    Top = 288
    object qryVendaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVendaFK_CLIENTE: TIntegerField
      FieldName = 'FK_CLIENTE'
      Origin = 'FK_CLIENTE'
    end
    object qryVendaNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
    object qryVendaFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
    end
    object qryVendaNOME_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_1'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
    object qryVendaFK_FORMAPAGAMENTO: TIntegerField
      FieldName = 'FK_FORMAPAGAMENTO'
      Origin = 'FK_FORMAPAGAMENTO'
    end
    object qryVendaDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
    object qryVendaOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 256
    end
    object qryVendaDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
    end
    object qryVendaTOTAL: TBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
    end
    object qryVendaEMISSAO: TSQLTimeStampField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object qryVendaDATA_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'DATA_VENCIMENTO'
    end
  end
  object dtsItens: TDataSource
    DataSet = tblConsultaItens
    Left = 32
    Top = 368
  end
  object tblConsultaItens: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'FK_VENDA'
        DataType = ftInteger
      end
      item
        Name = 'FK_PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'EMISSAO'
        DataType = ftDate
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'TOTAL'
        DataType = ftFloat
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 136
    Top = 368
    object tblConsultaItensFK_VENDA: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'FK_VENDA'
    end
    object tblConsultaItensFK_PRODUTO: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'FK_PRODUTO'
    end
    object tblConsultaItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object tblConsultaItensEMISSAO: TDateField
      FieldName = 'EMISSAO'
    end
    object tblConsultaItensQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#,#0.00'
    end
    object tblConsultaItensVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,#0.00'
    end
    object tblConsultaItensDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      DisplayFormat = '#,#0.00'
    end
    object tblConsultaItensTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '#,#0.00'
    end
  end
  object dtsVenda: TDataSource
    DataSet = qryVenda
    Left = 32
    Top = 288
  end
end
