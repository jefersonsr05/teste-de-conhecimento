object frmCadastroPai: TfrmCadastroPai
  Left = 0
  Top = 0
  Caption = 'fCadastroPai'
  ClientHeight = 359
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 65
    Align = alTop
    TabOrder = 0
    object BitBtnNovo: TBitBtn
      Left = 8
      Top = 8
      Width = 113
      Height = 49
      Caption = 'NOVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtnNovoClick
    end
    object BitBtnSalvar: TBitBtn
      Left = 136
      Top = 8
      Width = 113
      Height = 49
      Caption = 'SALVAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtnSalvarClick
    end
    object BitBtnSair: TBitBtn
      Left = 640
      Top = 8
      Width = 113
      Height = 49
      Caption = 'SAIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtnSairClick
    end
    object BitBtnExcluir: TBitBtn
      Left = 392
      Top = 8
      Width = 113
      Height = 49
      Caption = 'EXCLUIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtnExcluirClick
    end
    object BitBtnCancelar: TBitBtn
      Left = 264
      Top = 8
      Width = 113
      Height = 49
      Caption = 'CANCELAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtnCancelarClick
    end
  end
  object DataSourceCadastro: TDataSource
    DataSet = FDQueryCadastro
    Left = 664
    Top = 160
  end
  object FDQueryCadastro: TFDQuery
    Connection = dmDados.FDConnection
    Left = 664
    Top = 96
  end
  object FDUpdateSQLCadastro: TFDUpdateSQL
    Connection = dmDados.FDConnection
    Left = 664
    Top = 232
  end
  object FDTransactionCadastro: TFDTransaction
    Connection = dmDados.FDConnection
    Left = 664
    Top = 296
  end
end
