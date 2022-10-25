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
    Params = <>
    Left = 408
    Top = 16
  end
  object qryClientes: TZQuery
    Connection = ConexaoDB
    Params = <>
    Left = 480
    Top = 16
  end
  object qryItensVendas: TZQuery
    Connection = ConexaoDB
    Params = <>
    Left = 552
    Top = 16
  end
end
