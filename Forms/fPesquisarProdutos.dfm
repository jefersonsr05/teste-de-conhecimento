inherited frmPesquisarProdutos: TfrmPesquisarProdutos
  Caption = 'Pesquisar Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited ButtonPesquisa: TButton
      OnClick = ButtonPesquisaClick
    end
    inherited ButtonNovo: TButton
      OnClick = ButtonNovoClick
    end
  end
  inherited DBGridResultadoPesquisa: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_VENDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_VENDA'
        Visible = True
      end>
  end
  inherited FDQueryPesquisar: TFDQuery
    Active = True
    SQL.Strings = (
      'select * from produtos;')
  end
end
