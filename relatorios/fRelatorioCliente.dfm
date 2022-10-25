object frmRelatorioCliente: TfrmRelatorioCliente
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio'
  ClientHeight = 333
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 115
  TextHeight = 18
  object rlpRelatorio: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    object rlbRegistros: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 112
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object txtNome: TRLDBText
        Left = 82
        Top = 41
        Width = 51
        Height = 18
        DataField = 'NOME'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object txtEmail: TRLDBText
        Left = 446
        Top = 41
        Width = 51
        Height = 18
        DataField = 'EMAIL'
        DataSource = DataSource1
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 16
        Top = 41
        Width = 50
        Height = 18
        Caption = 'Nome:'
      end
      object txtCidade: TRLDBText
        Left = 82
        Top = 89
        Width = 65
        Height = 18
        DataField = 'CIDADE'
        DataSource = DataSource1
        Text = ''
      end
      object txtCEP: TRLDBText
        Left = 82
        Top = 65
        Width = 38
        Height = 18
        DataField = 'CEP'
        DataSource = DataSource1
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 384
        Top = 41
        Width = 53
        Height = 18
        Caption = 'E-Mail:'
      end
      object RLLabel4: TRLLabel
        Left = 16
        Top = 65
        Width = 42
        Height = 18
        Caption = 'CEP:'
      end
      object RLLabel5: TRLLabel
        Left = 16
        Top = 89
        Width = 60
        Height = 18
        Caption = 'Cidade:'
      end
      object lblCelular: TRLLabel
        Left = 384
        Top = 65
        Width = 57
        Height = 18
        Caption = 'Celular:'
      end
      object RLDBText1: TRLDBText
        Left = 446
        Top = 65
        Width = 78
        Height = 18
        DataField = 'CELULAR'
        DataSource = DataSource1
        Text = ''
      end
      object lblCod: TRLLabel
        Left = 5
        Top = 2
        Width = 60
        Height = 18
        Caption = 'Codigo:'
      end
      object txtCod: TRLDBText
        Left = 71
        Top = 2
        Width = 67
        Height = 18
        DataField = 'CODIGO'
        DataSource = DataSource1
        Text = ''
      end
    end
    object rlbCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btColumnHeader
      object rllCabecalhoTxt: TRLLabel
        Left = 272
        Top = 16
        Width = 143
        Height = 18
        Caption = 'Relatorio - CLientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object qryRelatorio: TFDQuery
    Connection = dtmConexao.FDConnection
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    Left = 120
    Top = 248
    object qryRelatorioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRelatorioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 35
    end
    object qryRelatorioENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 35
    end
    object qryRelatorioBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
    end
    object qryRelatorioCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object qryRelatorioCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object qryRelatorioUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object qryRelatorioFONE: TStringField
      FieldName = 'FONE'
      Origin = 'FONE'
      Size = 15
    end
    object qryRelatorioCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
    object qryRelatorioEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = qryRelatorio
    Left = 48
    Top = 248
  end
end
