unit fCadastroVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  fPesquisarProdutos, fPesquisarCliente, fCadastroProduto, uDmDados;

type
  TfrmCadastroVenda = class(TfrmCadastroPai)
    FDQueryCadastroNRNOTA: TIntegerField;
    FDQueryCadastroEMISSAO: TDateField;
    FDQueryCadastroCLIENTE: TIntegerField;
    FDQueryCadastroTIPO_VENDA: TWideStringField;
    FDQueryCadastroVALOR_VENDA: TBCDField;
    FDQueryCadastroOPERACAO_VENDA: TWideStringField;
    PanelCabecalhoVenda: TPanel;
    LabelNrNota: TLabel;
    DBEditNrNota: TDBEdit;
    LabelEmissao: TLabel;
    LabelCliente: TLabel;
    DBEditCodCLiente: TDBEdit;
    LabelTipoVenda: TLabel;
    LabelOpVenda: TLabel;
    PanelProdutos: TPanel;
    DBGridProdutos: TDBGrid;
    ButtonCliente: TButton;
    DBComboBoxTipoVenda: TDBComboBox;
    DBComboBoxOpVenda: TDBComboBox;
    DBEditEmissao: TDBEdit;
    FDQueryProduto: TFDQuery;
    procedure ButtonClienteClick(Sender: TObject);
    procedure GeraNumeroVenda;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure FDQueryCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroVenda: TfrmCadastroVenda;

implementation

{$R *.dfm}

procedure TfrmCadastroVenda.BitBtnNovoClick(Sender: TObject);
begin
  inherited;

  //  Cria o numero da venda
  GeraNumeroVenda;

  FDQueryCadastroEMISSAO.AsDateTime := Date;

end;

procedure TfrmCadastroVenda.ButtonClienteClick(Sender: TObject);
begin
  inherited;

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

procedure TfrmCadastroVenda.FDQueryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;

  //  Se for venda ira baixar o estoque e
  //  adicionar data da ultima venda no produto
  if FDQueryCadastroOPERACAO_VENDA.Value = 'V' then
  begin

    //FDQueryProduto.

  end;

  //  Se for pre venda ira baixar somente estoque
  if FDQueryCadastroOPERACAO_VENDA.Value = 'P' then
  begin


  end;


end;

procedure TfrmCadastroVenda.GeraNumeroVenda;
var
  cod: integer;

begin

  cod := 0;

  //  Abre a query
  FDQueryCadastro.Open();

  //  Ve o ultimo registro
  FDQueryCadastro.Last();

  //  Pega o último código gerado e soma + 1
  cod := FDQueryCadastro.FieldByName('NRNOTA').AsInteger + 1;

  //  Insere o registro no final da tabela
  FDQueryCadastro.Append();

  //  Seta no edit o codigo gerado
  DBEditNrNota.Text := IntToStr(cod);

  //  Posiciona o cursor
  DBEditCodCLiente.SetFocus;

end;

end.
