object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 365
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
    VendorLib = 'fbclient.dll'
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
      'SELECT       '
      'CODIGO       '
      ', DESCRICAO  '
      ', REFERENCIA '
      ', UNIDADE    '
      ', DATA_VENDA '
      ', PRECO_VENDA'
      ', SALDO      '
      'FROM PRODUTOS ')
    Left = 136
    Top = 125
    object qryConsultaProdutosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    object qryConsultaProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 4
    end
    object qryConsultaProdutosDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Origin = 'DATA_VENDA'
    end
    object qryConsultaProdutosPRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      Precision = 18
    end
    object qryConsultaProdutosSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
    end
  end
  object qryVenda: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT                   '
      'V.NRNOTA                 '
      ', V.EMISSAO              '
      ', V.CLIENTE              '
      ', C.NOME                 '
      ', V.OPERACAO_VENDA       '
      ', V.TIPO_VENDA           '
      ', V.VALOR_VENDA          '
      'FROM VENDA V             '
      'LEFT JOIN CLIENTE C      '
      'ON (C.CODIGO = V.CLIENTE) ')
    Left = 136
    Top = 192
    object qryVendaNRNOTA: TIntegerField
      FieldName = 'NRNOTA'
      Origin = 'NRNOTA'
      Required = True
    end
    object qryVendaEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object qryVendaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Required = True
    end
    object qryVendaNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
    object qryVendaOPERACAO_VENDA: TStringField
      FieldName = 'OPERACAO_VENDA'
      Origin = 'OPERACAO_VENDA'
      FixedChar = True
      Size = 1
    end
    object qryVendaTIPO_VENDA: TStringField
      FieldName = 'TIPO_VENDA'
      Origin = 'TIPO_VENDA'
      FixedChar = True
      Size = 1
    end
    object qryVendaVALOR_VENDA: TBCDField
      FieldName = 'VALOR_VENDA'
      Origin = 'VALOR_VENDA'
      Precision = 18
    end
  end
  object dtsItens: TDataSource
    DataSet = tblConsultaItens
    Left = 32
    Top = 280
  end
  object tblConsultaItens: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'LCTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NR_VENDA'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'PROD_NOME'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'QTDE'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'VALOR_UNIT'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'VALOR_TOTAL'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 136
    Top = 272
    Content = {
      414442530F00383358030000FF00010001FF02FF03040020000000740062006C
      0043006F006E00730075006C00740061004900740065006E00730005000A0000
      005400610062006C006500060000000000070000080032000000090000FF0AFF
      0B0400080000004C00430054004F000500080000004C00430054004F000C0001
      0000000E000D000F00011000011100011200011300080000004C00430054004F
      00FEFF0B0400100000004E0052005F00560045004E0044004100050010000000
      4E0052005F00560045004E00440041000C00020000000E000D000F0001140001
      1000011500011100011200011300100000004E0052005F00560045004E004400
      4100FEFF0B04000E000000500052004F004400550054004F0005000E00000050
      0052004F004400550054004F000C00030000000E000D000F0001140001100001
      15000111000112000113000E000000500052004F004400550054004F00FEFF0B
      040012000000500052004F0044005F004E004F004D0045000500120000005000
      52004F0044005F004E004F004D0045000C00040000000E001600170023000000
      0F0001140001100001150001110001120001130012000000500052004F004400
      5F004E004F004D004500180023000000FEFF0B04000800000051005400440045
      0005000800000051005400440045000C00050000000E0019001A00120000001B
      00040000000F0001140001100001150001110001120001130008000000510054
      00440045001C00120000001D0004000000FEFF0B040014000000560041004C00
      4F0052005F0055004E0049005400050014000000560041004C004F0052005F00
      55004E00490054000C00060000000E0019001A00120000001B00040000000F00
      01140001100001150001110001120001130014000000560041004C004F005200
      5F0055004E00490054001C00120000001D0004000000FEFF0B04001600000056
      0041004C004F0052005F0054004F00540041004C00050016000000560041004C
      004F0052005F0054004F00540041004C000C00070000000E0019001A00120000
      001B00040000000F000114000110000115000111000112000113001600000056
      0041004C004F0052005F0054004F00540041004C001C00120000001D00040000
      00FEFEFF1EFEFF1FFEFF20FEFEFEFF21FEFF22FF23FEFEFE0E004D0061006E00
      61006700650072001E0055007000640061007400650073005200650067006900
      730074007200790012005400610062006C0065004C006900730074000A005400
      610062006C00650008004E0061006D006500140053006F007500720063006500
      4E0061006D0065000A0054006100620049004400240045006E0066006F007200
      6300650043006F006E00730074007200610069006E00740073001E004D006900
      6E0069006D0075006D0043006100700061006300690074007900180043006800
      650063006B004E006F0074004E0075006C006C00140043006F006C0075006D00
      6E004C006900730074000C0043006F006C0075006D006E00100053006F007500
      720063006500490044000E006400740049006E00740033003200100044006100
      7400610054007900700065001400530065006100720063006800610062006C00
      65000800420061007300650012004F0049006E00550070006400610074006500
      10004F0049006E00570068006500720065001A004F0072006900670069006E00
      43006F006C004E0061006D006500120041006C006C006F0077004E0075006C00
      6C0014004F0041006C006C006F0077004E0075006C006C001800640074004100
      6E007300690053007400720069006E0067000800530069007A00650014005300
      6F007500720063006500530069007A0065000A00640074004200430044001200
      50007200650063006900730069006F006E000A005300630061006C0065001E00
      53006F00750072006300650050007200650063006900730069006F006E001600
      53006F0075007200630065005300630061006C0065001C0043006F006E007300
      74007200610069006E0074004C00690073007400100056006900650077004C00
      6900730074000E0052006F0077004C006900730074001800520065006C006100
      740069006F006E004C006900730074001C005500700064006100740065007300
      4A006F00750072006E0061006C000E004300680061006E00670065007300}
    object tblConsultaItensLCTO: TIntegerField
      FieldName = 'LCTO'
      Required = True
    end
    object tblConsultaItensNR_VENDA: TIntegerField
      FieldName = 'NR_VENDA'
    end
    object tblConsultaItensPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object tblConsultaItensPROD_NOME: TStringField
      FieldName = 'PROD_NOME'
      Size = 35
    end
    object tblConsultaItensQTDE: TBCDField
      FieldName = 'QTDE'
      Precision = 18
    end
    object tblConsultaItensVALOR_UNIT: TBCDField
      FieldName = 'VALOR_UNIT'
      Precision = 18
    end
    object tblConsultaItensVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
    end
  end
  object dtsVenda: TDataSource
    DataSet = qryVenda
    Left = 32
    Top = 200
  end
end
