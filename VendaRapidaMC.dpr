program VendaRapidaMC;

uses
  Vcl.Forms,
  uInicial in '..\DesafioMC\uInicial.pas' {frmInicial},
  uDtmConexao in '..\DesafioMC\uDtmConexao.pas' {dtmConexao: TDataModule},
  uTelaHeranca in '..\DesafioMC\forms\uTelaHeranca.pas' {frmTelaHeranca},
  uCadClientes in '..\DesafioMC\forms\uCadClientes.pas' {frmCadClientes},
  Enter in '..\DesafioMC\terceiros\Enter.pas',
  uEnum in '..\DesafioMC\forms\uEnum.pas',
  cCadClientes in '..\DesafioMC\classes\cCadClientes.pas',
  uCadProduto in '..\DesafioMC\forms\uCadProduto.pas' {frmCadProdutos},
  cCadProdutos in '..\DesafioMC\classes\cCadProdutos.pas',
  uDtmVenda in '..\DesafioMC\datamodule\uDtmVenda.pas' {dtmVenda: TDataModule},
  uVendas in '..\DesafioMC\forms\uVendas.pas' {frmVendas},
  cVendas in '..\DesafioMC\classes\cVendas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmInicial, frmInicial);
  Application.Run;
end.
