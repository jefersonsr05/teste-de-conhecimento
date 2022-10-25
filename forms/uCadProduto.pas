unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, RxCurrEdit, cCadProdutos, uEnum, uDtmConexao, Vcl.WinXPickers,
  System.ImageList, Vcl.ImgList;

type
  TfrmCadProdutos = class(TfrmTelaHeranca)
    qryListagemCODIGO: TIntegerField;
    qryListagemDESCRICAO: TWideStringField;
    qryListagemREFERENCIA: TWideStringField;
    qryListagemUNIDADE: TWideStringField;
    qryListagemPRECO_VENDA: TExtendedField;
    qryListagemSALDO: TExtendedField;
    edtCodigo: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtReferencia: TLabeledEdit;
    edtUnidade: TLabeledEdit;
    edtPrecoVenda: TCurrencyEdit;
    lblTextoVenda: TLabel;
    edtSaldo: TCurrencyEdit;
    lblTextoSaldo: TLabel;
    edtDataVenda: TDatePicker;
    lblUltimaVenda: TLabel;
    pnlCima: TPanel;
    pnlMeio: TPanel;
    lblGrandeCodigo: TLabel;
    lblGrandeDescricao: TLabel;
    pnlCimaCima: TPanel;
    procedure btnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure pnlCimaCimaClick(Sender: TObject);
  private
    { Private declarations }
    _Produto:TProduto;
    function Apagar:boolean; override;
    function Salvar(EstadoDocadastro:TEstadoDoCadastro):boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

{$region 'OVERRIDE'}

function TfrmCadProdutos.Salvar(EstadoDocadastro: TEstadoDoCadastro): boolean;
begin

  //Verifica primeiro se o campo de codigo do produto está vazio, para incluir, ou com valor, para fazer update.
  //Se estiver vazio passa os campos novos para as variaveis da classe.

  if (edtCodigo.Text <> EmptyStr) then
    _Produto.codigo := StrToInt(edtCodigo.Text)
  else

  _Produto.codigo := 0;
  _Produto.descricao := edtDescricao.Text;
  _Produto.referencia := edtReferencia.Text;
  _Produto.unidade := edtUnidade.Text;
  _Produto.datavenda := edtDataVenda.Date;
  _Produto.preco := edtPrecoVenda.Value;
  _Produto.saldo := edtSaldo.Value;


  if (EstadoDocadastro=ecInserir) then
    Result := _Produto.Inserir
  else if (EstadoDocadastro=ecAlterar) then
    Result := _Produto.Atualizar;
end;

function TfrmCadProdutos.Apagar: boolean;
begin
  if _Produto.Selecionar(qryListagem.FieldByName('CODIGO').AsInteger)  then
    Result := _Produto.Apagar;
end;

{$endregion}

{$region 'INTERACOES NA TELA'}

procedure TfrmCadProdutos.btnAlterarClick(Sender: TObject);
begin
  if _Produto.Selecionar(qryListagem.FieldByName('CODIGO').AsInteger)  then
  begin
    edtCodigo.Text := IntToStr(_Produto.codigo);
    edtDescricao.Text := _Produto.descricao;
    edtReferencia.Text := _Produto.referencia;
    edtUnidade.Text := _Produto.unidade;
    edtDataVenda.Date := _Produto.datavenda;
    edtPrecoVenda.Value := _Produto.preco;
    edtSaldo.Value := _Produto.saldo;

    lblGrandeCodigo.Caption := IntToStr(_Produto.codigo);
    lblGrandeDescricao.Caption := _Produto.descricao;
  end
  else
  begin
    btnCancelar.Click;
    abort;
  end;
  inherited;
end;

procedure TfrmCadProdutos.btnNovoClick(Sender: TObject);
begin
  inherited;
  lblGrandeCodigo.Caption := '0';
  lblGrandeDescricao.Caption := 'Novo Produto';
  edtDescricao.SetFocus;
end;

procedure TfrmCadProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(_Produto) then
    FreeAndNil(_Produto);
end;

procedure TfrmCadProdutos.FormCreate(Sender: TObject);
begin
  inherited;
    _Produto:=TProduto.Create(dtmConexao.ConexaoDB);
  indiceAtual:='CODIGO';
end;

procedure TfrmCadProdutos.pnlCimaCimaClick(Sender: TObject);
begin
  inherited;

end;

{$endregion}

end.
