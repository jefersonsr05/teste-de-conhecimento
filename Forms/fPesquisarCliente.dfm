inherited frmPesquisarClientes: TfrmPesquisarClientes
  Caption = 'Pesquisar Clientes'
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
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENDERECO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAIRRO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FONE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CELULAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Visible = True
      end>
  end
  inherited FDQueryPesquisar: TFDQuery
    Active = True
    Transaction = FDTransactionPesquisar
    SQL.Strings = (
      'select * from cliente')
  end
end
