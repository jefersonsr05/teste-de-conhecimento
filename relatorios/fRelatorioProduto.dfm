inherited frmRelatorioProduto: TfrmRelatorioProduto
  Caption = 'frmRelatorioProduto'
  ClientWidth = 793
  ExplicitWidth = 809
  PixelsPerInch = 115
  TextHeight = 16
  inherited rlpRelatorio: TRLReport
    Left = -3
    ExplicitLeft = -3
    inherited rlbCabecalho: TRLBand
      inherited rllCabecalhoTxt: TRLLabel
        Left = 224
        Width = 135
        Caption = 'Relatorio - Produto'
        ExplicitLeft = 224
        ExplicitWidth = 135
      end
    end
    inherited rlbRegistros: TRLBand
      object RLDBText1: TRLDBText
        Left = 152
        Top = 27
        Width = 99
        Height = 18
        DataField = 'DESCRICAO'
        DataSource = DataSource1
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 40
        Top = 27
        Width = 80
        Height = 18
        Caption = 'Descri'#231#227'o:'
      end
      object RLLabel2: TRLLabel
        Left = 40
        Top = 51
        Width = 84
        Height = 18
        Caption = 'Refer'#234'ncia:'
      end
      object lblUnidade: TRLLabel
        Left = 40
        Top = 88
        Width = 67
        Height = 18
        Caption = 'Unidade:'
      end
      object RLDBText2: TRLDBText
        Left = 152
        Top = 51
        Width = 106
        Height = 18
        DataField = 'REFERENCIA'
        DataSource = DataSource1
        Text = ''
      end
      object txtUnidade: TRLDBText
        Left = 113
        Top = 88
        Width = 75
        Height = 18
        DataField = 'UNIDADE'
        DataSource = DataSource1
        Text = ''
      end
      object txtPreco: TRLDBText
        Left = 280
        Top = 88
        Width = 126
        Height = 18
        Alignment = taRightJustify
        DataField = 'PRECO_VENDA'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 511
        Top = 88
        Width = 59
        Height = 18
        Alignment = taRightJustify
        DataField = 'SALDO'
        DataSource = DataSource1
        Text = ''
      end
      object txtData: TRLDBText
        Left = 600
        Top = 3
        Width = 112
        Height = 18
        Alignment = taRightJustify
        DataField = 'DATA_VENDA'
        DataSource = DataSource1
        Text = ''
      end
      object txtCodigo: TRLDBText
        Left = 88
        Top = 3
        Width = 67
        Height = 18
        DataField = 'CODIGO'
        DataSource = DataSource1
        Text = ''
      end
      object lblPreco: TRLLabel
        Left = 224
        Top = 88
        Width = 50
        Height = 18
        Caption = 'Pre'#231'o:'
      end
      object RLLabel5: TRLLabel
        Left = 440
        Top = 88
        Width = 49
        Height = 18
        Caption = 'Saldo:'
      end
      object lblData: TRLLabel
        Left = 538
        Top = 3
        Width = 42
        Height = 18
        Caption = 'Data:'
      end
      object lblCodigo: TRLLabel
        Left = 5
        Top = 3
        Width = 60
        Height = 18
        Caption = 'Codigo:'
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = qryRelatorio
    Top = 472
  end
  inherited qryRelatorio: TFDQuery
    Connection = dtmConexao.FDConnection
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
    Left = 45
    Top = 520
    object qryRelatorioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRelatorioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 35
    end
    object qryRelatorioREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 15
    end
    object qryRelatorioUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 4
    end
    object qryRelatorioDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
      Origin = 'DATA_VENDA'
    end
    object qryRelatorioPRECO_VENDA: TBCDField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      Precision = 18
    end
    object qryRelatorioSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
    end
  end
end
