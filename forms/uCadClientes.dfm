inherited frmCadClientes: TfrmCadClientes
  Caption = 'Cadastro de Clientes'
  ClientWidth = 1074
  ExplicitWidth = 1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 1074
    ActivePage = TabSheet2
    ExplicitWidth = 1074
    ExplicitHeight = 656
    inherited TabListagem: TTabSheet
      ExplicitWidth = 1066
      inherited pnlListagemTopo: TPanel
        Width = 1066
        ExplicitWidth = 1066
      end
      inherited grdListagem: TDBGrid
        Width = 1066
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      end
    end
    inherited TabSheet2: TTabSheet
      ExplicitWidth = 1066
      object pnlCima: TPanel
        Left = 0
        Top = 0
        Width = 1066
        Height = 48
        Align = alTop
        TabOrder = 0
        object lblGrandeNome: TLabel
          Left = 207
          Top = 8
          Width = 56
          Height = 23
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblGrandeCodigo: TLabel
          Left = 152
          Top = 8
          Width = 37
          Height = 23
          Caption = 'Cod'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnlMeio: TPanel
        Left = 0
        Top = 48
        Width = 1066
        Height = 580
        Align = alClient
        TabOrder = 1
        object lblTextoCelular: TLabel
          Left = 331
          Top = 208
          Width = 33
          Height = 13
          Caption = 'Celular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTextoTelefone: TLabel
          Left = 155
          Top = 208
          Width = 42
          Height = 13
          Caption = 'Telefone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTextoCep: TLabel
          Left = 495
          Top = 128
          Width = 19
          Height = 13
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtEmail: TLabeledEdit
          Left = 155
          Top = 272
          Width = 265
          Height = 21
          EditLabel.Width = 28
          EditLabel.Height = 13
          EditLabel.Caption = 'E-mail'
          MaxLength = 50
          TabOrder = 0
        end
        object edtUf: TLabeledEdit
          Tag = 1
          Left = 436
          Top = 144
          Width = 37
          Height = 21
          EditLabel.Width = 13
          EditLabel.Height = 13
          EditLabel.Caption = 'UF'
          MaxLength = 2
          TabOrder = 1
        end
        object edtCidade: TLabeledEdit
          Tag = 1
          Left = 299
          Top = 144
          Width = 121
          Height = 21
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'Cidade'
          MaxLength = 30
          TabOrder = 2
        end
        object edtFone: TMaskEdit
          Left = 155
          Top = 224
          Width = 119
          Height = 21
          EditMask = '(00) 0000-0000;1;_'
          MaxLength = 14
          TabOrder = 3
          Text = '(  )     -    '
        end
        object edtCelular: TMaskEdit
          Left = 331
          Top = 224
          Width = 119
          Height = 21
          EditMask = '(00) 00000-0000;1;_'
          MaxLength = 15
          TabOrder = 4
          Text = '(  )      -    '
        end
        object edtCep: TMaskEdit
          Tag = 1
          Left = 495
          Top = 144
          Width = 118
          Height = 21
          EditMask = '00.000-000;1;_'
          MaxLength = 10
          TabOrder = 5
          Text = '  .   -   '
        end
        object edtBairro: TLabeledEdit
          Tag = 1
          Left = 155
          Top = 144
          Width = 121
          Height = 21
          EditLabel.Width = 28
          EditLabel.Height = 13
          EditLabel.Caption = 'Bairro'
          MaxLength = 20
          TabOrder = 6
        end
        object edtEndereco: TLabeledEdit
          Tag = 1
          Left = 155
          Top = 96
          Width = 458
          Height = 21
          EditLabel.Width = 45
          EditLabel.Height = 13
          EditLabel.Caption = 'Endere'#231'o'
          MaxLength = 35
          TabOrder = 7
        end
        object edtNome: TLabeledEdit
          Tag = 1
          Left = 155
          Top = 32
          Width = 458
          Height = 21
          EditLabel.Width = 27
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome'
          MaxLength = 35
          TabOrder = 8
        end
        object edtCodigo: TLabeledEdit
          Tag = 9
          Left = 51
          Top = 32
          Width = 80
          Height = 21
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo'
          MaxLength = 5
          NumbersOnly = True
          TabOrder = 9
        end
      end
    end
  end
  inherited pnlBaixo: TPanel
    Width = 1074
    ExplicitWidth = 1074
    inherited btnFechar: TBitBtn
      Left = 979
      ExplicitLeft = 979
    end
    inherited btnNavegar: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT CODIGO, NOME, CIDADE, UF, FONE, CELULAR FROM CLIENTE')
    object qryListagemCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CODIGO'
      Required = True
    end
    object qryListagemNOME: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 86
      FieldName = 'NOME'
      Size = 35
    end
    object qryListagemCIDADE: TWideStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 30
      FieldName = 'CIDADE'
      Size = 30
    end
    object qryListagemUF: TWideStringField
      DisplayWidth = 5
      FieldName = 'UF'
      Size = 2
    end
    object qryListagemFONE: TWideStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 19
      FieldName = 'FONE'
      Size = 15
    end
    object qryListagemCELULAR: TWideStringField
      DisplayLabel = 'Celular'
      DisplayWidth = 18
      FieldName = 'CELULAR'
      Size = 15
    end
  end
end
