program VendaRapidaMC;

uses
  Vcl.Forms,
  uInicial in 'uInicial.pas' {frmInicial},
  uDtmConexao in 'uDtmConexao.pas' {dtmConexao: TDataModule},
  uTelaHeranca in 'forms\uTelaHeranca.pas' {frmTelaHeranca},
  uCadClientes in 'forms\uCadClientes.pas' {frmCadClientes},
  Enter in 'terceiros\Enter.pas',
  uEnum in 'forms\uEnum.pas',
  cCadClientes in 'classes\cCadClientes.pas',
  uCadProduto in 'forms\uCadProduto.pas' {frmCadProdutos},
  cCadProdutos in 'classes\cCadProdutos.pas',
  uFrmAtualizarDB in 'datamodule\uFrmAtualizarDB.pas' {frmAtualizarDB},
  uDtmVenda in 'datamodule\uDtmVenda.pas' {dtmVenda: TDataModule},
  uVendas in 'forms\uVendas.pas' {frmVendas},
  cVendas in 'classes\cVendas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmInicial, frmInicial);
  Application.CreateForm(TfrmAtualizarDB, frmAtualizarDB);
  Application.CreateForm(TdtmVenda, dtmVenda);
  Application.CreateForm(TfrmVendas, frmVendas);
  Application.Run;
end.
