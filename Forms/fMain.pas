unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, fCadastroCliente,
  fCadastroProduto, fPesquisarCliente, fPesquisarProdutos;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    N1: TMenuItem;
    Produtos1: TMenuItem;
    Vendas1: TMenuItem;
    Pesquisar1: TMenuItem;
    Clientes2: TMenuItem;
    N2: TMenuItem;
    Podutos1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Podutos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Clientes1Click(Sender: TObject);
begin

  //  Cria o form
  frmCadastroCliente := TfrmCadastroCliente.Create(Self);

  try

    //  Exibe o form
    frmCadastroCliente.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmCadastroCliente);

  end;


end;

procedure TfrmMain.Clientes2Click(Sender: TObject);
begin

  //  Cria o Form
  frmPesquisarClientes := TfrmPesquisarClientes.Create(Self);

  try


    //  Exibe o Form
    frmPesquisarClientes.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmPesquisarClientes);

  end;

end;

procedure TfrmMain.Podutos1Click(Sender: TObject);
begin

  // Cria o form
  frmPesquisarProdutos := TfrmPesquisarProdutos.Create(Self);

  try

    //  Exibe o form
    frmPesquisarProdutos.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmPesquisarProdutos);

  end;

end;

procedure TfrmMain.Produtos1Click(Sender: TObject);
begin

  //  Cria o Form
  frmCadastroProdutos := TfrmCadastroProdutos.Create(Self);

  try

    //  Exibe o Form
    frmCadastroProdutos.ShowModal;

  finally

    //  Libera da memoria
    FreeAndNil(frmCadastroProdutos);

  end;

end;

end.
