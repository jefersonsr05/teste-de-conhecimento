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
  RxToolEdit, RxCurrEdit, fCadastroCliente, System.ImageList, Vcl.ImgList;
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
    FDQueryCliente: TFDQuery;
    LabelNomeCliente: TLabel;
    LabelDescProd: TLabel;
    DataSource1: TDataSource;
    FDQueryProduto1: TFDQuery;
    FDQueryItemVenda: TFDQuery;
    FDQueryItemVendaMAX: TIntegerField;
    Label1: TLabel;
    DBEditTotalVenda: TDBEdit;
    FDQuery1: TFDQuery;
    procedure ButtonClienteClick(Sender: TObject);
    procedure BitBtnNovoClick(Sender: TObject);
    procedure ButtonProdutoClick(Sender: TObject);
    procedure ButtonAdicionarClick(Sender: TObject);
    procedure FDQueryCadastroAfterOpen(DataSet: TDataSet);
    procedure FDQueryCadastroAfterScroll(DataSet: TDataSet);
    procedure FDQueryItemNotaAfterPost(DataSet: TDataSet);
    procedure FDQueryItemNotaAfterDelete(DataSet: TDataSet);
    procedure FDQueryItemNotaAfterCancel(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure EditQtdExit(Sender: TObject);
    procedure EditValorUnitExit(Sender: TObject);
    procedure DBComboBoxOpVendaExit(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure EditProdutoExit(Sender: TObject);
    procedure DBEditCodCLienteExit(Sender: TObject);

  private
    { Private declarations }
    procedure GravarItem;
    procedure SetItens(pIdVenda: integer);
    procedure GeraNumeroVenda;
    procedure BuscaNomeProduto;
    procedure CalculaValorTotalItem;
    procedure LimpaCamposItens;
    procedure BuscaNomeCliente;
    procedure GeraNumeroLcto;
    procedure BaixaEstoque;

  public
    { Public declarations }
  end;
var
  frmCadastroVenda: TfrmCadastroVenda;
  nr_nota: integer;
implementation
{$R *.dfm}
procedure TfrmCadastroVenda.BaixaEstoque;

begin

  //  Se for venda ira baixar o estoque e
  //  adicionar data da ultima venda no produto
  //if FDQueryCadastroOPERACAO_VENDA.Value = 'V' then
  //begin

    //FDQuery1.Close;
    //FDQuery1.SQL.Clear;
    //FDQuery1.SQL.Add('select produto, qtde from item_venda ');
    //FDQuery1.SQL.Add(' where nr_venda = ' + QuotedStr(DBEditNrNota.Text));
    //FDQuery1.Open;

    FDQueryProduto.Close;
    FDQueryProduto.SQL.Add('update produtos set saldo = saldo :qtde, data_venda = :data where codigo = :cod');
    FDQueryProduto.Open;
    FDQueryProduto.ParamByName('cod').AsInteger := FDQueryProduto.FieldByName('codigo').AsInteger;
    FDQueryProduto.ParamByName('qtde').AsFloat := FDQueryItemNota.FieldByName('qtde').AsFloat;
    FDQueryProduto.ParamByName('data').AsDate := FDQueryCadastro.FieldByName('emissao').AsDateTime;


  //end;
  //  Se for pre venda ira baixar somente estoque
  if FDQueryCadastroOPERACAO_VENDA.Value = 'P' then
  begin

  end;


end;

procedure TfrmCadastroVenda.BitBtnNovoClick(Sender: TObject);
begin
  inherited;

  PanelCabecalhoVenda.Enabled := True;

  //  Cria o numero da venda
  GeraNumeroVenda;
  FDQueryCadastroEMISSAO.AsDateTime := Date;
  FDTransactionItemNota.StartTransaction;
  FDQueryItemNota.Open();
  DBEditTotalVenda.Text := '0';

end;
procedure TfrmCadastroVenda.BitBtnSalvarClick(Sender: TObject);
begin
  inherited;

  FDQueryItemNota.Post;
  BaixaEstoque;

end;

procedure TfrmCadastroVenda.BuscaNomeCliente;
begin

  if Trim(DBEditCodCLiente.Text) <> '' then
    begin
      FDQueryCliente.Close;
      FDQueryCliente.SQL.Clear;
      FDQueryCliente.SQL.Add(' select nome from cliente ');
      FDQueryCliente.SQL.Add('where codigo =' + QuotedStr(DBEditCodCLiente.Text));
      FDQueryCliente.Open;
      if FDQueryCliente.RecordCount > 0 then
      begin
        LabelNomeCliente.Caption := FDQueryCliente.FieldByName('nome').AsString;
      end
      else
      begin
        ShowMessage
        ('Cliente n�o encontrado!');
        DBEditCodCLiente.SetFocus;
        DBEditCodCLiente.Clear;
      end;

    end;


end;

procedure TfrmCadastroVenda.BuscaNomeProduto;
begin

  //  De acordo com o codigo do produto
  //  busca o valor e descricao
  if Trim(EditProduto.Text) <> '' then
  begin

    FDQueryProduto1.Close;
    FDQueryProduto1.SQL.Clear;
    FDQueryProduto1.SQL.Add('select descricao, preco_venda from produtos ');
    FDQueryProduto1.SQL.Add('where codigo =' + QuotedStr(EditProduto.Text));
    FDQueryProduto1.Open;

    if FDQueryProduto1.RecordCount > 0 then
    begin

      LabelDescProd.Caption := FDQueryProduto1.FieldByName('descricao').AsString;
      EditValorUnit.Text    := FDQueryProduto1.FieldByName('preco_venda').AsString;

    end
    else
    begin

      ShowMessage('Produto n�o encontrado!');


    end;

    EditQtd.Text     := '1';
    EditQtd.SetFocus;

  end;

end;

procedure TfrmCadastroVenda.ButtonAdicionarClick(Sender: TObject);
var
  i: integer;

begin
  inherited;

  GravarItem;
  LimpaCamposItens;



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
procedure TfrmCadastroVenda.ButtonExcluirClick(Sender: TObject);
begin
  inherited;

  DBGridItensVenda.DataSource.DataSet.Delete;

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
procedure TfrmCadastroVenda.CalculaValorTotalItem;
begin

  if (EditQtd.Text <> '') and (EditValorUnit.Text <> '') then
  begin
    EditValorTotal.Text := FloatToStr(StrToFloat(EditValorUnit.Text) * StrToFloat(EditQtd.Text));
  end;

end;

procedure TfrmCadastroVenda.DBComboBoxOpVendaExit(Sender: TObject);
begin
  inherited;

  //  Libera a tela para adicionar itens
  PanelProdutos.Enabled := True;
end;

procedure TfrmCadastroVenda.DBEditCodCLienteExit(Sender: TObject);
begin
  inherited;
  BuscaNomeCliente;
end;

procedure TfrmCadastroVenda.EditProdutoExit(Sender: TObject);
begin
  inherited;

  BuscaNomeProduto;

end;

procedure TfrmCadastroVenda.EditQtdExit(Sender: TObject);
begin
  inherited;

  CalculaValorTotalItem;

end;

procedure TfrmCadastroVenda.EditValorUnitExit(Sender: TObject);
begin
  inherited;

  CalculaValorTotalItem;

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
procedure TfrmCadastroVenda.FormActivate(Sender: TObject);
begin
  inherited;
  LabelNomeCliente.Caption := '';
  LabelDescProd.Caption    := '';
end;
procedure TfrmCadastroVenda.GeraNumeroLcto;
var
  cod, result: integer;
begin
  cod := 0;

  FDQueryItemVenda.Open();

  cod :=  FDQueryItemVendaMAX.AsInteger + 1 ;

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
var
  i: integer;
  totalVenda: Double;

begin

  FDQueryItemNota.Append;

  if EditProduto.Text <> '' then
  begin

    FDQueryItemNotaPRODUTO.AsInteger   := StrToInt(EditProduto.Text);
    FDQueryItemNotaQTDE.AsFloat        := StrToFloat(EditQtd.Text);
    FDQueryItemNotaVALOR_UNIT.AsFloat  := StrToFloat(EditValorUnit.Text);

  end
  else
  begin

    ShowMessage('Preencha o campo Cod Produto!');
    Abort;
    EditProduto.SetFocus;
  end;


  if EditLcto.Text <> '' then
  begin
    i:= StrToInt(EditLcto.Text) + 1;
    EditLcto.Text := IntToStr(i);
  end
  else
  begin
    GeraNumeroLcto;
  end;


  FDQueryItemNotaLCTO.AsInteger      := StrToInt(EditLcto.Text);
  FDQueryItemNotaNR_VENDA.AsInteger  := StrToInt(DBEditNrNota.Text);
  FDQueryItemNotaVALOR_TOTAL.AsFloat := StrToFloat(EditValorTotal.Text);


  totalVenda := StrToFloat(DBEditTotalVenda.Text);
  DBEditTotalVenda.Text := FloatToStr(totalVenda + StrToFloat(EditValorTotal.Text))

end;
procedure TfrmCadastroVenda.LimpaCamposItens;
begin

  EditProduto.Clear;
  EditQtd.Clear;
  EditValorUnit.Clear;
  EditValorTotal.Clear;

end;

procedure TfrmCadastroVenda.SetItens(pIdVenda: integer);
begin
  FDQueryItemNota.Close;
  FDQueryItemNota.ParamByName('NR_VENDA').AsInteger := pIdVenda;
  AtualizaFDQuery(FDQueryItemNota, '');
end;
end.
