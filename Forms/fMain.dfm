object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Sistema de Vendas'
  ClientHeight = 416
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object PanelAcessoRapido: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 137
    Align = alTop
    TabOrder = 0
  end
  object MainMenu: TMainMenu
    Left = 696
    Top = 248
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
    end
    object Pesquisar1: TMenuItem
      Caption = 'Pesquisar'
      object Clientes2: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes2Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Podutos1: TMenuItem
        Caption = 'Podutos'
        OnClick = Podutos1Click
      end
    end
    object Vendas1: TMenuItem
      Caption = 'Vendas'
      object CriarNovaVenda1: TMenuItem
        Caption = 'Nova Venda'
        OnClick = CriarNovaVenda1Click
      end
      object ConsultarVendas1: TMenuItem
        Caption = 'Consultar Vendas'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Vendas2: TMenuItem
        Caption = 'Vendas'
      end
      object Clientes3: TMenuItem
        Caption = 'Clientes'
      end
      object Clientes4: TMenuItem
        Caption = 'Produtos'
      end
    end
  end
end
