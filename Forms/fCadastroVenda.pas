unit fCadastroVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  fPesquisarProdutos, fPesquisarCliente, fCadastroProduto, uDmDados, uBiblioteca;

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
    ButtonCliente: TButton;
    DBComboBoxTipoVenda: TDBComboBox;
    DBComboBoxOpVenda: TDBComboBox;
    DBEditEmissao: TDBEdit;
    FDQueryProduto: TFDQuery;
    DataSourceItemNota: TDataSource;
    FDQueryItemNota: TFDQuery;
    PanelItems: TPanel;
    FDQueryItemNotaLCTO: TIntegerField;
    FDQueryItemNotaNR_VENDA: TIntegerField;
    FDQueryItemNotaPRODUTO: TIntegerField;
    FDQueryItemNotaQTDE: TBCDField;
    FDQueryItemNotaVALOR_UNIT: TBCDField;
    FDQueryItemNotaVALOR_TOTAL: TBCDField;
    LabelProduto: TLabel;
    DBEditProduto: TDBEdit;
    LabelQtde: TLabel;
    DBEditQtde: TDBEdit;
    LabelValorUnit: TLabel;
    DBEditValorUnit: TDBEdit;
    LabelValorTotalVenda: TLabel;
    DBEditValorTotalVenda: TDBEdit;
    ButtonProduto: TButton;
    LabelLcto: TLabel;
    DBEditLcto: TDBEdit;
    ButtonAdicionar: TButton;
    ButtonExcluir: TButton;
    DBGridItensVenda: TDBGrid;
    FDQueryItemNotaDescricaoProduto: TStringField;
    procedure ButtonClienteClick(Sender: TObject);
    procedure GeraNumeroVenda;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure FDQueryCadastroBeforePost(DataSet: TDataSet);
    procedure ButtonProdutoClick(Sender: TObject);
    procedure GeraNumeroLcto;
    procedure FormCreate(Sender: TObject);
    procedure FDQueryItemNotaAfterInsert(DataSet: TDataSet);
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

procedure TfrmCadastroVenda.ButtonProdutoClick(Sender: TObject);
begin
  inherited;

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

procedure TfrmCadastroVenda.FDQueryItemNotaAfterInsert(DataSet: TDataSet);
begin
  inherited;

  //  Pega o numero da venda
  FDQueryItemNotaNR_VENDA.AsInteger := FDQueryCadastroNRNOTA.AsInteger;

end;

procedure TfrmCadastroVenda.FormCreate(Sender: TObject);
begin
  inherited;

  AtualizaFDQuery(FDQueryProduto);

end;

procedure TfrmCadastroVenda.GeraNumeroLcto;
var
  cod: integer;

begin

  cod := 0;

  //  Abre a query
  FDQueryCadastro.Open();

  //  Ve o ultimo registro
  FDQueryCadastro.Last();

  //  Pega o último código gerado e soma + 1
  cod := FDQueryCadastro.FieldByName('LCTO').AsInteger + 1;

  //  Insere o registro no final da tabela
  FDQueryCadastro.Append();

  //  Seta no edit o codigo gerado
  DBEditLcto.Text := IntToStr(cod);

  //  Posiciona o cursor
  DBEditProduto.SetFocus;

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
