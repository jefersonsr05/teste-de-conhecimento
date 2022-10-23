object frmAtualizarDB: TfrmAtualizarDB
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmAtualizarDB'
  ClientHeight = 338
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 651
    Height = 338
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 635
    ExplicitHeight = 322
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 617
      Height = 49
      Caption = 'Atualizar BD'
    end
    object chkConexao: TCheckBox
      Left = 120
      Top = 63
      Width = 97
      Height = 17
      Caption = 'Conexao'
      TabOrder = 0
    end
    object chkProdutos: TCheckBox
      Left = 120
      Top = 109
      Width = 97
      Height = 17
      Caption = 'Produtos'
      TabOrder = 1
    end
    object chkClientes: TCheckBox
      Left = 120
      Top = 132
      Width = 97
      Height = 17
      Caption = 'Clientes'
      TabOrder = 2
    end
    object chkItens: TCheckBox
      Left = 120
      Top = 155
      Width = 97
      Height = 17
      Caption = 'Itens de Venda'
      TabOrder = 3
    end
    object chkVendas: TCheckBox
      Left = 120
      Top = 86
      Width = 97
      Height = 17
      Caption = 'Vendas'
      TabOrder = 4
    end
  end
end
