object frmInicial: TfrmInicial
  Left = 0
  Top = 0
  Caption = 'Menu Inicial'
  ClientHeight = 768
  ClientWidth = 1056
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menuInicial
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object menuInicial: TMainMenu
    Left = 1016
    object CLIENTE1: TMenuItem
      Caption = 'CADASTROS'
      object opClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = opClientesClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object opProdutos: TMenuItem
        Caption = 'Produtos'
        OnClick = opProdutosClick
      end
    end
    object VENDAS1: TMenuItem
      Caption = 'VENDAS'
      object opVendas: TMenuItem
        Caption = 'Venda'
        OnClick = opVendasClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
    end
    object RELATRIOS1: TMenuItem
      Caption = 'RELAT'#211'RIOS'
      object Produtos1: TMenuItem
        Caption = 'Produtos'
      end
      object Clientes1: TMenuItem
        Caption = '-'
      end
      object Clientes2: TMenuItem
        Caption = 'Clientes'
      end
    end
    object opSair: TMenuItem
      Caption = 'SAIR'
      OnClick = opSairClick
    end
  end
end
