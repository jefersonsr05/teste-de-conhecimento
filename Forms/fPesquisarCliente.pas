unit fPesquisarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fPesquisarPai, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, fCadastroCliente;

type
  TfrmPesquisarClientes = class(TfrmPesquisarPai)
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonPesquisaClick(Sender: TObject);
  private
    { Private declarations }

    procedure Pesquisar;

  public
    { Public declarations }
  end;

var
  frmPesquisarClientes: TfrmPesquisarClientes;

implementation

{$R *.dfm}

procedure TfrmPesquisarClientes.ButtonNovoClick(Sender: TObject);
begin
  inherited;

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

procedure TfrmPesquisarClientes.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;

  //  Chama a procedure de pesquisas
  Pesquisar;

end;

procedure TfrmPesquisarClientes.Pesquisar;
begin

   // Fechando a Query
   FDQueryPesquisar.Close;

   // Limpando o sql da query
   FDQueryPesquisar.SQL.Clear;

   // Adicionando o sql inicial
   FDQueryPesquisar.SQL.Add('select * from cliente where 1 = 1');

  //  Pesquisa por nome
   //  Funcao trim remove os espaços no inicio e fim do texto
  if Trim(EditNome.Text) <> '' then
  begin

    //  Incrementando o sql
    //  Funcao upper converte a string em letras maiusculas
    //  Funcao QuotedStr trata o texto e o coloca dentr aspas simples
    FDQueryPesquisar.SQL.Add('and upper(trim(nome)) like ' + QuotedStr('%' + UpperCase(Trim(EditNome.Text)) + '%' ));




  end;

  FDQueryPesquisar.Open();
  FDQueryPesquisar.FetchAll;

end;

end.
