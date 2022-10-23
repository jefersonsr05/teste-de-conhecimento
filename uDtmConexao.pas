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
