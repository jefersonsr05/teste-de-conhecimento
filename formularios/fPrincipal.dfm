object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu de Cadastro'
  ClientHeight = 743
  ClientWidth = 1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = mnuPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1074
    Height = 40
    Align = alTop
    Caption = 'MENU PRINCIPAL'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 40
    Width = 1074
    Height = 663
    Align = alClient
    TabOrder = 1
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 703
    Width = 1074
    Height = 40
    Align = alBottom
    Color = clTeal
    ParentBackground = False
    TabOrder = 2
  end
  object mnuPrincipal: TMainMenu
    Left = 29
    Top = 61
    object Connsulta1: TMenuItem
      Caption = 'Consulta'
      object mnuCliente: TMenuItem
        Caption = 'Cliente'
        OnClick = mnuClienteClick
      end
      object mnuProduto: TMenuItem
        Caption = 'Produto'
        OnClick = mnuProdutoClick
      end
      object mnuFPagamento: TMenuItem
        Caption = 'Forma de Pagamento'
        OnClick = mnuFPagamentoClick
      end
      object mnuVendas: TMenuItem
        Caption = 'Vendas'
        OnClick = mnuVendasClick
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object mnuClienteRelat: TMenuItem
        Caption = 'Cliente'
        OnClick = mnuClienteRelatClick
      end
      object mnuProdutoRelat: TMenuItem
        Caption = 'Produto'
        OnClick = mnuProdutoRelatClick
      end
      object mnuFPagamentoRelat: TMenuItem
        Caption = 'Forma de Pagamento'
        OnClick = mnuFPagamentoRelatClick
      end
      object mnuVendaRelat: TMenuItem
        Caption = 'Vendas'
        OnClick = mnuVendaRelatClick
      end
    end
  end
end
