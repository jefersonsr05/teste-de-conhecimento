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
  fCadastroDefault in 'formularios\Default\fCadastroDefault.pas' {fmrCadastroDefault},
  fConsultaDefault in 'formularios\Default\fConsultaDefault.pas' {frmConsultaDefault},
  fAlteraVenda in 'formularios\fAlteraVenda.pas' {frmAlteraVenda},
  fAlteraVendaItem in 'formularios\fAlteraVendaItem.pas' {frmAlteraVendaItem},
  fCadastroCliente in 'formularios\fCadastroCliente.pas' {frmCadastroCliente},
  fCadastroFPagamento in 'formularios\fCadastroFPagamento.pas' {frmCadastroFPagamento},
  fCadastroItem in 'formularios\fCadastroItem.pas' {frrCadastroItem},
  fCadastroItems in 'formularios\fCadastroItems.pas' {frmCadastroItems},
  fCadastroProduto in 'formularios\fCadastroProduto.pas' {frmCadastroProduto},
  fCadastroUnidade in 'formularios\fCadastroUnidade.pas' {frmCadastroUnidade},
  fCadastroUsuario in 'formularios\fCadastroUsuario.pas' {frmCadastroUsuario},
  fCadastroVenda in 'formularios\fCadastroVenda.pas' {frmCadastroVenda},
  fCadastroVendedor in 'formularios\fCadastroVendedor.pas' {frmCadastroVendedor},
  fConfig in 'formularios\fConfig.pas' {frmConfig},
  fConsultaCliente in 'formularios\fConsultaCliente.pas' {frmConsultaCliente},
  fConsultaFPagamento in 'formularios\fConsultaFPagamento.pas' {frmConsultaFPagamento},
  fConsultaProduto in 'formularios\fConsultaProduto.pas' {frmConsultaProduto},
  fConsultaUnidade in 'formularios\fConsultaUnidade.pas' {frmConsultaUnidade},
  fConsultaUsuario in 'formularios\fConsultaUsuario.pas' {frmConsultaUsuario},
  fConsultaVenda in 'formularios\fConsultaVenda.pas' {frmConsultaVenda},
  fConsultaVendedor in 'formularios\fConsultaVendedor.pas' {frmConsultaVendedor},
  fLogin in 'formularios\fLogin.pas' {frmLogin},
  fPrincipal in 'formularios\fPrincipal.pas' {frmPrincipal},
  fRotinaPagamento in 'formularios\fRotinaPagamento.pas' {frmRotinaPagamento},
  fVendas in 'formularios\fVendas.pas' {frmVendas},
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
  fRelatorioVendedor in 'relatorios\fRelatorioVendedor.pas' {frmRelatorioVendedor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
