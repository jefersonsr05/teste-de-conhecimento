object frmCliente: TfrmCliente
  Left = 0
  Top = 0
  Caption = 'Tela de Clientes'
  ClientHeight = 525
  ClientWidth = 976
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
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
        object grdCliente: TDBGrid
          Left = 0
          Top = 49
          Width = 966
          Height = 356
          Align = alClient
          DataSource = dtsCliente
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnTitleClick = grdClienteTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CEP'
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
        object pnlPesquisas: TPanel
          Left = 0
          Top = 0
          Width = 966
          Height = 49
          Align = alTop
          TabOrder = 1
          object lblPesquisaCliente: TLabel
            Left = 0
            Top = 4
            Width = 78
            Height = 13
            Caption = 'Pesquisa Cliente'
          end
          object edtFiltroNome: TEdit
            Left = 0
            Top = 23
            Width = 260
            Height = 21
            TabOrder = 0
            OnChange = edtFiltroNomeChange
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
          object lblNome: TLabel
            Left = 1
            Top = 69
            Width = 27
            Height = 13
            Caption = 'Nome'
          end
          object lblEndereco: TLabel
            Left = 1
            Top = 117
            Width = 45
            Height = 13
            Caption = 'Endere'#231'o'
          end
          object lblCodigo: TLabel
            Left = 0
            Top = 23
            Width = 33
            Height = 13
            Caption = 'Codigo'
          end
          object lblBairro: TLabel
            Left = 1
            Top = 163
            Width = 28
            Height = 13
            Caption = 'Bairro'
          end
          object lblCidade: TLabel
            Left = 1
            Top = 216
            Width = 33
            Height = 13
            Caption = 'Cidade'
          end
          object lblCep: TLabel
            Left = 1
            Top = 262
            Width = 19
            Height = 13
            Caption = 'CEP'
          end
          object lblUf: TLabel
            Left = 216
            Top = 23
            Width = 13
            Height = 13
            Caption = 'UF'
          end
          object lblFone: TLabel
            Left = 216
            Top = 69
            Width = 24
            Height = 13
            Caption = 'Fone'
          end
          object lblCelular: TLabel
            Left = 216
            Top = 117
            Width = 33
            Height = 13
            Caption = 'Celular'
          end
          object lblEmail: TLabel
            Left = 216
            Top = 163
            Width = 24
            Height = 13
            Caption = 'Email'
          end
          object edtNome: TEdit
            Tag = 5
            Left = 0
            Top = 88
            Width = 121
            Height = 21
            Hint = 'Nome'
            TabOrder = 1
          end
          object edtEndereco: TEdit
            Tag = 5
            Left = 1
            Top = 136
            Width = 121
            Height = 21
            Hint = 'Endere'#231'o'
            TabOrder = 2
          end
          object edtCodigo: TEdit
            Tag = 5
            Left = 0
            Top = 42
            Width = 121
            Height = 21
            Color = clGradientActiveCaption
            Enabled = False
            TabOrder = 0
          end
          object edtBairro: TEdit
            Tag = 5
            Left = 0
            Top = 182
            Width = 121
            Height = 21
            Hint = 'Bairro'
            TabOrder = 3
          end
          object edtCidade: TEdit
            Tag = 5
            Left = 0
            Top = 235
            Width = 121
            Height = 21
            Hint = 'Cidade'
            TabOrder = 4
          end
          object edtCep: TEdit
            Tag = 5
            Left = 0
            Top = 281
            Width = 121
            Height = 21
            Hint = 'CEP'
            TabOrder = 5
            OnKeyPress = edtCepKeyPress
          end
          object edtUf: TEdit
            Tag = 5
            Left = 216
            Top = 42
            Width = 121
            Height = 21
            Hint = 'UF'
            TabOrder = 6
          end
          object edtFone: TEdit
            Left = 216
            Top = 88
            Width = 121
            Height = 21
            TabOrder = 7
          end
          object edtCelular: TEdit
            Tag = 5
            Left = 216
            Top = 136
            Width = 121
            Height = 21
            Hint = 'Celular'
            TabOrder = 8
            OnKeyPress = edtCelularKeyPress
          end
          object edtEmail: TEdit
            Left = 216
            Top = 182
            Width = 121
            Height = 21
            TabOrder = 9
          end
          object pnlBotoesCliente: TPanel
            Left = 1
            Top = 363
            Width = 964
            Height = 41
            Align = alBottom
            TabOrder = 10
            object btnConfirmar: TButton
              Left = 1
              Top = 1
              Width = 105
              Height = 39
              Align = alLeft
              Caption = 'Confirmar'
              TabOrder = 0
              OnClick = btnConfirmarClick
            end
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
    object btnInserir: TButton
      Left = 1
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = btnInserirClick
    end
    object btnAlterar: TButton
      Left = 106
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
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
    object btnAtualizar: TButton
      Left = 316
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Atualizar'
      TabOrder = 3
      OnClick = btnAtualizarClick
    end
    object btnSair: TButton
      Left = 421
      Top = 1
      Width = 105
      Height = 39
      Align = alLeft
      Caption = 'Sair'
      TabOrder = 4
      OnClick = btnSairClick
    end
  end
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 976
    Height = 49
    Align = alTop
    Caption = 'Tela de Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object dtsCliente: TDataSource
    DataSet = qryConsultaCliente
    Left = 912
    Top = 416
  end
  object qryConsultaCliente: TFDQuery
    Connection = dtmConexao.Conexao
    UpdateOptions.AssignedValues = [uvUpdateMode, uvLockMode]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.LockMode = lmOptimistic
    SQL.Strings = (
      'select*from Cliente')
    Left = 912
    Top = 368
    object qryConsultaClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConsultaClienteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 35
    end
    object qryConsultaClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 35
    end
    object qryConsultaClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
    end
    object qryConsultaClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object qryConsultaClienteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object qryConsultaClienteUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      FixedChar = True
      Size = 2
    end
    object qryConsultaClienteFONE: TStringField
      FieldName = 'FONE'
      Origin = 'FONE'
      Size = 15
    end
    object qryConsultaClienteCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 15
    end
    object qryConsultaClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
  end
end
