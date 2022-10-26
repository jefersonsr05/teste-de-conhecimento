unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    mnuPrincipal: TMainMenu;
    mnuProduto: TMenuItem;
    Cadastrar1: TMenuItem;
    mnuClienteCadastrar: TMenuItem;
    mnuProdutoCadastrar: TMenuItem;
    mnuProdutoConsultar: TMenuItem;
    mnuClienteConsultar: TMenuItem;
    mnuVendaCadastrar: TMenuItem;
    Cadastrar2: TMenuItem;
    mnuVendaConsultar: TMenuItem;
    Relatorios1: TMenuItem;
    Clientes1: TMenuItem;
    Sair: TMenuItem;
    procedure imgSairClick(Sender: TObject);
    procedure mnuProdutoCadastrarClick(Sender: TObject);
    procedure mnuProdutoConsultarClick(Sender: TObject);
    procedure mnuClienteConsultarClick(Sender: TObject);
    procedure mnuClienteCadastrarClick(Sender: TObject);
    procedure imgClienteClick(Sender: TObject);
    procedure imgProdutosClick(Sender: TObject);
    procedure mnuVendaConsultarClick(Sender: TObject);
    procedure imgConsultaVendaClick(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure Cadastrar2Click(Sender: TObject);
  private
    { Private declarations }

    procedure TelaProduto(pTipoOperacao: string);
    procedure TelaCliente(pTipoOperacao: string);
    procedure TelaVenda(pTipoOperacao: string);
    procedure TelaConsultaVenda(pTipoOperacao: string);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses dConexao, fCliente, fProduto, fVenda, fConsultaVenda, fRelatorioCliente;

procedure TfrmPrincipal.Cadastrar2Click(Sender: TObject);
begin
  TelaVenda('Incluir');
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
var
  Caminho: String;
begin
  Caminho :=
    'C:\Users\Vinicius\Documents\ProjetosDelphi\TesteConhecimento\Relatorios\RelatorioCliente.fr3';
  frmRelatorioCliente.frxReport.LoadFromFile(Caminho);
  frmRelatorioCliente.frxReport.ShowReport();
end;

procedure TfrmPrincipal.imgClienteClick(Sender: TObject);
begin
  TelaCliente('Consultar');
end;

procedure TfrmPrincipal.imgConsultaVendaClick(Sender: TObject);
begin
  TelaConsultaVenda('Consultar');
end;

procedure TfrmPrincipal.imgProdutosClick(Sender: TObject);
begin
  TelaProduto('Consultar');
end;

procedure TfrmPrincipal.imgSairClick(Sender: TObject);
begin
  Application.Terminate; // fecha tela
end;

procedure TfrmPrincipal.mnuClienteCadastrarClick(Sender: TObject);
begin
  TelaCliente('Incluir')
end;

procedure TfrmPrincipal.mnuClienteConsultarClick(Sender: TObject);
begin
  TelaCliente('Consultar');
end;

procedure TfrmPrincipal.mnuProdutoCadastrarClick(Sender: TObject);
begin
  TelaProduto('Incluir');
end;

procedure TfrmPrincipal.mnuProdutoConsultarClick(Sender: TObject);
begin
  TelaProduto('Consultar');
end;

procedure TfrmPrincipal.mnuVendaConsultarClick(Sender: TObject);
begin
  TelaConsultaVenda('Consultar');
end;

procedure TfrmPrincipal.SairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPrincipal.TelaProduto(pTipoOperacao: string);
var
  lFormulario: TfrmProduto;
begin
  lFormulario := TfrmProduto.Create(nil);
  try
    lFormulario.TipoOperacao := pTipoOperacao;
    lFormulario.ShowModal;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmPrincipal.TelaVenda(pTipoOperacao: string);
var
  lFormulario: TfrmVenda;
begin
  lFormulario := TfrmVenda.Create(nil);
  try
    lFormulario.ShowModal;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmPrincipal.TelaCliente(pTipoOperacao: string);
var
  lFormulario: TfrmCliente;
begin
  lFormulario := TfrmCliente.Create(nil);
  try
    lFormulario.TipoOperacao := pTipoOperacao;
    lFormulario.ShowModal;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmPrincipal.TelaConsultaVenda(pTipoOperacao: string);
var
  lFormulario: TfrmConsultaVenda;
begin
  lFormulario := TfrmConsultaVenda.Create(nil);
  try
    lFormulario.ShowModal;
  finally
    lFormulario.Free;
  end;
end;

end.
