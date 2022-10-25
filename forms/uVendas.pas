unit uVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, uDtmConexao, uDtmVenda,
  RxToolEdit, RxCurrEdit, uEnum, System.ImageList, Vcl.ImgList, cVendas;

type
  TfrmVendas = class(TfrmTelaHeranca)
    qryListagemNRNOTA: TIntegerField;
    qryListagemEMISSAO: TDateField;
    qryListagemCLIENTE: TIntegerField;
    qryListagemNOME: TWideStringField;
    qryListagemTIPO_VENDA: TWideStringField;
    qryListagemVALOR_VENDA: TExtendedField;
    qryListagemOPERACAO_VENDA: TWideStringField;
    edtNrnota: TLabeledEdit;
    lkpCliente: TDBLookupComboBox;
    lblTextoCliente: TLabel;
    edtEmissao: TDateEdit;
    lblTextoEmissao: TLabel;
    Panel1: TPanel;
    pnlCima: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    lblTextoVenda: TLabel;
    edtValorVenda: TCurrencyEdit;
    grdVenda: TDBGrid;
    lkpProdutos: TDBLookupComboBox;
    Label1: TLabel;
    edtQuantidade: TCurrencyEdit;
    edtUnitario: TCurrencyEdit;
    edtTotal: TCurrencyEdit;
    btnAdicionar: TBitBtn;
    btnRemover: TBitBtn;
    rgpVenda: TRadioGroup;
    rgpPagamento: TRadioGroup;
    lblTextoQuantidade: TLabel;
    lblTextoUnitário: TLabel;
    lblTextoTotal: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure lkpProdutosExit(Sender: TObject);
    procedure edtUnitarioExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure grdVendaDblClick(Sender: TObject);
    procedure grdVendaCellClick(Column: TColumn);
  private
    { Private declarations }
    _Vendas:TVendas;
    dtmVenda:TdtmVenda;
    function Apagar:boolean; override;
    function Salvar(EstadoDocadastro:TEstadoDoCadastro):boolean; override;
    function TotalProduto(valorUnitario, quantidade: double): double;
    procedure LimparItensVenda;
    procedure PreencherItem;
    procedure LimparProdutoTela;
    function TotalVenda: Double;
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

{$region 'OVERRIDE'}

function TfrmVendas.Apagar: boolean;
begin
  if _Vendas.Selecionar(qryListagem.FieldByName('nrnota').AsInteger)  then
    Result := _Vendas.Apagar;
end;

function TfrmVendas.Salvar(EstadoDocadastro: TEstadoDoCadastro): boolean;
begin
  if (edtNrnota.Text <> EmptyStr) then
    _Vendas.nrnota := StrToInt(edtNrnota.Text)
  else

  _Vendas.nrnota := 0;
  _Vendas.emissao := edtEmissao.Date;
  _Vendas.cliente := lkpCliente.KeyValue;
  _Vendas.valor_Venda := edtValorVenda.Value;

  if (rgpPagamento.ItemIndex = 1) then
    _Vendas.tipo_Venda := 'A'
  else
    _vendas.tipo_Venda := 'P';

  if (rgpVenda.ItemIndex = 0) then
    _Vendas.operacao_Venda := 'V'
  else if (rgpVenda.ItemIndex = 1) then
    _Vendas.operacao_Venda := 'P'
  else
    _Vendas.operacao_Venda := 'O';

  if (EstadoDocadastro=ecInserir) then
    Result := _Vendas.Inserir(dtmVenda.cdsItensVenda)
  else if (EstadoDocadastro=ecAlterar) then
    Result := _Vendas.Atualizar;
end;

{$endregion}

{$region 'FUNCTIONS E PROCEDURES'}

function TfrmVendas.TotalProduto(valorUnitario, quantidade:double):double;
begin
  result := valorUnitario * quantidade;
end;

procedure TfrmVendas.LimparItensVenda;
begin
  //Enquanto nao for "End of File" vai deletando os itens da tela.
  while not dtmVenda.cdsItensVenda.Eof do
    dtmVenda.cdsItensVenda.Delete;
end;

procedure TfrmVendas.PreencherItem;
begin
  lkpProdutos.KeyValue := dtmVenda.cdsItensVenda.FieldByName('Código').AsString;
  edtQuantidade.Value := dtmVenda.cdsItensVenda.FieldByName('Quantidade').AsFloat;
  edtUnitario.Value := dtmVenda.cdsItensVenda.FieldByName('Unitário').AsFloat;
  edtTotal.Value := dtmVenda.cdsItensVenda.FieldByName('Total').AsFloat;
end;

procedure TfrmVendas.LimparProdutoTela;
begin
  lkpProdutos.KeyValue := null;
  edtQuantidade.Value := 0;
  edtUnitario.Value := 0;
  edtTotal.Value := 0;
end;

function TfrmVendas.TotalVenda:Double;
begin
  result := 0;
  dtmVenda.cdsItensVenda.First;
  while not dtmVenda.cdsItensVenda.Eof do
  begin
    result := result + dtmVenda.cdsItensVenda.FieldByName('Total').AsFloat;
    dtmVenda.cdsItensVenda.Next;
  end;
end;

{$endregion}

{$region 'INTERACOES NA TELA'}

procedure TfrmVendas.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  if (lkpProdutos.KeyValue = null) then
    begin
      MessageDlg('Selecione um produto.',mtInformation,[mbOk],0);
      lkpProdutos.SetFocus;
      abort;
    end;

  if (edtQuantidade.Value <= 0) then
    begin
      MessageDlg('Selecione uma quantidade maior que zero.',mtInformation,[mbOk],0);
      edtQuantidade.Value := 0;
      edtQuantidade.SetFocus;
      abort;
    end;

  if (edtUnitario.Value <= 0) then
    begin
      MessageDlg('Selecione um valor unitário maior que zero.',mtInformation,[mbOk],0);
      edtUnitario.Value := 0;
      edtUnitario.SetFocus;
      abort;
    end;

  if dtmVenda.cdsItensVenda.Locate('Código', lkpProdutos.KeyValue, []) then
    begin
      MessageDlg('Você não pode repetir produtos.',mtInformation,[mbOk],0);
      lkpProdutos.SetFocus;
      abort;
    end;

  edtTotal.Value := TotalProduto(edtUnitario.Value, edtQuantidade.Value);

  //Append inclui novo registro e post finaliza adicao.

  dtmVenda.cdsItensVenda.Append;
  dtmVenda.cdsItensVenda.FieldByName('Código').AsString:=lkpProdutos.KeyValue;
  dtmVenda.cdsItensVenda.FieldByName('Descrição').AsString:=dtmVenda.qryProduto.FieldByName('descricao').AsString;
  dtmVenda.cdsItensVenda.FieldByName('Quantidade').AsFloat:=edtQuantidade.Value;
  dtmVenda.cdsItensVenda.FieldByName('Unitário').AsFloat:=edtUnitario.Value;
  dtmVenda.cdsItensVenda.FieldByName('Total').AsFloat:=edtTotal.Value;
  dtmVenda.cdsItensVenda.Post;

  edtValorVenda.Text := FloatToStr(TotalVenda);
  LimparProdutoTela;

  grdVenda.DataSource := dtmVenda.dtsItensVenda;

  lkpProdutos.SetFocus;
end;

procedure TfrmVendas.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if _Vendas.Selecionar(qryListagem.FieldByName('nrnota').AsInteger) then
  begin
    edtNrnota.Text := IntToStr(_Vendas.nrnota);
    edtEmissao.Date := _Vendas.emissao;
    lkpCliente.KeyValue := _Vendas.cliente;
    edtValorVenda.Value := _Vendas.valor_Venda;

    if (_Vendas.tipo_Venda) = 'A' then
      rgpPagamento.ItemIndex := 1
    else
      rgpVenda.ItemIndex := 0;

    if (_Vendas.operacao_Venda) = 'V' then
      rgpVenda.ItemIndex := 0
    else if (_Vendas.operacao_Venda) = 'P' then
      rgpVenda.ItemIndex := 1
    else
      rgpVenda.ItemIndex := 2;

  end
  else
    begin
      btnCancelar.Click;
      abort;
    end;
  inherited;
end;

procedure TfrmVendas.btnApagarClick(Sender: TObject);
begin
  inherited;
  LimparItensVenda;
end;

procedure TfrmVendas.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparItensVenda;
end;

procedure TfrmVendas.btnNovoClick(Sender: TObject);
begin
  rgpVenda.ItemIndex := 0;
  rgpPagamento.ItemIndex := 0;
  LimparItensVenda;
  inherited;
end;

procedure TfrmVendas.btnRemoverClick(Sender: TObject);
begin
  inherited;
  if (lkpProdutos.KeyValue = null) then
    begin
      MessageDlg('Selecione o produto para excluir.',mtInformation,[mbOk],0);
      lkpProdutos.SetFocus;
      abort;
    end;

  if dtmVenda.cdsItensVenda.Locate('Código', lkpProdutos.KeyValue, []) then
  begin
    dtmVenda.cdsItensVenda.Delete;
    edtValorVenda.Text := FloatToStr(TotalVenda);
    LimparProdutoTela;
  end;

end;

procedure TfrmVendas.btnSalvarClick(Sender: TObject);
begin
  inherited;
  LimparItensVenda;
end;

procedure TfrmVendas.edtUnitarioExit(Sender: TObject);
begin
  inherited;
  edtTotal.Value := TotalProduto(edtUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(dtmVenda) then
    FreeAndNil(dtmVenda);

  if Assigned(_Vendas) then
    FreeAndNil(_Vendas);
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVenda:=TdtmVenda.Create(self);
  _Vendas:=TVendas.Create(dtmConexao.ConexaoDB);
  indiceAtual:='nrnota';
end;

procedure TfrmVendas.grdVendaCellClick(Column: TColumn);
begin
  inherited;
  PreencherItem;
end;

procedure TfrmVendas.grdVendaDblClick(Sender: TObject);
begin
  inherited;
  PreencherItem;
end;

procedure TfrmVendas.lkpProdutosExit(Sender: TObject);
begin
  inherited;
  edtUnitario.Value := dtmVenda.qryProduto.FieldByName('preco_venda').AsFloat;
end;

{$endregion}

end.
