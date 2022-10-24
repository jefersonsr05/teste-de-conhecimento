unit uVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, uDtmConexao, uDtmVenda,
  RxToolEdit, RxCurrEdit, cVendas,uEnum;

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
    Panel2: TPanel;
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
  private
    { Private declarations }
    _Vendas:TVendas;
    dtmVenda:TdtmVenda;
    function Apagar:boolean; override;
    function Salvar(EstadoDocadastro:TEstadoDoCadastro):boolean; override;
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

end;

{$region}

procedure TfrmVendas.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if _Vendas.Selecionar(qryListagem.FieldByName('nrnota').AsInteger) then
  begin
    edtNrnota.Text := IntToStr(_Vendas.nrnota);
    edtEmissao.Date := _Vendas.emissao;
    lkpCliente.KeyValue := _Vendas.cliente;
    edtValorVenda.Value := _Vendas.valor_Venda;

    if _Vendas.tipo_Venda = 'A' then
      rgpPagamento.ItemIndex := 1
    else
      rgpVenda.ItemIndex := 0;

    if _Vendas.operacao_Venda = 'V' then
      rgpVenda.ItemIndex := 0
    else if _Vendas.operacao_Venda = 'P' then
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

procedure TfrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(dtmVenda) then
    FreeAndNil(dtmVenda);
end;

procedure TfrmVendas.FormCreate(Sender: TObject);
begin
  inherited;
  dtmVenda:=TdtmVenda.Create(self);
  _Vendas:=TVendas.Create(dtmConexao.ConexaoDB);
  indiceAtual:='nrnota';
end;

end.
