inherited frmCadClientes: TfrmCadClientes
  Caption = 'Cadastro de Clientes'
  ClientWidth = 1074
  ExplicitTop = -62
  ExplicitWidth = 1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 1074
    ExplicitWidth = 1074
    inherited TabListagem: TTabSheet
      ExplicitWidth = 1066
      inherited pnlListagemTopo: TPanel
        Width = 1066
        ExplicitWidth = 1066
        object btnRelatorio: TBitBtn
          Left = 482
          Top = 24
          Width = 80
          Height = 21
          Caption = 'Relat'#243'rio'
          ImageIndex = 13
          Images = ImageList1
          TabOrder = 1
          OnClick = btnRelatorioClick
        end
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
        Color = 15519415
        ParentBackground = False
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
          TabOrder = 9
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
          TabOrder = 5
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
          TabOrder = 4
        end
        object edtFone: TMaskEdit
          Left = 155
          Top = 224
          Width = 119
          Height = 21
          EditMask = '(00) 0000-0000;1;_'
          MaxLength = 14
          TabOrder = 7
          Text = '(  )     -    '
        end
        object edtCelular: TMaskEdit
          Left = 331
          Top = 224
          Width = 119
          Height = 21
          EditMask = '(00) 00000-0000;1;_'
          MaxLength = 15
          TabOrder = 8
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
          TabOrder = 6
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
          TabOrder = 3
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
          TabOrder = 2
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
          TabOrder = 1
        end
        object edtCodigo: TLabeledEdit
          Tag = 9
          Left = 51
          Top = 32
          Width = 80
          Height = 21
          TabStop = False
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo'
          MaxLength = 5
          NumbersOnly = True
          TabOrder = 0
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
  object frxDBClientes: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = dtmConexao.qryClientes
    BCDToCurrency = False
    DataSetOptions = []
    Left = 668
    Top = 32
  end
  object frxReportClientes: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44859.875441898100000000
    ReportOptions.LastChange = 44859.879913379630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 748
    Top = 32
    Datasets = <
      item
        DataSet = frxDBClientes
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Clientes')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220472000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 59.685204560000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 63.464734560000000000
          Width = 185.959360710000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 249.424095270000000000
          Width = 198.167720230000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 447.591815510000000000
          Width = 165.353443500000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 612.945259000000000000
          Width = 105.164977220000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Celular')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        DataSet = frxDBClientes
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 59.685204560000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO'
          DataSet = frxDBClientes
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CODIGO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 63.464734560000000000
          Top = 3.779530000000000000
          Width = 182.179830710000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxDBClientes
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOME"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 245.644565270000000000
          Top = 3.779530000000000000
          Width = 198.167720230000000000
          Height = 18.897650000000000000
          DataField = 'ENDERECO'
          DataSet = frxDBClientes
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ENDERECO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 443.812285510000000000
          Top = 3.779530000000000000
          Width = 165.353443500000000000
          Height = 18.897650000000000000
          DataField = 'CIDADE'
          DataSet = frxDBClientes
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CIDADE"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 609.165729000000000000
          Top = 3.779530000000000000
          Width = 108.944507220000000000
          Height = 18.897650000000000000
          DataField = 'CELULAR'
          DataSet = frxDBClientes
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CELULAR"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo15: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
end
