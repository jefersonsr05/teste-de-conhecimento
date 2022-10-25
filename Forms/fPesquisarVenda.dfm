inherited frmPesquisarVenda: TfrmPesquisarVenda
  Caption = 'frmPesquisarVenda'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited LabelNome: TLabel
      Width = 69
      Caption = 'C'#243'digo Cliente'
      ExplicitWidth = 69
    end
    inherited ButtonPesquisa: TButton
      OnClick = ButtonPesquisaClick
    end
    inherited ButtonVisualizar: TButton
      Enabled = False
    end
    inherited RadioButtonNome: TRadioButton
      Caption = 'Cod Cliente'
    end
  end
  inherited EditNome: TEdit
    Width = 89
    ExplicitWidth = 89
  end
  inherited DBGridResultadoPesquisa: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'NRNOTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMISSAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_VENDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_VENDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPERACAO_VENDA'
        Visible = True
      end>
  end
  inherited FDQueryPesquisar: TFDQuery
    SQL.Strings = (
      'select * from venda')
    object FDQueryPesquisarNRNOTA: TIntegerField
      FieldName = 'NRNOTA'
      Origin = 'NRNOTA'
      Required = True
    end
    object FDQueryPesquisarEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object FDQueryPesquisarCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Required = True
    end
    object FDQueryPesquisarTIPO_VENDA: TWideStringField
      FieldName = 'TIPO_VENDA'
      Origin = 'TIPO_VENDA'
      FixedChar = True
      Size = 1
    end
    object FDQueryPesquisarVALOR_VENDA: TBCDField
      FieldName = 'VALOR_VENDA'
      Origin = 'VALOR_VENDA'
      Precision = 18
    end
    object FDQueryPesquisarOPERACAO_VENDA: TWideStringField
      FieldName = 'OPERACAO_VENDA'
      Origin = 'OPERACAO_VENDA'
      FixedChar = True
      Size = 1
    end
  end
end
