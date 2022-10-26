unit dConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Forms,
  Vcl.Dialogs, FireDAC.Stan.StorageBin;

type
  TdtmConexao = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    qryConsultaClientes: TFDQuery;
    dtsClientes: TDataSource;
    dtsProdutos: TDataSource;
    qryConsultaProdutos: TFDQuery;
    qryVenda: TFDQuery;
    dtsItens: TDataSource;
    tblConsultaItens: TFDMemTable;
    dtsVenda: TDataSource;
    qryConsultaClientesCODIGO: TIntegerField;
    qryConsultaClientesNOME: TStringField;
    qryConsultaClientesENDERECO: TStringField;
    qryConsultaClientesBAIRRO: TStringField;
    qryConsultaClientesCIDADE: TStringField;
    qryConsultaClientesCEP: TStringField;
    qryConsultaClientesUF: TStringField;
    qryConsultaClientesFONE: TStringField;
    qryConsultaClientesCELULAR: TStringField;
    qryConsultaClientesEMAIL: TStringField;
    qryConsultaProdutosCODIGO: TIntegerField;
    qryConsultaProdutosDESCRICAO: TStringField;
    qryConsultaProdutosREFERENCIA: TStringField;
    qryConsultaProdutosUNIDADE: TStringField;
    qryConsultaProdutosDATA_VENDA: TDateField;
    qryConsultaProdutosPRECO_VENDA: TBCDField;
    qryConsultaProdutosSALDO: TBCDField;
    qryVendaNRNOTA: TIntegerField;
    qryVendaEMISSAO: TDateField;
    qryVendaCLIENTE: TIntegerField;
    qryVendaNOME: TStringField;
    qryVendaOPERACAO_VENDA: TStringField;
    qryVendaTIPO_VENDA: TStringField;
    qryVendaVALOR_VENDA: TBCDField;
    tblConsultaItensLCTO: TIntegerField;
    tblConsultaItensNR_VENDA: TIntegerField;
    tblConsultaItensPRODUTO: TIntegerField;
    tblConsultaItensQTDE: TBCDField;
    tblConsultaItensVALOR_UNIT: TBCDField;
    tblConsultaItensVALOR_TOTAL: TBCDField;
    tblConsultaItensPROD_NOME: TStringField;
  private
    { Private declarations }
    function DevolveCaminhoBanco: String;
    function RetornaDiretorio: string;

  public
    { Public declarations }
    function ConectaBanco: boolean;

  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TdtmConexao }

function TdtmConexao.ConectaBanco: boolean;
begin

  try
    FDConnection.Params.DriverID := 'FB';
    FDConnection.Params.Database := DevolveCaminhoBanco;
    FDConnection.Params.UserName := 'SYSDBA';
    FDConnection.Params.Password := 'masterkey';
    FDConnection.Connected := true;
    result := true;
  except
    on E: Exception do
    begin
      ShowMessage('Problema ao conectar no banco de dados, favor chamar o alexandre.');
      result := false;
    end;
  end;

end;

function TdtmConexao.DevolveCaminhoBanco: String;
var
  lArquivoTxT: TextFile;
  lHost: string;
  lLocal: string;
  lCaminho, lTipo: string;
  ConfiguracaoINI: string;

begin
  ConfiguracaoINI := RetornaDiretorio + 'configuracao.ini';

  if FileExists(ConfiguracaoINI) then
  begin
    AssignFile(lArquivoTxT, ConfiguracaoINI);
    Reset(lArquivoTxT);
    Readln(lArquivoTxT, lHost);
    Readln(lArquivoTxT, lLocal);
    Readln(lArquivoTxT, lTipo);
    lHost := trim(Copy(lHost, 6, 100));
    lLocal := trim(Copy(lLocal, 7, 150));
    lTipo := trim(Copy(lTipo, 6, 15));

    CloseFile(lArquivoTxT);
    lCaminho := lHost + ':' + lLocal;

    result := lCaminho;
  end;

end;

function TdtmConexao.RetornaDiretorio: string;
var
  lDiretorio: string;
begin
  lDiretorio := ExtractFilePath(Application.exeName);
  if Copy(lDiretorio, Length(lDiretorio), 1) <> '\' then
  begin
    lDiretorio := lDiretorio + '\';
  end;

  result := lDiretorio;

end;

end.
