unit uInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDtmConexao, Enter;

type
  TfrmInicial = class(TForm)
    menuInicial: TMainMenu;
    CLIENTE1: TMenuItem;
    VENDAS1: TMenuItem;
    opClientes: TMenuItem;
    N1: TMenuItem;
    opProdutos: TMenuItem;
    RELATRIOS1: TMenuItem;
    opSair: TMenuItem;
    Vendas2: TMenuItem;
    N2: TMenuItem;
    Prvenda1: TMenuItem;
    N3: TMenuItem;
    Oramento1: TMenuItem;
    Vendas3: TMenuItem;
    Prvendas1: TMenuItem;
    Oramentos1: TMenuItem;
    N4: TMenuItem;
    Produtos1: TMenuItem;
    Clientes1: TMenuItem;
    procedure opSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure opClientesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure opProdutosClick(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
  public
    { Public declarations }
  end;

var
  frmInicial: TfrmInicial;

implementation

{$R *.dfm}

uses uCadClientes, uCadProduto;

procedure TfrmInicial.opClientesClick(Sender: TObject);
begin
  frmCadClientes:=TfrmCadClientes.Create(Self);
  frmCadClientes.ShowModal;
  frmCadClientes.Release;
end;

procedure TfrmInicial.opProdutosClick(Sender: TObject);
begin
  frmCadProdutos:=TfrmCadProdutos.Create(self);
  frmCadProdutos.ShowModal;
  frmCadProdutos.Release;
end;

procedure TfrmInicial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmConexao);
end;

procedure TfrmInicial.FormCreate(Sender: TObject);
begin

  dtmConexao := TdtmConexao.Create(Self);
  with dtmConexao.ConexaoDB do
  begin
    SQLHourGlass := true;
    Protocol:='firebirdd-2.5';
    HostName:='localhost';
    Port:=3050;
    User:='SYSDBA';
    Password:='masterkey';
    Database:='S:\Delphi_Projects\DesafioMC\BANCO\MC_TESTE.FDB';
    Connected := true;
  end;

  TeclaEnter:=TMREnter.Create(Self);
  TeclaEnter.FocusEnabled:=true;
  TeclaEnter.FocusColor:=clInfoBk;
end;

procedure TfrmInicial.opSairClick(Sender: TObject);
begin
  Close;
end;

end.
