unit fCadastroVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  fPesquisarProdutos, fPesquisarCliente, fCadastroProduto, uDmDados, uBiblioteca,
  RxToolEdit, RxCurrEdit;

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
    LabelQtde: TLabel;
    LabelValorUnit: TLabel;
    LabelValorTotalVenda: TLabel;
    ButtonProduto: TButton;
    LabelLcto: TLabel;
    ButtonAdicionar: TButton;
    ButtonExcluir: TButton;
    DBGridItensVenda: TDBGrid;
    FDTransactionItemNota: TFDTransaction;
    EditProduto: TEdit;
    EditQtd: TEdit;
    EditValorUnit: TEdit;
    EditValorTotal: TEdit;
    FDQueryItemNotaDescProduto: TStringField;
    EditLcto: TEdit;
    FDQueryProdutoCODIGO: TIntegerField;
    FDQueryProdutoDESCRICAO: TWideStringField;
    FDQueryProdutoREFERENCIA: TWideStringField;
    FDQueryProdutoUNIDADE: TWideStringField;
    FDQueryProdutoDATA_VENDA: TDateField;
    FDQueryProdutoPRECO_VENDA: TBCDField;
    FDQueryProdutoSALDO: TBCDField;
    FDQuery1: TFDQuery;
    procedure ButtonClienteClick(Sender: TObject);
    procedure GeraNumeroVenda;
    procedure BitBtnNovoClick(Sender: TObject);
    procedure FDQueryCadastroBeforePost(DataSet: TDataSet);
    procedure ButtonProdutoClick(Sender: TObject);
    procedure GeraNumeroLcto;
    procedure FormCreate(Sender: TObject);
    procedure ButtonAdicionarClick(Sender: TObject);
    procedure FDQueryCadastroAfterOpen(DataSet: TDataSet);
    procedure FDQueryCadastroAfterScroll(DataSet: TDataSet);
    procedure FDQueryItemNotaAfterPost(DataSet: TDataSet);
    procedure FDQueryItemNotaAfterDelete(DataSet: TDataSet);
    procedure FDQueryItemNotaAfterCancel(DataSet: TDataSet);
    procedure EditProdutoExit(Sender: TObject);
  private
    { Private declarations }
    procedure GravarItem;
    procedure SetItens(pIdVenda: integer);

//    procedure SetDadosProdutos();

  public
    { Public declarations }
  end;

var
  frmCadastroVenda: TfrmCadastroVenda;
  nr_nota: integer;

implementation

{$R *.dfm}

procedure TfrmCadastroVenda.BitBtnNovoClick(Sender: TObject);
begin
  inherited;

  //  Cria o numero da venda
  GeraNumeroVenda;

  FDQueryCadastroEMISSAO.AsDateTime := Date;

  FDTransactionItemNota.StartTransaction;

  FDQueryItemNota.Open();

end;

procedure TfrmCadastroVenda.ButtonAdicionarClick(Sender: TObject);
begin
  inherited;


  GravarItem;


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

procedure TfrmCadastroVenda.EditProdutoExit(Sender: TObject);
var
teste: string;

begin
  inherited;

  EditValorUnit.Text := FDQueryProdutoPRECO_VENDA.AsString;

  FDQuery1.Close;
  teste:= IntToStr(FDQuery1.SQL.Add('and codigo = ' + EditProduto.Text));
  FDQuery1.Open;

  ShowMessage(teste);

end;

procedure TfrmCadastroVenda.FDQueryCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;

  //  Seta o numero da nota na tabela de itens vendas
  SetItens(FDQueryCadastroNRNOTA.AsInteger);

end;

procedure TfrmCadastroVenda.FDQueryCadastroAfterScroll(DataSet: TDataSet);
begin
  inherited;

  //  Seta o numero da nota na tabela de itens vendas
  SetItens(FDQueryCadastroNRNOTA.AsInteger);

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

procedure TfrmCadastroVenda.FDQueryItemNotaAfterCancel(DataSet: TDataSet);
begin
  inherited;

  FDTransactionItemNota.RollbackRetaining;

end;

procedure TfrmCadastroVenda.FDQueryItemNotaAfterDelete(DataSet: TDataSet);
begin
  inherited;

  FDTransactionItemNota.CommitRetaining;

end;

procedure TfrmCadastroVenda.FDQueryItemNotaAfterPost(DataSet: TDataSet);
begin
  inherited;

  FDTransactionItemNota.CommitRetaining;

end;

procedure TfrmCadastroVenda.FormCreate(Sender: TObject);
begin
  inherited;

  AtualizaFDQuery(FDQueryProduto, '');

end;

procedure TfrmCadastroVenda.GeraNumeroLcto;
var
  cod: integer;

begin

  cod := 0;

  FDQueryItemNota.Open();

  //  Ve o ultimo registro
  FDQueryItemNota.Last();

  //  Pega o �ltimo c�digo gerado e soma + 1
  //cod := FDQueryItemNota.ExecSQL ('SELECT max(lcto) FROM ITEM_VENDA') + 1;
  cod := FDQueryItemNota.FieldByName('LCTO').AsInteger + 1;


  ShowMessage(inttostr(cod));

  //  Insere o registro no final da tabela
  FDQueryItemNota.Append();

  //  Seta no edit o codigo gerado
  EditLcto.Text := IntToStr(cod);

  //  Posiciona o cursor
  EditProduto.SetFocus;

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

  //  Pega o �ltimo c�digo gerado e soma + 1
  cod := FDQueryCadastro.FieldByName('NRNOTA').AsInteger + 1;

  //  Insere o registro no final da tabela
  FDQueryCadastro.Append();

  //  Seta no edit o codigo gerado
  DBEditNrNota.Text := IntToStr(cod);

  //  Posiciona o cursor
  DBEditCodCLiente.SetFocus;

end;

procedure TfrmCadastroVenda.GravarItem;
begin

  GeraNumeroLcto;

  FDQueryItemNota.Append;

  FDQueryItemNotaLCTO.AsInteger      := StrToInt(EditLcto.Text);
  FDQueryItemNotaNR_VENDA.AsInteger  := StrToInt(DBEditNrNota.Text);
  FDQueryItemNotaPRODUTO.AsInteger   := StrToInt(EditProduto.Text);
  FDQueryItemNotaQTDE.AsFloat        := StrToFloat(EditQtd.Text);
  FDQueryItemNotaVALOR_UNIT.AsFloat  := StrToFloat(EditValorUnit.Text);
  FDQueryItemNotaVALOR_TOTAL.AsFloat := StrToFloat(EditValorTotal.Text);

  FDQueryItemNota.Post;

end;

procedure TfrmCadastroVenda.SetItens(pIdVenda: integer);
begin

  FDQueryItemNota.Close;
  FDQueryItemNota.ParamByName('NR_VENDA').AsInteger := pIdVenda;
  AtualizaFDQuery(FDQueryItemNota, '');

end;

end.
