unit fCadastroProduto;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  uProduto,
  FireDAC.Comp.Client,
  dConexao,
  uHelpersImagensBase64, Vcl.ComCtrls;

type
  TfrmCadastroProduto = class(TForm)
    edtID: TEdit;
    lblID: TLabel;
    edtDescricao: TEdit;
    edtReferencia: TEdit;
    edtPreco: TEdit;
    edtSaldo: TEdit;
    lblReferencia: TLabel;
    lblDescricao: TLabel;
    lblPreco: TLabel;
    lblDataVenda: TLabel;
    lblSaldo: TLabel;
    lblkUnidade: TLabel;
    edtUnidade: TEdit;
    dtpDataVenda: TDateTimePicker;
    btnSalvar: TButton;
    btnSair: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCustoKeyPress(Sender: TObject; var Key: Char);
    procedure edtSaldoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPrecoExit(Sender: TObject);
    procedure edtSaldoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    FNome: string;
    FId: integer;
    procedure IncluirProduto;
    procedure AlterarProduto;
    function validaCampos: Boolean;

  public
    { Public declarations }
    TipoRotina: String;
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.dfm}
{ TfmrCadastroProduto }

procedure TfrmCadastroProduto.IncluirProduto;
var
  lProduto: TProduto;
begin
  lProduto := TProduto.Create;
  try
    lProduto.CODIGO := StrToInt(edtId.Text);
    lProduto.DESCRICAO := edtDescricao.Text;
    lProduto.REFERENCIA := edtReferencia.Text;
    lProduto.DATA_VENDA := dtpDataVenda.date;
    lProduto.PRECO_VENDA := StrToFloat(edtPreco.Text);
    lProduto.SALDO := StrToFloat(edtSaldo.Text);
    lProduto.UNIDADE := StrToFloat(edtUnidade.Text);
    lProduto.Incluir(true);
  finally
    lProduto.Free;
  end;
end;

procedure TfrmCadastroProduto.AlterarProduto;
var
  lProduto: TProduto;
begin
  lProduto := TProduto.Create;
  try
    lProduto.DESCRICAO := edtDescricao.Text;
    lProduto.REFERENCIA := edtReferencia.Text;
    lProduto.DATA_VENDA := dtpDataVenda.date;
    lProduto.PRECO_VENDA := StrToFloat(edtPreco.Text);
    lProduto.SALDO := StrToFloat(edtSaldo.Text);
    lProduto.UNIDADE := StrToFloat(edtUnidade.Text);
    lProduto.Alterar(true);
  finally
    lProduto.Free;
  end;
end;

procedure TfrmCadastroProduto.edtCustoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8]) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmCadastroProduto.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8]) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmCadastroProduto.edtPrecoExit(Sender: TObject);
var
  lValor: Double;
begin
  lValor := 0;
  if edtPreco.Text <> emptystr then
  begin
    if (TryStrToFloat(edtPreco.Text, lValor)) then
    begin
      edtPreco.Text := FormatFloat('#0.00', lValor);
    end
    else
    begin
      ShowMessage('Número digitado não é um valor válido');
      edtPreco.Clear;
      edtPreco.SetFocus;
    end;
  end;
end;

procedure TfrmCadastroProduto.edtSaldoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8]) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmCadastroProduto.edtSaldoExit(Sender: TObject);
var
  lValor: Double;
begin
  lValor := 0;
  if edtPreco.Text <> emptystr then
  begin
    if (TryStrToFloat(edtPreco.Text, lValor)) then
    begin
      edtPreco.Text := FormatFloat('#0.00', lValor);
    end
    else
    begin
      ShowMessage('Número digitado não é um valor válido');
      edtPreco.Clear;
      edtPreco.SetFocus;
    end;
  end;
end;

procedure TfrmCadastroProduto.edtPesoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8]) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

function TfrmCadastroProduto.validaCampos: Boolean;
begin
  if trim(edtDescricao.Text) = emptystr then
  begin
    ShowMessage('O Produto precisa de uma Descrição para a conclusão do cadastro.');
    edtDescricao.SetFocus;
    result := False;
  end
  else if trim(edtReferencia.Text) = emptystr then
  begin
    ShowMessage('O Produto precisa de uma Referência para a conclusão do cadastro.');
    edtReferencia.SetFocus;
    result := False;
  end
  else if trim(edtPreco.Text) = emptystr then
  begin
    ShowMessage('O Produto precisa de um Preço para a conclusão do cadastro.');
    edtPreco.SetFocus;
    result := False;
  end
  else if trim(edtSaldo.Text) = emptystr then
  begin
    ShowMessage('O Produto precisa de um Saldo para a conclusão do cadastro.');
    edtSaldo.SetFocus;
    result := False;
  end
  else if trim(edtUnidade.Text) = emptystr then
  begin
    ShowMessage('O Produto precisa de uma Unidade para a conclusão do cadastro.');
    edtUnidade.SetFocus;
    result := False;
  end
  else
  begin
    result := True;
  end;
end;

procedure TfrmCadastroProduto.btnSalvarClick(Sender: TObject);
var
  lProduto: TProduto;
begin
  lProduto := TProduto.Create;
  try
    if ValidaCampos then
    begin
      if TipoRotina = 'Incluir' then
      begin
        IncluirProduto;
      end
      else if TipoRotina = 'Alterar' then
      begin
        AlterarProduto;
      end;
    end;
    close;
  finally
    lProduto.Free;
  end;
end;

procedure TfrmCadastroProduto.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadastroProduto.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;

  if TipoRotina = 'Incluir' then
  begin
    edtDescricao.SetFocus;
  end
  else if TipoRotina = 'Alterar' then
  begin
    edtDescricao.SetFocus;
  end
  else
  begin
    btnsair.SetFocus;
  end;
end;

end.
