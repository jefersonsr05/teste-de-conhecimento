object frmConsultaVenda: TfrmConsultaVenda
  Left = 0
  Top = 0
  Caption = 'Consulta Vendas'
  ClientHeight = 663
  ClientWidth = 1027
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFiltros: TPanel
    Left = 0
    Top = 41
    Width = 1027
    Height = 72
    Align = alTop
    TabOrder = 0
    object cmbFiltro: TComboBox
      Left = 16
      Top = 6
      Width = 145
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'Data'
        'Numero Venda'
        'Cliente')
    end
    object dtpFiltroData: TDateTimePicker
      Left = 184
      Top = 29
      Width = 145
      Height = 21
      Date = 44858.000000000000000000
      Time = 0.528858067133114700
      TabOrder = 1
    end
    object chbFiltoData: TCheckBox
      Left = 184
      Top = 6
      Width = 97
      Height = 17
      Caption = 'Filtrar por data'
      TabOrder = 2
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 622
    Width = 1027
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnAlterar: TButton
      Left = 106
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 0
    end
    object btnAtualizar: TButton
      Left = 316
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Atualizar'
      TabOrder = 1
    end
    object btnExcluir: TButton
      Left = 211
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 2
    end
    object btnInserir: TButton
      Left = 1
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Inserir'
      TabOrder = 3
    end
    object btnSair: TButton
      Left = 526
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Sair'
      TabOrder = 4
      OnClick = btnSairClick
    end
    object btnRelatorio: TButton
      Left = 421
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Relat'#243'rio'
      TabOrder = 5
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 1027
    Height = 41
    Align = alTop
    Caption = 'Consulta Vendas'
    TabOrder = 2
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 113
    Width = 1027
    Height = 509
    Align = alClient
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 1025
      Height = 507
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1025
      Height = 507
      Align = alClient
      TabOrder = 1
      object pgcPrincipal: TPageControl
        Left = 1
        Top = 1
        Width = 1023
        Height = 505
        ActivePage = tbsConsulta
        Align = alClient
        TabOrder = 0
        object tbsConsulta: TTabSheet
          Caption = 'Consulta'
          object grdProduto: TDBGrid
            Left = 0
            Top = 41
            Width = 1015
            Height = 436
            Align = alClient
            DataSource = dtsProduto
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
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
                FieldName = 'TIPO VENDA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR VENDA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OPERACAO VENDA'
                Visible = True
              end>
          end
          object pnlPesquisas: TPanel
            Left = 0
            Top = 0
            Width = 1015
            Height = 41
            Align = alTop
            TabOrder = 1
            object lblPesquisaProduto: TLabel
              Left = 0
              Top = -3
              Width = 83
              Height = 13
              Caption = 'Pesquisa Produto'
            end
            object edtFiltroProduto: TEdit
              Left = 0
              Top = 16
              Width = 260
              Height = 21
              TabOrder = 0
            end
          end
        end
        object tbsCadastro: TTabSheet
          Caption = 'Cadastro'
          ImageIndex = 1
          object pnlCentralCad: TPanel
            Left = 0
            Top = 0
            Width = 1015
            Height = 477
            Align = alClient
            TabOrder = 0
            ExplicitLeft = -136
            ExplicitTop = 3
            object lbldescricao: TLabel
              Left = 1
              Top = 69
              Width = 46
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object lblReferencia: TLabel
              Left = 1
              Top = 117
              Width = 52
              Height = 13
              Caption = 'Referencia'
            end
            object lblCodigo: TLabel
              Left = 0
              Top = 23
              Width = 33
              Height = 13
              Caption = 'Codigo'
            end
            object lblUnidade: TLabel
              Left = 1
              Top = 163
              Width = 39
              Height = 13
              Caption = 'Unidade'
            end
            object lblDataVenda: TLabel
              Left = 190
              Top = 23
              Width = 56
              Height = 13
              Caption = 'Data Venda'
            end
            object lblPrecoVenda: TLabel
              Left = 1
              Top = 214
              Width = 60
              Height = 13
              Caption = 'Pre'#231'o Venda'
            end
            object lblSaldo: TLabel
              Left = 2
              Top = 263
              Width = 26
              Height = 13
              Caption = 'Saldo'
            end
            object edtDescricao: TEdit
              Left = 1
              Top = 88
              Width = 121
              Height = 21
              TabOrder = 1
            end
            object edtReferencia: TEdit
              Left = 1
              Top = 136
              Width = 121
              Height = 21
              TabOrder = 2
            end
            object edtCodigo: TEdit
              Left = 2
              Top = 42
              Width = 121
              Height = 21
              TabStop = False
              Color = clGradientActiveCaption
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
            object edtUnidade: TEdit
              Left = 0
              Top = 182
              Width = 121
              Height = 21
              TabOrder = 3
            end
            object edtPrecoVenda: TEdit
              Left = 2
              Top = 233
              Width = 121
              Height = 21
              TabOrder = 5
            end
            object edtSaldo: TEdit
              Left = 2
              Top = 282
              Width = 121
              Height = 21
              TabOrder = 6
            end
            object pnlBotoesProd: TPanel
              Left = 1
              Top = 435
              Width = 1013
              Height = 41
              Align = alBottom
              TabOrder = 7
              object btnCancelar: TButton
                Left = 106
                Top = 1
                Width = 105
                Height = 39
                Align = alLeft
                Caption = 'Cancelar'
                TabOrder = 1
              end
              object btnConfirmar: TButton
                Left = 1
                Top = 1
                Width = 105
                Height = 39
                Align = alLeft
                Caption = 'Confirmar'
                TabOrder = 0
              end
            end
            object dtpDataVenda: TDateTimePicker
              Left = 190
              Top = 42
              Width = 121
              Height = 21
              Date = 44855.000000000000000000
              Time = 0.887964085646672200
              Enabled = False
              TabOrder = 4
              TabStop = False
            end
          end
        end
      end
    end
  end
  object qryConsultaVenda: TFDQuery
    Connection = dtmConexao.Conexao
    SQL.Strings = (
      'select*from venda')
    Left = 920
    Top = 432
    object qryConsultaVendaNRNOTA: TIntegerField
      FieldName = 'NRNOTA'
      Origin = 'NRNOTA'
      Required = True
    end
    object qryConsultaVendaEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object qryConsultaVendaCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Required = True
    end
    object qryConsultaVendaTIPO_VENDA: TStringField
      FieldName = 'TIPO VENDA'
      Origin = 'TIPO_VENDA'
      FixedChar = True
      Size = 1
    end
    object qryConsultaVendaVALOR_VENDA: TBCDField
      FieldName = 'VALOR VENDA'
      Origin = 'VALOR_VENDA'
      Precision = 18
    end
    object qryConsultaVendaOPERACAO_VENDA: TStringField
      FieldName = 'OPERACAO VENDA'
      Origin = 'OPERACAO_VENDA'
      FixedChar = True
      Size = 1
    end
  end
  object dtsProduto: TDataSource
    DataSet = qryConsultaVenda
    Left = 920
    Top = 496
  end
end
