object frmProduto: TfrmProduto
  Left = 0
  Top = 0
  Caption = 'Tela de Produtos'
  ClientHeight = 525
  ClientWidth = 976
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCentral: TPanel
    Left = 0
    Top = 90
    Width = 976
    Height = 435
    Align = alClient
    TabOrder = 0
    object pgcPrincipal: TPageControl
      Left = 1
      Top = 1
      Width = 974
      Height = 433
      ActivePage = tbsCadastro
      Align = alClient
      TabOrder = 0
      object tbsConsulta: TTabSheet
        Caption = 'Consulta'
        object grdProduto: TDBGrid
          Left = 0
          Top = 41
          Width = 966
          Height = 364
          Align = alClient
          DataSource = dtsProduto
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnTitleClick = grdProdutoTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Title.Caption = 'Codigo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REFERENCIA'
              Title.Caption = 'Refer'#234'ncia'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADE'
              Title.Caption = 'Unidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_VENDA'
              Title.Caption = 'Data Venda'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_VENDA'
              Title.Caption = 'Pre'#231'o Venda'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALDO'
              Title.Caption = 'Saldo'
              Width = 40
              Visible = True
            end>
        end
        object pnlPesquisas: TPanel
          Left = 0
          Top = 0
          Width = 966
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
          Width = 966
          Height = 405
          Align = alClient
          TabOrder = 0
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
            OnKeyPress = edtUnidadeKeyPress
          end
          object edtPrecoVenda: TEdit
            Left = 2
            Top = 236
            Width = 121
            Height = 21
            TabOrder = 5
            OnKeyPress = edtPrecoVendaKeyPress
          end
          object edtSaldo: TEdit
            Left = 2
            Top = 282
            Width = 121
            Height = 21
            TabOrder = 6
            OnKeyPress = edtSaldoKeyPress
          end
          object pnlBotoesProd: TPanel
            Left = 1
            Top = 363
            Width = 964
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
              OnClick = btnCancelarClick
            end
            object btnConfirmar: TButton
              Left = 1
              Top = 1
              Width = 105
              Height = 39
              Align = alLeft
              Caption = 'Confirmar'
              TabOrder = 0
              OnClick = btnConfirmarClick
              OnKeyPress = btnConfirmarKeyPress
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
  object pnlBotoes: TPanel
    Left = 0
    Top = 49
    Width = 976
    Height = 41
    Align = alTop
    TabOrder = 1
    object btnAtualizar: TButton
      Left = 316
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Atualizar'
      TabOrder = 0
      OnClick = btnAtualizarClick
    end
    object btnSair: TButton
      Left = 421
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
    object btnExcluir: TButton
      Left = 211
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnAlterar: TButton
      Left = 106
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 3
      OnClick = btnAlterarClick
    end
    object btnInserir: TButton
      Left = 1
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Inserir'
      TabOrder = 4
      OnClick = btnInserirClick
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 976
    Height = 49
    Align = alTop
    Caption = 'Tela de Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object dtsProduto: TDataSource
    DataSet = qryConsultaProduto
    Left = 912
    Top = 432
  end
  object qryConsultaProduto: TFDQuery
    Connection = dtmConexao.Conexao
    SQL.Strings = (
      'select*from produtos')
    Left = 912
    Top = 368
  end
  object qryCadastroProduto: TFDQuery
    Connection = dtmConexao.Conexao
    Left = 909
    Top = 290
  end
end
