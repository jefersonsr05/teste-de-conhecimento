program prjSistemaVendas;

uses
  Vcl.Forms,
  fMain in 'Forms\fMain.pas' {frmMain},
  uDmDados in 'Forms\uDmDados.pas' {dmDados: TDataModule},
  uBiblioteca in 'Classes\uBiblioteca.pas',
  fConfigBanco in 'Forms\fConfigBanco.pas' {frmConfigBanco},
  fCadastroPai in 'Forms\fCadastroPai.pas' {frmCadastroPai},
  fCadastroCliente in 'Forms\fCadastroCliente.pas' {frmCadastroCliente},
  fCadastroProduto in 'Forms\fCadastroProduto.pas' {frmCadastroProdutos},
  fPesquisarPai in 'Forms\fPesquisarPai.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmConfigBanco, frmConfigBanco);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmCadastroProdutos, frmCadastroProdutos);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
