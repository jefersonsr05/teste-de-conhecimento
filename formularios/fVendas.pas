unit fVendas;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
  dConexao,
  uCliente,
  System.ImageList,
  Vcl.ImgList,
  fConsultaCliente,
  fConsultaProduto,
  fRotinaPagamento,
  uProduto,
  uVenda,
  uItem;

type
  TfrmVendas = class(TForm)
    pnlBtnFinal: TPanel;
    pnlProdutoFinal: TPanel;
    pnlGrid: TPanel;
    pnlCabecalho: TPanel;
    pnlTitulo: TPanel;
    pnlItens: TPanel;
    edtIdCliente: TEdit;
    lblCliente: TLabel;
    lblNVenda: TLabel;
    edtIdVenda: TEdit;
    lblNomeCliente: TLabel;
    edtValor: TEdit;
    lblProduto: TLabel;
    btnIdProduto: TButton;
    lblNomeProduto: TLabel;
    edtIdProduto: TEdit;
    edtTotal: TEdit;
    edtDesconto: TEdit;
    edtQuantidade: TEdit;
    lblQuantidade: TLabel;
    lblValor: TLabel;
    lblTotal: TLabel;
    lblDesconto: TLabel;
    btnConfirmaProduto: TButton;
    btnExcluiProduto: TButton;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    pnlValorFinal: TPanel;
    btnBuscaIDCliente: TButton;
    Label1: TLabel;
    lblTotalF: TLabel;
    lblSubtotal: TLabel;
    lblDescontoF: TLabel;
    lblAcrsDescNum: TLabel;
    lblSubTotalNum: TLabel;
    lblTotalNum: TLabel;
    edtPorcentual: TEdit;
    ImgButtons: TImageList;
    rdgAcrsDesc: TRadioGroup;
    edtValorAcrsDesc: TEdit;
    lblValorAcresDesc: TLabel;
    lblPercentual: TLabel;
    gridItens: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtIdClienteExit(Sender: TObject);
    procedure btnBuscaIDClienteClick(Sender: TObject);
    procedure btnIdProdutoClick(Sender: TObject);
    procedure edtIdProdutoExit(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtTotalKeyPress(Sender: TObject; var Key: Char);
    procedure rdgAcrsDescClick(Sender: TObject);

    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmaProdutoClick(Sender: TObject);
    procedure btnExcluiProdutoClick(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure gridItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtPorcentualExit(Sender: TObject);
    procedure edtValorAcrsDescExit(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtPorcentualKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtValorAcrsDescKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FCodigo: String;
    FNome: String;
    FFPagamento: String;
    FOperacaoVenda: string;
    FTotalFinal: Double;
    FVencimento: TDateTime;
    procedure CalculaTotalItem;
    procedure IncluiItem;
    procedure LimparCamposProdutos;
    procedure LimparCamposVenda;
    procedure RetornaFPagamento;
    procedure IncluirVenda;
    procedure AlterarVenda;
    procedure ResetaForm;

  public
    TipoRotina: String;
    procedure CarregaNomeCliente;
    procedure CarregaPropriedadesProduto;
    procedure AlimentaLabelTotal;
  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

procedure TfrmVendas.CalculaTotalItem;
var
  lQuantidade, lValor, lDesconto, lTotal: Double;
begin
  lQuantidade := strtofloatdef(edtQuantidade.Text, 0);
  lValor := strtofloatdef(edtValor.Text, 0);
  lDesconto := strtofloatdef(edtDesconto.Text, 0);

  lTotal := lQuantidade * lValor;

  if lDesconto > 0 then
  begin
    lTotal := lTotal - (lDesconto * (lTotal)) / 100;
  end;

  edtTotal.Text := FormatFloat('#,##0.00', lTotal);
end;

procedure TfrmVendas.AlimentaLabelTotal;
var
  lValorBrutoItens, lValorLiquido, lValorDesconto: Double;
begin
  lValorBrutoItens := 0;
  lValorLiquido := 0;
  lValorDesconto := 0;
  lValorBrutoItens := strtofloatdef(lblSubTotalNum.Caption, 0);
  lValorDesconto := strtofloatdef(edtValorAcrsDesc.Text, 0);

  case rdgAcrsDesc.ItemIndex of
    0: // Soma Por Zero
      begin
        lValorLiquido := lValorBrutoItens;
      end;
    1: // Acrescimo
      begin
        lValorLiquido := lValorBrutoItens + lValorDesconto;
      end;
    2: // Desconto
      begin
        lValorLiquido := lValorBrutoItens - lValorDesconto;
      end;
  end;

  lblAcrsDescNum.Caption := FormatFloat('#,##0.00', lValorDesconto);
  lblTotalNum.Caption := FormatFloat('#,##0.00', lValorLiquido);
end;

procedure TfrmVendas.IncluirVenda;
var
  lVenda: TVenda;
begin
  lVenda := TVenda.Create;
  try
    lVenda.NRNOTA := StrToInt(edtIdVenda.text);
    lVenda.CLIENTE.CODIGO := StrToInt(edtIdCliente.Text);
    lVenda.OPERACAO_VENDA := FOperacaoVenda;
    lVenda.TIPO_VENDA:= FFPagamento;

    if FVencimento > now then
    begin
      lVenda.EMISSAO := FVencimento;
    end
    else
    begin
      lVenda.EMISSAO := now;
    end;

    lVenda.VALOR_VENDA := FTotalFinal;
    lVenda.Incluir(true);
  finally
    lVenda.Free;
  end;
end;

procedure TfrmVendas.IncluiItem;
var
  lItem: TItem;
begin
  lItem := TItem.Create;
  try
    dtmconexao.tblConsultaItens.First;
    while not(dtmconexao.tblConsultaItens.EOF) do
    begin
      lItem.LCTO := lItem.GeraProximoID;
      lItem.NR_VENDA := strToInt(edtIdVenda.Text);
      lItem.PRODUTO.CODIGO := dtmconexao.tblConsultaItensPRODUTO.AsInteger;
      lItem.QTDE := dtmconexao.tblConsultaItensQTDE.AsFloat;
      lItem.VALOR_UNIT := dtmconexao.tblConsultaItensVALOR_UNIT.AsFloat;
      lItem.VALOR_TOTAL := dtmconexao.tblConsultaItensVALOR_TOTAL.AsFloat;
      lItem.Incluir(true);
      dtmconexao.tblConsultaItens.Next;
    end;
  finally
    lItem.Free;
  end;
end;

procedure TfrmVendas.AlterarVenda;
var
  lVenda: TVenda;
begin
  lVenda := TVenda.Create;
  try
    lVenda.Cliente.CODIGO := strToInt(edtIdCliente.Text);
  finally
    lVenda.Free;
  end;
end;

procedure TfrmVendas.ResetaForm;
begin
  edtIdCliente.Text := EmptyStr;
  LimparCamposProdutos;
  dtmconexao.tblConsultaItens.EmptyDataSet;
  LimparCamposVenda;
  AlimentaLabelTotal;
end;

procedure TfrmVendas.LimparCamposProdutos;
begin
  edtIdProduto.clear;
  lblNomeProduto.Caption := EmptyStr;
  edtValor.clear;
  edtDesconto.clear;
  edtQuantidade.clear;
  edtTotal.clear;
  lblNomeProduto.Caption := '_______________';
  edtIdProduto.SetFocus;
end;

procedure TfrmVendas.LimparCamposVenda;
begin
  rdgAcrsDesc.ItemIndex := 0;
  edtPorcentual.Enabled := false;
  edtValorAcrsDesc.Enabled := false;
  edtPorcentual.Text := FormatFloat('#,##0.00%', 0);
  edtValorAcrsDesc.Text := '0,00';
  lblNomeCliente.Caption := '_______________';
end;

procedure TfrmVendas.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmVendas.btnConfirmaProdutoClick(Sender: TObject);
var
  lValor, lQtde, lTotal: Double;
begin
  if edtIdProduto.Text <> EmptyStr then
  begin
    if StrToFloat(edtIdProduto.Text) > 0.5 then
    begin
      lTotal := StrToFloat(edtTotal.Text);
      lValor := StrToFloat(edtValor.Text);
      lQtde := StrToFloat(edtQuantidade.Text);

      dtmconexao.tblConsultaItens.append;
      dtmconexao.tblConsultaItensNR_VENDA.AsInteger := StrToInt(edtIdVenda.Text);
      dtmconexao.tblConsultaItensPRODUTO.AsInteger := StrToInt(edtIdProduto.Text);
      dtmconexao.tblConsultaItensPROD_NOME.AsString := lblNomeProduto.Caption;
      dtmconexao.tblConsultaItensVALOR_UNIT.AsFloat := lValor;
      dtmconexao.tblConsultaItensQTDE.AsFloat := lQtde;
      dtmconexao.tblConsultaItensVALOR_TOTAL.AsFloat := lTotal;
      dtmconexao.tblConsultaItens.Post;

      lblSubTotalNum.Caption := FormatFloat('#,##0.00', StrToFloat(lblSubTotalNum.Caption) + lTotal);

      AlimentaLabelTotal;
      LimparCamposProdutos;
    end
    else
    begin
      ShowMessage('Não é permitido vender abaixo de 0,5 unidades.');
      LimparCamposProdutos;
    end;
  end
  else
  begin
    ShowMessage('Nenhum produto foi selecionado.');
    LimparCamposProdutos;
    rdgAcrsDesc.SetFocus;
  end;
end;

procedure TfrmVendas.btnConfirmarClick(Sender: TObject);
begin
  // gravar a venda e itens no banco
  if edtIdCliente.Text = EmptyStr then
  begin
    ShowMessage('Campo cliente está em branco.');
    edtIdCliente.Text := '0';
    edtIdCliente.SetFocus;
  end
  else if dtmconexao.tblConsultaItens.RecordCount = 0 then
  begin
    ShowMessage('Não ha produtos na grade.');
    edtIdProduto.SetFocus;
  end
  else
  begin
    RetornaFPagamento;
    if FFPagamento <> EmptyStr then
    begin
      if TipoRotina = 'Incluir' then
      begin
        IncluirVenda;
        IncluiItem;
        edtIdVenda.Text := IntToStr(strToInt(edtIdVenda.Text) + 1);
        ResetaForm;
      end;
    end;
  end;
end;

procedure TfrmVendas.RetornaFPagamento;
var
  lFormulario: TfrmRotinaPagamento;
begin
  lFormulario := TfrmRotinaPagamento.Create(nil);
  try
    lFormulario.edtNotaTotal.Text := lblTotalNum.Caption;
    lFormulario.ShowModal;

    case lFormulario.rdgFPGto.itemIndex of
      0:
      begin
        FFPagamento := 'A';
      end;
      1:
      begin
        FFPagamento := 'P';
        FVencimento := lFormulario.dtpVencimento.Date;
      end;
    end;

    case lFormulario.rdgFPGto.itemIndex of
      0:
      begin
        FOperacaoVenda := 'O';
      end;
      1:
      begin
        FOperacaoVenda := 'P';
      end;
      2:
      begin
        FOperacaoVenda := 'V';
      end;
    end;

    FTotalFinal := StrToFloat(lFormulario.edtNotaTotal.text);
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmVendas.btnExcluiProdutoClick(Sender: TObject);
begin
  if dtmconexao.tblConsultaItens.RecordCount > 0 then
  begin
    lblSubTotalNum.Caption := FormatFloat('#,##0.00',
    StrToFloat(lblSubTotalNum.Caption) - dtmconexao.tblConsultaItensVALOR_Total.AsFloat);
    dtmconexao.tblConsultaItens.Delete;
    AlimentaLabelTotal;
  end
  else
  begin
    ShowMessage('O carrinho de compras está vazio, não há o que ser removido.');
  end;
end;

procedure TfrmVendas.btnBuscaIDClienteClick(Sender: TObject);
var
  lFormulario: TfrmConsultaCliente;
begin
  lFormulario := TfrmConsultaCliente.Create(nil);
  try
    lFormulario.btnIncluir.Visible := false;
    lFormulario.btnAlterar.Visible := false;
    lFormulario.btnExcluir.Visible := false;
    lFormulario.btnRelat.Visible := false;
    lFormulario.btnSair.Caption := 'Selecionar';
    lFormulario.ShowModal;
    edtIdCliente.Text := lFormulario.grdConsulta.DataSource.DataSet.FieldByName('CODIGO').AsString;
    lblNomeCliente.Caption := lFormulario.grdConsulta.DataSource.DataSet.FieldByName('NOME').AsString;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmVendas.btnIdProdutoClick(Sender: TObject);
var
  Valor: Double;
  lFormulario: TfrmConsultaProduto;
  lProduto: TProduto;
begin
  lFormulario := TfrmConsultaProduto.Create(nil);
  lProduto := TProduto.Create;
  try
    lFormulario.btnIncluir.Visible := false;
    lFormulario.btnAlterar.Visible := false;
    lFormulario.btnExcluir.Visible := false;
    lFormulario.btnRelat.Visible := false;
    lFormulario.btnSair.Caption := 'Selecionar';
    lFormulario.ShowModal;
    edtIdProduto.Text := lFormulario.grdConsulta.DataSource.DataSet.FieldByName('CODIGO').AsString;
    lblNomeProduto.Caption := lFormulario.grdConsulta.DataSource.DataSet.FieldByName('DESCRICAO').AsString;
    Valor := lFormulario.grdConsulta.DataSource.DataSet.FieldByName('PRECO_VENDA').AsFloat;
    edtQuantidade.Text := '1,00';
    edtDesconto.Text := '0,00';
    edtValor.Text := FormatFloat('#,##0.00', Valor);
    edtTotal.Text := FormatFloat('#,##0.00', Valor);
    edtQuantidade.SetFocus;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmVendas.CarregaNomeCliente;
begin
  if (edtIdCliente.Text <> EmptyStr) then
  begin
    if TCliente.Existe(strToInt(edtIdCliente.Text)) then
    begin
      TCliente.Existe(strToInt((edtIdCliente.Text)));
      lblNomeCliente.Caption := TCliente.ObjetoBusca.NOME;
    end
    else
    begin
      lblNomeCliente.Caption := '_______________';
      ShowMessage
        ('Esse Cliente não existe, por favor busque um existente pelo botao ao lado');
      edtIdCliente.SetFocus;
    end;
  end
  else
  begin
    lblNomeCliente.Caption := '_______________';
  end;
end;

procedure TfrmVendas.CarregaPropriedadesProduto;
begin
  if edtIdProduto.Text <> EmptyStr then
  begin
    if TProduto.Existe(strToInt(edtIdProduto.Text)) then
    begin
      lblNomeProduto.Caption := TProduto.ObjetoBusca.DESCRICAO;
      edtQuantidade.Text := '1,00';
      edtDesconto.Text := '0';
      edtValor.Text := FormatFloat('#,##0.00', TProduto.ObjetoBusca.PRECO_VENDA);
      edtTotal.Text := FormatFloat('#,##0.00', TProduto.ObjetoBusca.PRECO_VENDA);
    end
    else
    begin
      lblNomeProduto.Caption := '_______________';
      ShowMessage('O produto não foi encontrado, por favor busque um existente pelo botao ao lado');
      LimparCamposProdutos;
      edtIdProduto.SetFocus;
    end;
  end
  else
  begin
    lblNomeProduto.Caption := '_______________';
  end;
end;

procedure TfrmVendas.edtIdClienteExit(Sender: TObject);
begin
  if not(btnBuscaIDCliente.Focused) and not(btnCancelar.Focused) then
  begin
    CarregaNomeCliente;
  end;
end;

procedure TfrmVendas.edtIdProdutoExit(Sender: TObject);
begin
  if not(btnIdProduto.Focused) and not(btnCancelar.Focused) then
  begin
    CarregaPropriedadesProduto;
  end;
end;

procedure TfrmVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmVendas.edtTotalKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8, '''']) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmVendas.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8, '''']) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmVendas.edtPorcentualKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8, '''']) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmVendas.edtValorAcrsDescKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8, '''']) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmVendas.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8, '''']) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmVendas.edtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8, '''']) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmVendas.edtQuantidadeExit(Sender: TObject);
var
  lValor: Double;
begin
  CalculaTotalItem;
  lValor := 0;
  if edtQuantidade.Text <> EmptyStr then
  begin
    if (TryStrToFloat(edtQuantidade.Text, lValor)) then
    begin
      edtQuantidade.Text := FormatFloat('#0.00', lValor);
    end
    else
    begin
      ShowMessage('Número digitado não é um valor válido.');
      edtQuantidade.clear;
      edtQuantidade.SetFocus;
    end;
  end;
end;

procedure TfrmVendas.edtValorExit(Sender: TObject);
var
  lValor: Double;
begin
  CalculaTotalItem;
  lValor := 0;
  if edtValor.Text <> EmptyStr then
  begin
    if (TryStrToFloat(edtValor.Text, lValor)) then
    begin
      edtValor.Text := FormatFloat('#0.00', lValor);
    end
    else
    begin
      ShowMessage('Número digitado não é um valor válido.');
      edtValor.clear;
      edtValor.SetFocus;
    end;
  end;
end;

procedure TfrmVendas.edtDescontoExit(Sender: TObject);
var
  lValor: Double;
begin
  CalculaTotalItem;
  lValor := 0;
  if edtDesconto.Text <> EmptyStr then
  begin
    if (TryStrToFloat(edtDesconto.Text, lValor)) then
    begin
      edtDesconto.Text := FormatFloat('#0.00', lValor);
    end
    else
    begin
      ShowMessage('Número digitado não é um valor válido.');
      edtDesconto.clear;
      edtDesconto.SetFocus;
    end;
  end;
end;

procedure TfrmVendas.rdgAcrsDescClick(Sender: TObject);
begin
  case rdgAcrsDesc.ItemIndex of
    0:
      begin
        edtPorcentual.Enabled := false;
        edtValorAcrsDesc.Enabled := false;
        edtPorcentual.Text := FormatFloat('#,##0.00%', 0);
        edtValorAcrsDesc.Text := '0,00';
        AlimentaLabelTotal;
      end;
    1:
      begin
        edtPorcentual.Enabled := true;
        edtValorAcrsDesc.Enabled := true;
        edtPorcentual.Text := FormatFloat('#,##0.00%', 0);
        edtValorAcrsDesc.Text := '0,00';
        AlimentaLabelTotal;
      end;
    2:
      begin
        edtPorcentual.Enabled := true;
        edtValorAcrsDesc.Enabled := true;
        edtPorcentual.Text := FormatFloat('#,##0.00%', 0);
        edtValorAcrsDesc.Text := '0,00';
        AlimentaLabelTotal;
      end;
  end;
end;

procedure TfrmVendas.edtPorcentualExit(Sender: TObject);
var
  lValor: Double;
begin
  if edtPorcentual.Text <> EmptyStr then
  begin
    if (TryStrToFloat(edtPorcentual.Text, lValor)) then
    begin
      case rdgAcrsDesc.ItemIndex of
        1:
          begin
            lValor := (StrToFloat(edtPorcentual.Text) * StrToFloat(lblSubTotalNum.Caption)) / 100;
            edtValorAcrsDesc.Text := FormatFloat('#,##0.00', lValor);
            AlimentaLabelTotal;
          end;
        2:
          begin
            if StrToFloat(edtPorcentual.Text) > 100 then
            begin
              ShowMessage('O valor passado não pode exceder o 100%.');
              edtPorcentual.Text := FormatFloat('#,##0.00%', 100);
              edtPorcentual.SetFocus;
            end
            else
            begin
              lValor := (StrToFloat(edtPorcentual.Text) * StrToFloat(lblSubTotalNum.Caption)) / 100;
              edtValorAcrsDesc.Text := FormatFloat('#,##0.00', lValor);
              AlimentaLabelTotal;
            end;
          end;
      end;

    end
    else
    begin
      ShowMessage('Número digitado não é um valor válido');
      edtValorAcrsDesc.Text := '0,00';
      edtPorcentual.SetFocus;
    end;
  end
  else
  begin
    edtPorcentual.Text := FormatFloat('#,##0.00%', 0);
  end;
end;

procedure TfrmVendas.edtValorAcrsDescExit(Sender: TObject);
var
  lValor: Double;
begin
  if edtValorAcrsDesc.Text <> EmptyStr then
  begin
    if (TryStrToFloat(edtValorAcrsDesc.Text, lValor)) then
    begin
      case rdgAcrsDesc.ItemIndex of
        1:
          begin
            lValor := (StrToFloat(edtValorAcrsDesc.Text) / StrToFloat(lblSubTotalNum.Caption)) * 100;
            edtPorcentual.Text := FormatFloat('#,##0.00%', lValor);
            AlimentaLabelTotal;
          end;
        2:
          begin
            if StrToFloat(edtValorAcrsDesc.Text) >
              StrToFloat(lblSubTotalNum.Caption) then
            begin
              ShowMessage('O valor passado não pode exceder o Total Brudo do carrinho.');
              edtValorAcrsDesc.Text := lblSubTotalNum.Caption;
              edtValorAcrsDesc.SetFocus;
            end
            else
            begin
              lValor := (StrToFloat(edtValorAcrsDesc.Text) / StrToFloat(lblSubTotalNum.Caption)) * 100;
              edtPorcentual.Text := FormatFloat('#,##0.00%', lValor);
              AlimentaLabelTotal;
            end;
          end;
      end;
    end
    else
    begin
      ShowMessage('Número digitado não é um valor válido');
      edtValorAcrsDesc.Text := '0,00';
      edtValorAcrsDesc.SetFocus;
    end;
  end
  else
  begin
    edtValorAcrsDesc.Text := '0,00';
  end;
end;

procedure TfrmVendas.gridItensDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if gdSelected in State then
  begin
    gridItens.Canvas.brush.Color := clTeal;
    gridItens.Canvas.font.Color := clwhite;
  end;
  gridItens.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfrmVendas.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  FVencimento := Now;

  if TipoRotina = 'Incluir' then
  begin
    ResetaForm;
    AlimentaLabelTotal;
    edtIdCliente.SetFocus;
    edtPorcentual.Text := FormatFloat('#,##0.00%', 0);
    edtValorAcrsDesc.Text := '0,00';
  end
  else if TipoRotina = 'Alterar' then
  begin
    edtIdCliente.SetFocus;
  end
  else
  begin
    btnCancelar.SetFocus;
  end;
end;

end.
