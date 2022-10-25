unit fProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, dConexao,
  Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmProduto = class(TForm)
    dtsProduto: TDataSource;
    qryConsultaProduto: TFDQuery;
    pnlCentral: TPanel;
    pnlBotoes: TPanel;
    pnlTopo: TPanel;
    pgcPrincipal: TPageControl;
    tbsConsulta: TTabSheet;
    tbsCadastro: TTabSheet;
    grdProduto: TDBGrid;
    pnlCentralCad: TPanel;
    lbldescricao: TLabel;
    lblReferencia: TLabel;
    lblCodigo: TLabel;
    lblUnidade: TLabel;
    lblDataVenda: TLabel;
    lblPrecoVenda: TLabel;
    lblSaldo: TLabel;
    edtDescricao: TEdit;
    edtReferencia: TEdit;
    edtCodigo: TEdit;
    edtUnidade: TEdit;
    edtPrecoVenda: TEdit;
    edtSaldo: TEdit;
    pnlBotoesProd: TPanel;
    btnCancelar: TButton;
    btnConfirmar: TButton;
    pnlPesquisas: TPanel;
    qryCadastroProduto: TFDQuery;
    dtpDataVenda: TDateTimePicker;
    btnAtualizar: TButton;
    btnSair: TButton;
    btnExcluir: TButton;
    btnAlterar: TButton;
    btnInserir: TButton;
    edtFiltroProduto: TEdit;
    lblPesquisaProduto: TLabel;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtFiltroProdutoChange(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure grdProdutoTitleClick(Column: TColumn);
    procedure edtSaldoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtPrecoVendaKeyPress(Sender: TObject; var Key: Char);
    procedure edtUnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    FTipoOperacao: string;
    procedure ConfirmarInserir;
    procedure ConfirmarEditar;
    procedure ConfirmarExcluir;
    procedure Consultar;
    procedure LimparCampos;
    procedure MontarTela;
    function RetornaUltimoCodigo: integer;
  public
    { Public declarations }
     property TipoOperacao: string read FTipoOperacao write FTipoOperacao;
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.dfm}

procedure TfrmProduto.btnAlterarClick(Sender: TObject);
begin
  LimparCampos; // limpar campos
  if not qryConsultaProduto.IsEmpty then // verifica se tem registros
  begin
    FTipoOperacao := 'Alterar';
    MontarTela;
    edtCodigo.Text := qryConsultaProduto.FieldByName('CODIGO').AsString;
  end
  else
  begin
    showmessage('Selecione para alterar')
  end;
end;

procedure TfrmProduto.btnAtualizarClick(Sender: TObject);
begin
  Consultar; // atualiza qry
end;

procedure TfrmProduto.btnCancelarClick(Sender: TObject);
begin
 FTipoOperacao := 'Consultar';
 MontarTela;
end;

procedure TfrmProduto.btnConfirmarClick(Sender: TObject);
begin
  begin
    if (edtDescricao.Text) = emptyStr then
    begin
      showmessage('Preencher o campo descrição'); // validação
      edtDescricao.SetFocus;
      abort;
    end
    else if (edtUnidade.Text) = emptyStr then
    begin
      showmessage('Preencher o campo unidade'); // validação
      edtUnidade.SetFocus;
      abort;
    end
    else if (edtSaldo.Text) = emptyStr then
    begin
      showmessage('Preencher o campo saldo'); // validação
      edtSaldo.SetFocus;
      abort;
    end;
    begin
      if FTipoOperacao = 'Incluir' then
      begin
        ConfirmarInserir;
      end
      else
      begin
        ConfirmarEditar;
      end;
      FTipoOperacao:= 'Consultar';
      MontarTela;
      Consultar; // atualiza a qry
    end;
  end;
end;

procedure TfrmProduto.btnConfirmarKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8, '''']) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmProduto.btnExcluirClick(Sender: TObject);
begin
  if not qryConsultaProduto.IsEmpty then // verifica se tem registros
  begin
    ConfirmarExcluir;
  end
  else
  begin
    showmessage('Selecione para excluir')
  end;
end;

procedure TfrmProduto.btnInserirClick(Sender: TObject);
begin
  LimparCampos; // limpar campos
  FTipoOperacao := 'Incluir';
  MontarTela;
  edtCodigo.Text := RetornaUltimoCodigo.ToString;
  edtDescricao.SetFocus;
end;

procedure TfrmProduto.btnSairClick(Sender: TObject);
begin
  close; // fecha tela
end;

procedure TfrmProduto.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmProduto.Consultar;
begin
  qryConsultaProduto.Connection := dtmConexao.Conexao;
  qryConsultaProduto.close;
  qryConsultaProduto.SQL.Clear;
  qryConsultaProduto.SQL.add(' select*from produtos ');
  qryConsultaProduto.Open;
end;

procedure TfrmProduto.ConfirmarEditar;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.Conexao; // passei a conexao para qry

    if not qryConsultaProduto.IsEmpty then // verifica se tem registros
    begin
      lQuery.close;
      lQuery.SQL.Clear;
      lQuery.SQL.add('    UPDATE PRODUTOS SET                       ');
      lQuery.SQL.add('    DESCRICAO = :DESCRICAO                    ');
      lQuery.SQL.add('  , REFERENCIA = :REFERENCIA                  ');
      lQuery.SQL.add('  , UNIDADE = :UNIDADE                        ');
      lQuery.SQL.add('  , DATA_VENDA = :DATA_VENDA                  ');
      lQuery.SQL.add('  , PRECO_VENDA = :PRECO_VENDA                ');
      lQuery.SQL.add('  , SALDO = :SALDO                            ');
      lQuery.SQL.add('    where (CODIGO = :CODIGO)                  ');
      lQuery.ParamByName('CODIGO').AsInteger := qryConsultaProduto.FieldByName('CODIGO').AsInteger; // peguei o codigo da query do grid
      lQuery.ParamByName('DESCRICAO').AsString := edtDescricao.Text;
      lQuery.ParamByName('REFERENCIA').AsString := edtReferencia.Text;
      lQuery.ParamByName('UNIDADE').AsString := edtUnidade.Text;
      lQuery.ParamByName('DATA_VENDA').AsDate := dtpDataVenda.DateTime;
      lQuery.ParamByName('PRECO_VENDA').AsString := edtPrecoVenda.Text;
      lQuery.ParamByName('SALDO').AsString := edtSaldo.Text;
      lQuery.ExecSQL;
      lQuery.Connection.Commit;

      Consultar; // atualiza a query cliente
    end
    else
    begin
      showmessage('Selecione para editar')
    end;
  finally
    lQuery.Free;
  end;

end;

procedure TfrmProduto.edtFiltroProdutoChange(Sender: TObject);
begin
  qryCadastroProduto.Filtered := False;
  qryCadastroProduto.Filter := 'DESCRICAO like' +   // filtro produto não exato
  QuotedStr('%' + edtFiltroProduto.Text + '%');
  qryCadastroProduto.Filtered := True;
end;

procedure TfrmProduto.edtPrecoVendaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8, '''']) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmProduto.edtSaldoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8, '''']) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmProduto.edtUnidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8, '''']) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmProduto.ConfirmarExcluir;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.Conexao; // passei a conexao para qry
    lQuery.close;
    lQuery.SQL.Clear;
    lQuery.SQL.add('   DELETE FROM PRODUTOS WHERE CODIGO =:CODIGO  ');
    lQuery.ParamByName('CODIGO').AsInteger := qryConsultaProduto.FieldByName('CODIGO').AsInteger; // peguei o codigo da query do grid
    lQuery.ExecSQL;
    lQuery.Connection.Commit;
    Consultar; // atualiza a query cliente
  finally
    lQuery.Free;
  end;

end;

procedure TfrmProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
      if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmProduto.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  MontarTela;
end;

procedure TfrmProduto.grdProdutoTitleClick(Column: TColumn);
begin
  qryConsultaProduto.IndexFieldNames := Column.FieldName; // ordena grid
end;

procedure TfrmProduto.LimparCampos;
begin
    edtDescricao.clear;
    edtReferencia.clear;
    edtUnidade.clear;
    edtPrecoVenda.clear;
    edtSaldo.clear;
end;

procedure TfrmProduto.MontarTela;
begin
  if TipoOperacao <> 'Consultar' then
  begin
    tbsCadastro.TabVisible := True;
    tbsConsulta.TabVisible := False;
    pgcPrincipal.ActivePage := tbsCadastro; // abre na tela consulta
    pnlBotoes.Visible := false;

    if TipoOperacao = 'Incluir'  then
      edtCodigo.Text := RetornaUltimoCodigo.ToString;

    edtDescricao.SetFocus;
  end
  else
  begin
    tbsCadastro.TabVisible := False;
    tbsConsulta.TabVisible := True;
    pgcPrincipal.ActivePage := tbsConsulta; // abre na tela consulta
    pnlBotoes.Visible := true;
    Consultar;
  end;
end;

function TfrmProduto.RetornaUltimoCodigo: integer;
var
  lQuery: TFDQuery;
begin
  Result := 0;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.Conexao; // passei a conexao para qry
    lQuery.close;
    lQuery.SQL.Clear;
    lQuery.SQL.add(' SELECT MAX(CODIGO) AS CODIGO FROM PRODUTOS ');
    lQuery.Open;
    Result := lQuery.FieldByName('codigo').AsInteger +1 ;
  finally
    lQuery.Free;
  end;

end;

procedure TfrmProduto.ConfirmarInserir;
begin
  qryCadastroProduto.close;
  qryCadastroProduto.SQL.Clear;
  qryCadastroProduto.SQL.add('   INSERT INTO PRODUTOS (             ');
  qryCadastroProduto.SQL.add('   CODIGO                             ');
  qryCadastroProduto.SQL.add('  ,DESCRICAO                          ');
  qryCadastroProduto.SQL.add('  ,REFERENCIA                         ');
  qryCadastroProduto.SQL.add('  ,UNIDADE                            ');
  qryCadastroProduto.SQL.add('  ,DATA_VENDA                         ');
  qryCadastroProduto.SQL.add('  ,PRECO_VENDA                        ');
  qryCadastroProduto.SQL.add('  ,SALDO                              ');
  qryCadastroProduto.SQL.add('  )                                   ');
  qryCadastroProduto.SQL.add('   values(                            ');
  qryCadastroProduto.SQL.add('   :CODIGO                            ');
  qryCadastroProduto.SQL.add('  ,:DESCRICAO                         ');
  qryCadastroProduto.SQL.add('  ,:REFERENCIA                        ');
  qryCadastroProduto.SQL.add('  ,:UNIDADE                           ');
  qryCadastroProduto.SQL.add('  ,:DATA_VENDA                        ');
  qryCadastroProduto.SQL.add('  ,:PRECO_VENDA                       ');
  qryCadastroProduto.SQL.add('  ,:SALDO                             ');
  qryCadastroProduto.SQL.add('  )                                   ');
  qryCadastroProduto.ParamByName('CODIGO').AsFloat := StrToFloatDef(edtCodigo.Text, 0);
  qryCadastroProduto.ParamByName('DESCRICAO').AsString := edtDescricao.Text;
  qryCadastroProduto.ParamByName('REFERENCIA').AsString := edtReferencia.Text;
  qryCadastroProduto.ParamByName('UNIDADE').AsString := edtUnidade.Text;
  qryCadastroProduto.ParamByName('DATA_VENDA').AsDateTime := dtpDataVenda.Date;
  qryCadastroProduto.ParamByName('PRECO_VENDA').AsFloat :=StrToFloatDef(edtPrecoVenda.Text, 0);
  qryCadastroProduto.ParamByName('SALDO').AsFloat :=StrToFloatDef(edtSaldo.Text, 0);
  qryCadastroProduto.ExecSQL;
  qryCadastroProduto.Connection.Commit;
end;

end.
