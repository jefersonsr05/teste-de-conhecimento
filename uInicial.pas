unit uInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDtmConexao, Enter, IniFiles,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Buttons;

type
  TfrmInicial = class(TForm)
    menuInicial: TMainMenu;
    CLIENTE1: TMenuItem;
    VENDAS1: TMenuItem;
    opClientes: TMenuItem;
    N1: TMenuItem;
    opProdutos: TMenuItem;
    opSair: TMenuItem;
    opVendas: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlConexao: TPanel;
    lblConexao: TLabel;
    lblHostname: TLabel;
    lblPorta: TLabel;
    lblDB: TLabel;
    Panel3: TPanel;
    imgClientes: TImage;
    imgProduto: TImage;
    imgVenda: TImage;
    imgSair: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    procedure opSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure opClientesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure opProdutosClick(Sender: TObject);
    procedure opVendasClick(Sender: TObject);
    procedure imgClientesClick(Sender: TObject);
    procedure imgProdutoClick(Sender: TObject);
    procedure imgVendaClick(Sender: TObject);
    procedure imgSairClick(Sender: TObject);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
    ArquivoINI: TIniFile;
  public
    { Public declarations }
  end;

var
  frmInicial: TfrmInicial;

implementation

{$R *.dfm}

uses uCadClientes, uCadProduto, uVendas;

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
var
  dir : string;
  path : string;
begin
  dtmConexao := TdtmConexao.Create(Self);
  with dtmConexao.ConexaoDB do
  begin

     // Leitura INI com path do banco

    path := (ExtractFileDir(ExtractFileDir(ExtractFileDir(ParamStr(0)))));
    ArquivoINI := TIniFile.Create(path+'\CONEXAODB.ini');
    dir := ArquivoINI.ReadString('CONEXAO','DIR','');
    //ShowMessage('BANCO DE DADOS EM : ' + dir);
    ArquivoINI.Free;

    SQLHourGlass := true;
    Protocol:='firebirdd-2.5';
    HostName:='localhost';
    Port:=3050;
    User:='SYSDBA';
    Password:='masterkey';
    Database:=dir;
    Connected := true;

    lblHostname.Caption := 'HostName:' + HostName;
    lblPorta.Caption := 'Porta: ' + IntToStr(Port);
    lblDB.Caption := 'Database: ' + dir;

    if dtmConexao.ConexaoDB.Connected then
    begin
      lblConexao.Caption := 'Conectado ao banco de dados';
      lblConexao.font.color := clGreen;
    end
    else
    begin
      lblConexao.Caption := 'Erro na conexão!!!';
      lblConexao.font.color := clRed;
    end;


  end;

  TeclaEnter:=TMREnter.Create(Self);
  TeclaEnter.FocusEnabled:=true;
  TeclaEnter.FocusColor:=clInfoBk;
end;

procedure TfrmInicial.imgClientesClick(Sender: TObject);
begin
  opClientes.Click;
end;

procedure TfrmInicial.imgProdutoClick(Sender: TObject);
begin
  opProdutos.Click;
end;

procedure TfrmInicial.imgSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInicial.imgVendaClick(Sender: TObject);
begin
  opVendas.Click;
end;

procedure TfrmInicial.opSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInicial.opVendasClick(Sender: TObject);
begin
  frmVendas:=TfrmVendas.Create(self);
  frmVendas.showModal;
  frmVendas.Release;
end;

end.
