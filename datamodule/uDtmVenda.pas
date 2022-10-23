unit uDtmVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdtmVenda = class(TDataModule)
    qryCliente: TZQuery;
    qryClienteCODIGO: TIntegerField;
    qryClienteNOME: TWideStringField;
    qryProduto: TZQuery;
    qryProdutoCODIGO: TIntegerField;
    qryProdutoDESCRICAO: TWideStringField;
    qryProdutoPRECO_VENDA: TExtendedField;
    qryProdutoSALDO: TExtendedField;
    cdsItensVenda: TClientDataSet;
    dtsClient: TDataSource;
    dtsProduto: TDataSource;
    dtsItensVenda: TDataSource;
    cdsItensVendaprodutoCod: TIntegerField;
    cdsItensVendaProdutoDescricao: TStringField;
    cdsItensVendaquantidader: TFloatField;
    cdsItensVendavalorUn: TFloatField;
    cdsItensVendavalorTotalProduto: TFloatField;
    cdsItensVendavalorTotalVenda: TAggregateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVenda: TdtmVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDtmConexao;

{$R *.dfm}

procedure TdtmVenda.DataModuleCreate(Sender: TObject);
begin
  cdsItensVenda.CreateDataSet;
  qryCliente.Open;
  qryProduto.Open;
end;

procedure TdtmVenda.DataModuleDestroy(Sender: TObject);
begin
  cdsItensVenda.Close;
  qryCliente.Close;
  qryProduto.Close;
end;

end.
