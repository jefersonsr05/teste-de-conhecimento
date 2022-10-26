unit uDtmConexao;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdtmConexao = class(TDataModule)
    ConexaoDB: TZConnection;
    qryScriptVendas: TZQuery;
    qryProdutos: TZQuery;
    qryClientes: TZQuery;
    qryItensVendas: TZQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesNOME: TWideStringField;
    qryClientesENDERECO: TWideStringField;
    qryClientesCIDADE: TWideStringField;
    qryClientesFONE: TWideStringField;
    qryClientesCELULAR: TWideStringField;
    qryProdutosCODIGO: TIntegerField;
    qryProdutosDESCRICAO: TWideStringField;
    qryProdutosREFERENCIA: TWideStringField;
    qryProdutosUNIDADE: TWideStringField;
    qryProdutosDATA_VENDA: TDateField;
    qryProdutosPRECO_VENDA: TExtendedField;
    qryProdutosSALDO: TExtendedField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
