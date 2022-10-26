inherited frmCadProdutos: TfrmCadProdutos
  Caption = 'Cadastro de Produtos'
  ExplicitTop = -62
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited TabListagem: TTabSheet
      inherited pnlListagemTopo: TPanel
        object btnRelatorio: TBitBtn
          Left = 480
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
    end
    inherited TabSheet2: TTabSheet
      object pnlMeio: TPanel
        Left = 0
        Top = 169
        Width = 1072
        Height = 459
        Align = alClient
        TabOrder = 1
        object lblUltimaVenda: TLabel
          Left = 170
          Top = 88
          Width = 62
          Height = 13
          Caption = #218'ltima Venda'
        end
        object lblTextoVenda: TLabel
          Left = 170
          Top = 21
          Width = 87
          Height = 13
          Caption = 'Pre'#231'o de venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblTextoSaldo: TLabel
          Left = 528
          Top = 21
          Width = 26
          Height = 13
          Caption = 'Saldo'
        end
        object edtSaldo: TCurrencyEdit
          Left = 527
          Top = 40
          Width = 75
          Height = 21
          DisplayFormat = '0.00;-0.00'
          MaxLength = 5
          TabOrder = 1
        end
        object edtDataVenda: TDatePicker
          Left = 170
          Top = 104
          Width = 121
          Height = 25
          Date = 44856.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          TabOrder = 2
          TabStop = False
        end
        object edtPrecoVenda: TCurrencyEdit
          Tag = 1
          Left = 170
          Top = 37
          Width = 121
          Height = 21
          MaxLength = 10
          TabOrder = 0
        end
      end
      object pnlCima: TPanel
        Left = 0
        Top = 0
        Width = 1072
        Height = 169
        Align = alTop
        TabOrder = 0
        object pnlCimaCima: TPanel
          Left = 1
          Top = 1
          Width = 1070
          Height = 48
          Align = alTop
          Color = 15519415
          ParentBackground = False
          TabOrder = 0
          OnClick = pnlCimaCimaClick
          object lblGrandeDescricao: TLabel
            Left = 223
            Top = 8
            Width = 92
            Height = 23
            Caption = 'Descricao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblGrandeCodigo: TLabel
            Left = 168
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
        object edtCodigo: TLabeledEdit
          Tag = 9
          Left = 52
          Top = 75
          Width = 75
          Height = 21
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo'
          MaxLength = 5
          NumbersOnly = True
          TabOrder = 4
        end
        object edtDescricao: TLabeledEdit
          Tag = 1
          Left = 169
          Top = 79
          Width = 413
          Height = 21
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o'
          MaxLength = 35
          TabOrder = 1
        end
        object edtReferencia: TLabeledEdit
          Left = 169
          Top = 127
          Width = 327
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = 'Refer'#234'ncia'
          MaxLength = 15
          TabOrder = 2
        end
        object edtUnidade: TLabeledEdit
          Tag = 1
          Left = 527
          Top = 127
          Width = 55
          Height = 21
          EditLabel.Width = 39
          EditLabel.Height = 13
          EditLabel.Caption = 'Unidade'
          MaxLength = 4
          TabOrder = 3
        end
      end
    end
  end
  inherited pnlBaixo: TPanel
    inherited btnNavegar: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited qryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'select * from produtos')
    object qryListagemCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CODIGO'
      Required = True
    end
    object qryListagemDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 69
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryListagemREFERENCIA: TWideStringField
      DisplayLabel = 'Refer'#234'ncia'
      DisplayWidth = 29
      FieldName = 'REFERENCIA'
      Size = 15
    end
    object qryListagemUNIDADE: TWideStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 8
      FieldName = 'UNIDADE'
      Size = 4
    end
    object qryListagemPRECO_VENDA: TExtendedField
      DisplayLabel = 'Pre'#231'o de venda'
      DisplayWidth = 16
      FieldName = 'PRECO_VENDA'
      DisplayFormat = ',R$ #0.00'
      Precision = 19
    end
    object qryListagemSALDO: TExtendedField
      DisplayLabel = 'Saldo'
      DisplayWidth = 11
      FieldName = 'SALDO'
      DisplayFormat = ',#0.00'
      Precision = 19
    end
  end
  object frxDBProdutos: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = dtmConexao.qryProdutos
    BCDToCurrency = False
    DataSetOptions = []
    Left = 708
    Top = 32
  end
  object frxReportProdutos: TfrxReport
    Version = '2022.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44859.941650601900000000
    ReportOptions.LastChange = 44859.942931087960000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 804
    Top = 32
    Datasets = <
      item
        DataSet = frxDBProdutos
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
            'Report')
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
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CODIGO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 78.000000000000000000
          Width = 318.692950000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRICAO')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 400.472480000000000000
          Width = 125.338590000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'REFERENCIA')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 533.370130000000000000
          Width = 104.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PRECO_VENDA')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 641.149660000000000000
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SALDO')
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
        DataSet = frxDBProdutos
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO'
          DataSet = frxDBProdutos
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
          Left = 78.000000000000000000
          Top = 3.779530000000000000
          Width = 322.472480000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = frxDBProdutos
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DESCRICAO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 400.472480000000000000
          Top = 3.779530000000000000
          Width = 125.338590000000000000
          Height = 18.897650000000000000
          DataField = 'REFERENCIA'
          DataSet = frxDBProdutos
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."REFERENCIA"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 533.370130000000000000
          Top = 3.779530000000000000
          Width = 104.000000000000000000
          Height = 18.897650000000000000
          DataField = 'PRECO_VENDA'
          DataSet = frxDBProdutos
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."PRECO_VENDA"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 637.370130000000000000
          Top = 3.779530000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'SALDO'
          DataSet = frxDBProdutos
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."SALDO"]')
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
