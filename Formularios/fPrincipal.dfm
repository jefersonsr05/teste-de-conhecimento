object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 341
  ClientWidth = 990
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mnuPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 990
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 300
    Width = 990
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 990
    Height = 259
    Align = alClient
    TabOrder = 2
  end
  object mnuPrincipal: TMainMenu
    Left = 208
    Top = 57
    object mnuProduto: TMenuItem
      Caption = 'Produto'
      object mnuProdutoCadastrar: TMenuItem
        Caption = 'Cadastrar'
        OnClick = mnuProdutoCadastrarClick
      end
      object mnuProdutoConsultar: TMenuItem
        Caption = 'Consultar'
        OnClick = mnuProdutoConsultarClick
      end
    end
    object Cadastrar1: TMenuItem
      Caption = 'Cliente'
      object mnuClienteCadastrar: TMenuItem
        Caption = 'Cadastrar'
        OnClick = mnuClienteCadastrarClick
      end
      object mnuClienteConsultar: TMenuItem
        Caption = 'Consultar'
        OnClick = mnuClienteConsultarClick
      end
    end
    object mnuVendaCadastrar: TMenuItem
      Caption = 'Venda'
      object Cadastrar2: TMenuItem
        Caption = 'Cadastrar'
        OnClick = Cadastrar2Click
      end
      object mnuVendaConsultar: TMenuItem
        Caption = 'Consultar'
        OnClick = mnuVendaConsultarClick
      end
    end
    object Relatorios1: TMenuItem
      Caption = 'Relatorios'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
    end
    object Sair: TMenuItem
      Caption = 'Sair'
      OnClick = SairClick
    end
  end
end
