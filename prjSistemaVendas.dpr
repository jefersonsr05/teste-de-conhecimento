program prjSistemaVendas;

uses
  Vcl.Forms,
  fMain in 'Forms\fMain.pas' {frmMain},
  uDmDados in 'Forms\uDmDados.pas' {dmDados: TDataModule},
  uBiblioteca in 'Classes\uBiblioteca.pas',
  fConfigBanco in 'Forms\fConfigBanco.pas' {frmConfigBanco};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmConfigBanco, frmConfigBanco);
  Application.Run;
end.
