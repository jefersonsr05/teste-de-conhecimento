unit fPesquisarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fPesquisarPai, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPesquisarVenda = class(TfrmPesquisarPai)
    FDQueryPesquisarNRNOTA: TIntegerField;
    FDQueryPesquisarEMISSAO: TDateField;
    FDQueryPesquisarCLIENTE: TIntegerField;
    FDQueryPesquisarTIPO_VENDA: TWideStringField;
    FDQueryPesquisarVALOR_VENDA: TBCDField;
    FDQueryPesquisarOPERACAO_VENDA: TWideStringField;
    procedure ButtonPesquisaClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisa;

  public
    { Public declarations }
  end;

var
  frmPesquisarVenda: TfrmPesquisarVenda;

implementation

{$R *.dfm}

{ TfrmPesquisarVenda }

procedure TfrmPesquisarVenda.ButtonPesquisaClick(Sender: TObject);
begin
  inherited;

  Pesquisa;

end;

procedure TfrmPesquisarVenda.Pesquisa;
begin

    // Fechando a Query
   FDQueryPesquisar.Close;

   // Limpando o sql da query
   FDQueryPesquisar.SQL.Clear;

   // Adicionando o sql inicial
   FDQueryPesquisar.SQL.Add('select * from venda where 1 = 1');


  // Pesquisa por codigo
  if StrToIntDef(EditCodigo.Text, 0) > 0 then
  begin

    FDQueryPesquisar.SQL.Add('and nrnota = ' + EditCodigo.Text);

  end;

  //  Ordena o resultado pelo nome
  if RadioButtonNome.Checked = True then
  begin

    FDQueryPesquisar.SQL.Add(' order by cliente');

  end;

  //  Ordena o resultado por código
  if RadioButtonCodigo.Checked = True then
  begin

    FDQueryPesquisar.SQL.Add('order by nrnota');

  end;


  FDQueryPesquisar.Open();
  FDQueryPesquisar.FetchAll;
end;

end.
