program TesteDeConhecimentoMc;

uses
  Vcl.Forms,
  uClasDefault in 'classes\uClasDefault.pas',
  uCliente in 'classes\uCliente.pas',
  uItem in 'classes\uItem.pas',
  uProduto in 'classes\uProduto.pas',
  uVenda in 'classes\uVenda.pas',
  dConexao in 'dataModule\dConexao.pas' {dtmConexao: TDataModule},
  fFiltroDefault in 'relatorios\fFiltroDefault.pas' {frmFiltroDefault},
  fRelatorioDefault in 'relatorios\fRelatorioDefault.pas' {frmRelatorioDefault},
  fFiltroCliente in 'relatorios\fFiltroCliente.pas' {frmFiltroCliente},
  fFiltroProduto in 'relatorios\fFiltroProduto.pas' {frmFiltroProduto},
  fRelatorioCliente in 'relatorios\fRelatorioCliente.pas' {frmRelatorioCliente},
  fRelatorioProduto in 'relatorios\fRelatorioProduto.pas' {frmRelatorioProduto},
  fPrincipal in 'formularios\fPrincipal.pas' {frmPrincipal},
  fCadastroCliente in 'formularios\fCadastroCliente.pas' {frmCadastroCliente},
  fConsultaCliente in 'formularios\fConsultaCliente.pas' {frmConsultaCliente},
  fConsultaProduto in 'formularios\fConsultaProduto.pas' {frmConsultaProduto},
  fCadastroProduto in 'formularios\fCadastroProduto.pas' {frmCadastroProduto},
  fAlteraVenda in 'formularios\fAlteraVenda.pas' {frmAlteraVenda},
  fAlteraVendaItem in 'formularios\fAlteraVendaItem.pas' {frmAlteraVendaItem},
  fRotinaPagamento in 'formularios\fRotinaPagamento.pas' {frmRotinaPagamento},
  fVendas in 'formularios\fVendas.pas' {frmVendas},
  fConsultaVenda in 'formularios\fConsultaVenda.pas' {frmConsultaVenda},
  fFiltroVenda in 'relatorios\fFiltroVenda.pas' {frmFiltroVenda},
  fRelatorioVenda in 'relatorios\fRelatorioVenda.pas' {frmRelatorioVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
