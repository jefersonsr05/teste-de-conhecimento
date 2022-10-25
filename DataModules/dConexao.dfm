object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 456
  Width = 736
  object Conexao: TFDConnection
    ConnectionName = 'dtmConexao'
    Params.Strings = (
      'DriverID=FB'
      'Database=C:\Users\Vinicius\Downloads\MC_TESTE.FDB'
      'Password=masterkey'
      'User_Name=sysdba'
      'Server=localhost')
    Connected = True
    Left = 16
    Top = 16
  end
end
