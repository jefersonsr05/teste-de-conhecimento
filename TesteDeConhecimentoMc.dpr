program TesteDeConhecimentoMc;

uses
  Vcl.Forms,
  uClasDefault in 'classes\uClasDefault.pas',
  uCliente in 'classes\uCliente.pas',
  uConfig in 'classes\uConfig.pas',
  uFPagamento in 'classes\uFPagamento.pas',
  uHelpersImagensBase64 in 'classes\uHelpersImagensBase64.pas',
  uHelpersRLImagensBase64 in 'classes\uHelpersRLImagensBase64.pas',
  uImagem in 'classes\uImagem.pas',
  uItem in 'classes\uItem.pas',
  uProduto in 'classes\uProduto.pas',
  uUnidade in 'classes\uUnidade.pas',
  uUsuario in 'classes\uUsuario.pas',
  uVenda in 'classes\uVenda.pas',
  uVendas in 'classes\uVendas.pas',
  uVendedor in 'classes\uVendedor.pas',
  dConexao in 'dataModule\dConexao.pas' {dtmConexao: TDataModule},
  fFiltroDefault in 'relatorios\fFiltroDefault.pas' {frmFiltroDefault},
  fRelatorioDefault in 'relatorios\fRelatorioDefault.pas' {frmRelatorioDefault},
  fFiltroCliente in 'relatorios\fFiltroCliente.pas' {frmFiltroCliente},
  fFiltroFPagamento in 'relatorios\fFiltroFPagamento.pas' {frmFiltroFPagamento},
  fFiltroProduto in 'relatorios\fFiltroProduto.pas' {frmFiltroProduto},
  fFiltroUnidade in 'relatorios\fFiltroUnidade.pas' {frmFiltroUnidade},
  fFiltroUsuario in 'relatorios\fFiltroUsuario.pas' {frmFiltroUsuario},
  fFiltroVenda in 'relatorios\fFiltroVenda.pas' {frmFiltroVenda},
  fFiltroVendedor in 'relatorios\fFiltroVendedor.pas' {frmFiltroVendedor},
  fRelatorioCliente in 'relatorios\fRelatorioCliente.pas' {frmRelatorioCliente},
  fRelatorioFPagamento in 'relatorios\fRelatorioFPagamento.pas' {frmRelatorioFPagamento},
  fRelatorioProduto in 'relatorios\fRelatorioProduto.pas' {frmRelatorioProduto},
  fRelatorioUnidade in 'relatorios\fRelatorioUnidade.pas' {frmRelatorioUnidade},
  fRelatorioUsuario in 'relatorios\fRelatorioUsuario.pas' {frmRelatorioUsuario},
  fRelatorioVenda in 'relatorios\fRelatorioVenda.pas' {frmRelatorioVenda},
  fRelatorioVendedor in 'relatorios\fRelatorioVendedor.pas' {frmRelatorioVendedor},
  fPrincipal in 'formularios\fPrincipal.pas' {frmPrincipal},
  fCadastroCliente in 'formularios\fCadastroCliente.pas' {frmCadastroCliente},
  fConsultaCliente in 'formularios\fConsultaCliente.pas' {frmConsultaCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.CreateForm(TfrmConsultaCliente, frmConsultaCliente);
  Application.Run;
end.
