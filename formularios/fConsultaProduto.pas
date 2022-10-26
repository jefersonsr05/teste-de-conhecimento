unit fConsultaProduto;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  dConexao,
  uProduto,
  fCadastroProduto,
  fFiltroProduto;

type
  TfrmConsultaProduto = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    pnlGrid: TPanel;
    btnAtualizar: TButton;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnRelat: TButton;
    pnlPesquisa: TPanel;
    edtPesquisar: TEdit;
    cbxFiltro: TComboBox;
    btnVisualizar: TButton;
    btnSair: TButton;
    grdConsulta: TDBGrid;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cbxFiltroChange(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnRelatClick(Sender: TObject);

  private
    { Private declarations }
    procedure CarregaProdutos;
    procedure Incluir;
    procedure Alterar;
    procedure Excluir;
    procedure Visualizar;
  public
    { Public declarations }

  end;

var
  frmConsultaProduto: TfrmConsultaProduto;

implementation

{$R *.dfm}

procedure TfrmConsultaProduto.CarregaProdutos;
begin
  dtmConexao.qryConsultaProdutos.close;
  dtmConexao.qryConsultaProdutos.SQL.Clear;

  dtmConexao.qryConsultaProdutos.SQL.Add(' SELECT         ');
  dtmConexao.qryConsultaProdutos.SQL.Add(' CODIGO         ');
  dtmConexao.qryConsultaProdutos.SQL.Add(' , DESCRICAO    ');
  dtmConexao.qryConsultaProdutos.SQL.Add(' , REFERENCIA   ');
  dtmConexao.qryConsultaProdutos.SQL.Add(' , UNIDADE      ');
  dtmConexao.qryConsultaProdutos.SQL.Add(' , DATA_VENDA   ');
  dtmConexao.qryConsultaProdutos.SQL.Add(' , PRECO_VENDA  ');
  dtmConexao.qryConsultaProdutos.SQL.Add(' , SALDO        ');
  dtmConexao.qryConsultaProdutos.SQL.Add(' FROM PRODUTOS  ');

  if edtPesquisar.Text <> emptyStr then
  begin
    case cbxFiltro.ItemIndex of
      0:
        begin
          dtmConexao.qryConsultaProdutos.SQL.Add('WHERE CODIGO LIKE ' + QuotedStr('%' + edtPesquisar.Text + '%'));
        end;
      1:
        begin
          dtmConexao.qryConsultaProdutos.SQL.Add('WHERE DESCRICAO LIKE ' + QuotedStr('%' + edtPesquisar.Text + '%'));
        end;
    end;
  end;
  dtmConexao.qryConsultaProdutos.SQL.Add(' ORDER BY CODIGO ');
  dtmConexao.qryConsultaProdutos.open;
end;

procedure TfrmConsultaProduto.cbxFiltroChange(Sender: TObject);
begin
  // se for index = 0 recebe numbersonly = true;  se não, recebe   numbersonly = false
  case cbxFiltro.ItemIndex of
    0:
      begin
        edtPesquisar.NumbersOnly := true;
        edtPesquisar.Clear;
      end;
    1:
      begin
        edtPesquisar.NumbersOnly := false;
        edtPesquisar.Clear;
      end;
  end;
end;

procedure TfrmConsultaProduto.edtPesquisarChange(Sender: TObject);
begin
  CarregaProdutos;
end;

procedure TfrmConsultaProduto.Incluir;
var
  lFormulario: TfrmCadastroProduto;
begin
  lFormulario := TfrmCadastroProduto.Create(nil);
  try
    lFormulario.TipoRotina := 'Incluir';

    lFormulario.edtID.Text := TProduto.GeraProximoID.tostring;
    lFormulario.ShowModal;
    CarregaProdutos;
  finally
    lFormulario.Free;
    CarregaProdutos;
  end;
end;

procedure TfrmConsultaProduto.Alterar;
var
  lFormulario: TfrmCadastroProduto;
  lProduto: TProduto;
begin
  lProduto := TProduto.Create;
  lFormulario := TfrmCadastroProduto.Create(nil);
  try

    lProduto.CODIGO := dtmConexao.qryConsultaProdutos.FieldByName('CODIGO').AsInteger;
    lProduto.Carrega;

    lFormulario.TipoRotina := 'Alterar';
    lFormulario.edtID.Text := lProduto.CODIGO.tostring;
    lFormulario.edtDESCRICAO.Text := lProduto.DESCRICAO;
    lFormulario.edtREFERENCIA.Text := lProduto.REFERENCIA;
    lFormulario.edtUnidade.Text := lProduto.Unidade;
    lFormulario.dtpDataVenda.date := lProduto.DATA_VENDA;
    lFormulario.edtSaldo.Text := lProduto.SALDO.tostring;
    lFormulario.edtPreco.Text := lProduto.PRECO_VENDA.tostring;

    lFormulario.ShowModal;
  finally
    lFormulario.Free;
    lProduto.Free;
    CarregaProdutos;
  end;
end;

procedure TfrmConsultaProduto.Excluir;
var
  lProduto: TProduto;
begin
  lProduto := TProduto.Create;
  try
    lProduto.CODIGO := dtmConexao.qryConsultaProdutosCODIGO.AsInteger;
    lProduto.Excluir(true);
  finally
    lProduto.Free;
  end;
  CarregaProdutos;
end;

procedure TfrmConsultaProduto.Visualizar;
var
  lFormulario: TfrmCadastroProduto;
  lProduto: TProduto;
begin
  lProduto := TProduto.Create;
  lFormulario := TfrmCadastroProduto.Create(nil);
  try
    lProduto.CODIGO := dtmConexao.qryConsultaProdutos.FieldByName('CODIGO').AsInteger;
    lProduto.Carrega;

    lFormulario.TipoRotina := 'Visualizar';
    lFormulario.edtID.Text := lProduto.CODIGO.tostring;
    lFormulario.edtDESCRICAO.Text := lProduto.DESCRICAO;
    lFormulario.edtREFERENCIA.Text := lProduto.REFERENCIA;
    lFormulario.edtUnidade.Text := lProduto.Unidade;
    lFormulario.dtpDataVenda.date := lProduto.DATA_VENDA;
    lFormulario.edtSaldo.Text := lProduto.SALDO.tostring;
    lFormulario.edtPreco.Text := lProduto.PRECO_VENDA.tostring;

    lFormulario.edtDESCRICAO.ReadOnly := true;
    lFormulario.edtREFERENCIA.ReadOnly := true;
    lFormulario.edtPreco.ReadOnly := true;
    lFormulario.edtSaldo.ReadOnly := true;
    lFormulario.edtUnidade.ReadOnly := True;
    lFormulario.dtpDataVenda.enabled := False;
    lFormulario.btnSalvar.Visible := false;

    lFormulario.ShowModal;
  finally
    lFormulario.Free;
    lProduto.Free;

    CarregaProdutos;
  end;
end;

procedure TfrmConsultaProduto.btnAtualizarClick(Sender: TObject);
begin
  if dtmConexao.qryConsultaProdutos.RecordCount > 0 then
  begin
    CarregaProdutos;
  end
  else
  begin
    ShowMessage('Não há registros para serem carregados.');
  end;
end;

procedure TfrmConsultaProduto.btnIncluirClick(Sender: TObject);
begin
  Incluir;
end;

procedure TfrmConsultaProduto.btnRelatClick(Sender: TObject);
var
  lFormulario: TfrmfiltroProduto;
begin
  lFormulario := TfrmfiltroProduto.Create(nil);
  try
    lFormulario.ShowModal;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmConsultaProduto.btnAlterarClick(Sender: TObject);
begin
  if dtmConexao.qryConsultaProdutos.RecordCount > 0 then
  begin
    Alterar;
  end
  else
  begin
    ShowMessage('Não há registros para serem alterados.');
  end;
end;

procedure TfrmConsultaProduto.btnExcluirClick(Sender: TObject);
begin
  if dtmConexao.qryConsultaProdutos.RecordCount > 0 then
  begin
    Excluir;
  end
  else
  begin
    ShowMessage('Não há registros para serem excluídos.');
  end;
end;

procedure TfrmConsultaProduto.btnVisualizarClick(Sender: TObject);
begin
  if dtmConexao.qryConsultaProdutos.RecordCount > 0 then
  begin
    Visualizar;
  end
  else
  begin
    ShowMessage('Não há registros para serem visualizados.');
  end;
end;

procedure TfrmConsultaProduto.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConsultaProduto.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
  CarregaProdutos;
end;

end.
