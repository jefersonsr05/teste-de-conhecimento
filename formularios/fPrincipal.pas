unit fPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  FireDAC.Comp.Client,
  fConsultaCliente,
//  fConsultaProduto,
//  fConsultaFPagamento,
//  fConsultaVendedor,
  Vcl.Buttons,
//  fConsultaVenda,
  fFiltroUsuario,
  fRelatorioUsuario,
  fFiltroCliente,
  fFiltroVendedor,
  fFiltroProduto,
  fRelatorioUnidade,
  fRelatorioFPagamento,
  uConfig;
//  fConsultaDefault;

type
  TfrmPrincipal = class(TForm)
    pnlTitulo: TPanel;
    pnlCentral: TPanel;
    pnlRodape: TPanel;
    mnuPrincipal: TMainMenu;
    Connsulta1: TMenuItem;
    mnuCliente: TMenuItem;
    Relatrios1: TMenuItem;
    mnuProduto: TMenuItem;
    mnuFPagamento: TMenuItem;
    mnuVendas: TMenuItem;
    mnuClienteRelat: TMenuItem;
    mnuProdutoRelat: TMenuItem;
    mnuFPagamentoRelat: TMenuItem;
    mnuVendaRelat: TMenuItem;
    procedure mnuClienteClick(Sender: TObject);
    procedure mnuProdutoClick(Sender: TObject);
    procedure mnuFPagamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuVendasClick(Sender: TObject);
    procedure mnuClienteRelatClick(Sender: TObject);
    procedure mnuProdutoRelatClick(Sender: TObject);
    procedure mnuFPagamentoRelatClick(Sender: TObject);
    procedure mnuVendaRelatClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.mnuClienteClick(Sender: TObject);
var
  lFormulario: TFrmConsultaCliente;
begin
  lFormulario := TFrmConsultaCliente.Create(nil);
  try
    lFormulario.ShowModal;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmPrincipal.mnuFPagamentoClick(Sender: TObject);
//var
//  lFormulario: TfrmConsultaFPagamento;
begin
//  lFormulario := TfrmConsultaFPagamento.Create(nil);
//  try
//    lFormulario.ShowModal;
//  finally
//    lFormulario.Free;
//  end;
end;

procedure TfrmPrincipal.mnuVendasClick(Sender: TObject);
//var
//  lFormulario: TfrmConsultaVenda;
begin
//  lFormulario := TfrmConsultaVenda.Create(nil);
//  try
//    lFormulario.ShowModal;
//  finally
//    lFormulario.Free;
//  end;
end;

procedure TfrmPrincipal.mnuProdutoClick(Sender: TObject);
//var
//  lFormulario: TfrmConsultaProduto;
begin
//  lFormulario := TfrmConsultaProduto.Create(nil);
//  try
//    lFormulario.ShowModal;
//  finally
//    lFormulario.Free;
//  end;
end;

procedure TfrmPrincipal.mnuClienteRelatClick(Sender: TObject);
var
  lFormulario: TfrmFiltroCliente;
begin
  lFormulario := TfrmFiltroCliente.Create(nil);
  try
    lFormulario.ShowModal;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmPrincipal.mnuProdutoRelatClick(Sender: TObject);
var
  lFormulario: TfrmFiltroProduto;
begin
  lFormulario := TfrmFiltroProduto.Create(nil);
  try
    lFormulario.ShowModal;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmPrincipal.mnuFPagamentoRelatClick(Sender: TObject);
var
  lRelatorio: TfrmRelatorioFPagamento;
begin
  lRelatorio := TfrmRelatorioFPagamento.Create(nil);
  try
    lRelatorio.DataSource1.DataSet := lRelatorio.qryRelatorio;
    lRelatorio.rlpRelatorio.datasource := lRelatorio.DataSource1;

    lRelatorio.qryRelatorio.close;
    lRelatorio.qryRelatorio.SQL.clear;
    lRelatorio.qryRelatorio.SQL.Add('SELECT * FROM FORMAPAGAMENTO');

    lRelatorio.qryRelatorio.Open;

    lRelatorio.rlpRelatorio.preview;
  finally
    lRelatorio.Free;
  end;
end;

procedure TfrmPrincipal.mnuVendaRelatClick(Sender: TObject);
//var
//  lFormulario: TfrmConsultaVenda;
begin
//  lFormulario := TfrmConsultaVenda.Create(nil);
//  try
//
//    lFormulario.btnIncluir.visible := false;
//    lFormulario.btnAlterar.visible := false;
//    lFormulario.btnExcluir.visible := false;
//    lFormulario.btnVisualizar.visible := false;
//    lFormulario.btnAtualizar.visible := false;
//    lFormulario.btnRelat.Caption := 'Selecionar';
//    lFormulario.btnSair.Caption := 'Cancelar';
//    lFormulario.btnRelat.SetFocus;
//    lFormulario.ShowModal;
//  finally
//    lFormulario.Free;
//  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
