program TesteConhecimento;

uses
  Vcl.Forms,
  fCliente in 'Formularios\fCliente.pas' {frmCliente},
  fProduto in 'Formularios\fProduto.pas' {frmProduto},
  dConexao in 'DataModules\dConexao.pas' {dtmConexao: TDataModule},
  fPrincipal in 'Formularios\fPrincipal.pas' {frmPrincipal},
  fVenda in 'Formularios\fVenda.pas' {frmVenda},
  fConsultaVenda in 'Formularios\fConsultaVenda.pas' {frmConsultaVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.Run;

end.
