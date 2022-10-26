unit fConsultaVenda;

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
  Vcl.ComCtrls,
  fVendas,
  uVenda,
  fFiltroVenda,
  uItem,
  FireDAC.Comp.Client;
//  fAlteraVenda;

type
  TfrmConsultaVenda = class(TForm)
    btnAlterar: TButton;
    btnIncluir: TButton;
    btnExcluir: TButton;
    btnAtualizar: TButton;
    btnRelat: TButton;
    btnSair: TButton;
    pnlData: TPanel;
    pnlGrid: TPanel;
    pnlPesquisa: TPanel;
    pnlTitulo: TPanel;
    grdConsulta: TDBGrid;
    dtpEmissao: TDateTimePicker;
    cbxFiltraData: TCheckBox;
    lblFiltroData: TLabel;
    edtPesquisar: TEdit;
    cbxFiltro: TComboBox;
    procedure cbxFiltroChange(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure btnRelatClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaVenda;
    procedure Incluir;
    procedure Alterar;
    procedure Excluir;
    procedure Relatorio;
  public
    { Public declarations }
  end;

var
  frmConsultaVenda: TfrmConsultaVenda;
  ID: String;

implementation

{$R *.dfm}
{ TfrmConsultaVenda }

procedure TfrmConsultaVenda.CarregaVenda;
var
  Data: Tdate;
begin

  dtmconexao.qryVenda.close;
  dtmconexao.qryVenda.sql.clear;
  dtmconexao.qryVenda.sql.Add(' SELECT                    ');
  dtmconexao.qryVenda.sql.Add(' V.NRNOTA                  ');
  dtmconexao.qryVenda.sql.Add(' , V.EMISSAO               ');
  dtmconexao.qryVenda.sql.Add(' , V.CLIENTE               ');
  dtmconexao.qryVenda.sql.Add(' , C.NOME                  ');
  dtmconexao.qryVenda.sql.Add(' , V.OPERACAO_VENDA        ');
  dtmconexao.qryVenda.sql.Add(' , V.TIPO_VENDA            ');
  dtmconexao.qryVenda.sql.Add(' , V.VALOR_VENDA           ');
  dtmconexao.qryVenda.sql.Add(' FROM VENDA V              ');
  dtmconexao.qryVenda.sql.Add(' LEFT JOIN CLIENTE C       ');
  dtmconexao.qryVenda.sql.Add(' ON (C.CODIGO = V.CLIENTE) ');

  if edtPesquisar.Text <> emptyStr then
  begin
    case cbxFiltro.ItemIndex of
      0:
        begin
          dtmconexao.qryVenda.sql.Add('WHERE V.NRNOTA LIKE ' + QuotedStr('%' + edtPesquisar.Text + '%'));
        end;
      1:
        begin
          dtmconexao.qryVenda.sql.Add('WHERE V.CLIENTE LIKE ' + QuotedStr('%' + edtPesquisar.Text + '%'));
        end;
      2:
        begin
          dtmconexao.qryVenda.sql.Add('WHERE C.NOME LIKE ' + QuotedStr('%' + edtPesquisar.Text + '%'));
        end;
    end;

    if cbxFiltraData.Checked then
    begin
      dtmconexao.qryVenda.sql.Add(' AND V.EMISSAO = ' +
        DateToStr(dtpEmissao.Date));
    end;
  end
  else if cbxFiltraData.Checked then
  begin
    dtmconexao.qryVenda.sql.Add(' WHERE V.EMISSAO = ' + DateToStr(dtpEmissao.Date));
  end;
  dtmconexao.qryVenda.sql.Add(' ORDER BY V.NRNOTA ');
  dtmconexao.qryVenda.open;
end;

procedure TfrmConsultaVenda.Incluir;
var
  lFormulario: TfrmVendas;
begin
  lFormulario := TfrmVendas.Create(nil);
  try
    lFormulario.TipoRotina := 'Incluir';
    lFormulario.ShowModal;
  finally
    lFormulario.Free;
  end;
  CarregaVenda;
end;

procedure TfrmConsultaVenda.Alterar;
//var
//  lSubTotal: Double;
//  lValor, lDesc, lQuant, lTotalItem: Double;
//  lVenda: TVenda;
//  lItem: TItem;
//  lFormulario: TfrmAlteraVenda;
//  lQuery: TFDQuery;
begin
//  lValor := 0;
//  lQuant := 0;
//  lTotalItem := 0;
//  lSubTotal := 0;
//
//  lFormulario := TfrmAlteraVenda.Create(nil);
//  lQuery := TFDQuery.Create(nil);
//  lVenda := TVenda.Create;
//  try
//
//    lVenda.NRNOTA := dtmconexao.qryVenda.FieldByName('NRNOTA').AsInteger;
//    lVenda.Carrega;
//
//    lQuery.Connection := dtmConexao.FDConnection;
//    lQuery.Close;
//    lQuery.SQL.Clear;
//    lQuery.SQL.Add(' SELECT             ');
//    lQuery.SQL.Add(' LCTO               ');
//    lQuery.SQL.Add(' , NR_VENDA         ');
//    lQuery.SQL.Add(' , PRODUTO          ');
//    lQuery.SQL.Add(' , QTDE             ');
//    lQuery.SQL.Add(' , VALOR_UNIT       ');
//    lQuery.SQL.Add(' , VALOR_TOTAL      ');
//    lQuery.SQL.Add(' FROM ITEM_VENDA    ');
//    lQuery.SQL.Add(' WHERE LCTO = :LCTO ');
//    lQuery.ParamByName('NR_VENDA').AsInteger := lVenda.NRNOTA;
//    lQuery.Open;
//
//    lQuery.First;
//    while not lQuery.Eof do
//    begin
//
//      lValor := lQuery.FieldByName('VALOR_UNIT').AsFloat;
//      lQuant := lQuery.FieldByName('QTDE').AsFloat;
//
//      lTotalItem := lQuant * lValor;
//
//      dtmconexao.tblConsultaItens.append;
//      dtmconexao.tblConsultaItensNR_VENDA.AsInteger := lQuery.FieldByName('NR_VENDA').AsInteger;
//      dtmconexao.tblConsultaItensPRODUTO.AsInteger := lQuery.FieldByName('PRODUTO').AsInteger;
//      dtmconexao.tblConsultaItensVALOR_UNIT.AsFloat := lQuery.FieldByName('VALOR_UNIT').AsFloat;
//      dtmconexao.tblConsultaItensQTDE.AsFloat := lQuery.FieldByName('QTDE').AsFloat;
//      dtmconexao.tblConsultaItensVALOR_TOTAL.AsFloat := lTotalItem;
//      dtmconexao.tblConsultaItens.Post;
//
//      lSubTotal := lSubTotal + lTotalItem;
//
//      lQuery.Next;
//    end;
//
//    lQuery.First;
//
//    if lSubTotal < lVenda.VALOR_VENDA then
//    begin
//      lFormulario.rdgAcrsDesc.ItemIndex := 1;
//    end
//    else if lSubTotal = lVenda.VALOR_VENDA then
//    begin
//      lFormulario.rdgAcrsDesc.ItemIndex := 0;
//    end
//    else if lSubTotal > lVenda.VALOR_VENDA then
//    begin
//      lFormulario.rdgAcrsDesc.ItemIndex := 2;
//    end;
//
//    lFormulario.edtIdVenda.Text := lVenda.NRNOTA;
//    lFormulario.edtIdCliente.Text := lVenda.CLIENTE.CODIGO.tostring;
//    lFormulario.lblNomeCliente.Caption := lVenda.CLIENTE.NOME;
//
//    lFormulario.edtTipo.Text := lVenda.TIPO_VENDA.tostring;
//
//    lFormulario.lblSubTotalNum.Caption := FormatFloat('#,##0.00', lSubTotal);
//    lFormulario.lblTotalNum.Caption := FormatFloat('#,##0.00', lVenda.VALOR_VENDA);
//    lFormulario.EmissaoAntiga := lVenda.Emissao;
//
//    lFormulario.ShowModal;
//  finally
//    dtmconexao.tblConsultaItens.EmptyDataSet;
//    lFormulario.Free;
//    lVenda.Free;
//    lQuery.Free;
//  end;
end;

procedure TfrmConsultaVenda.Excluir;
var
  lVenda: TVenda;
  lItem: TItem;
begin
  lVenda := TVenda.Create;
  lItem := TItem.Create;
  try
    lVenda.NRNOTA := dtmconexao.qryVenda.FieldByName('NRNOTA').AsInteger;
    lItem.NR_VENDA := dtmconexao.qryVenda.FieldByName('NR_VENDA').AsInteger;

    lItem.Excluir(true);
    lVenda.Excluir(true);

    CarregaVenda;
  finally
    lVenda.Free;
    lItem.Free;
  end;
end;

procedure TfrmConsultaVenda.Relatorio;
var
  lFormulario: TfrmfiltroVenda;
begin
  lFormulario := TfrmfiltroVenda.Create(nil);
  try
    lFormulario.ID := dtmconexao.qryVenda.FieldByName('ID').AsInteger;
    lFormulario.ImprimeRelatorio;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmConsultaVenda.btnIncluirClick(Sender: TObject);
begin
  Incluir;
end;

procedure TfrmConsultaVenda.btnAlterarClick(Sender: TObject);
begin
  if dtmconexao.qryVenda.RecordCount > 0 then
  begin
    Alterar;
  end
  else
  begin
    ShowMessage('Não há registros para serem alterados.');
  end;
end;

procedure TfrmConsultaVenda.btnAtualizarClick(Sender: TObject);
begin
  if dtmconexao.qryVenda.RecordCount > 0 then
  begin
    CarregaVenda;
  end
  else
  begin
    ShowMessage('Não há registros para serem carregados.');
  end;
end;

procedure TfrmConsultaVenda.btnExcluirClick(Sender: TObject);
begin
  if dtmconexao.qryVenda.RecordCount > 0 then
  begin
    Excluir;
  end
  else
  begin
    ShowMessage('Não há registros para serem excluídos.');
  end;
end;

procedure TfrmConsultaVenda.btnRelatClick(Sender: TObject);
begin
  if dtmconexao.qryVenda.RecordCount > 0 then
  begin
    Relatorio;
  end
  else
  begin
    ShowMessage('Não há registros para Imprimir.');
  end;
end;

procedure TfrmConsultaVenda.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConsultaVenda.cbxFiltroChange(Sender: TObject);
begin
  case cbxFiltro.ItemIndex of
    0:
      begin
        edtPesquisar.clear;
        edtPesquisar.SetFocus;
        edtPesquisar.NumbersOnly := true;
      end;
    1:
      begin
        edtPesquisar.clear;
        edtPesquisar.SetFocus;
        edtPesquisar.NumbersOnly := true;
      end;
    2:
      begin
        edtPesquisar.clear;
        edtPesquisar.SetFocus;
        edtPesquisar.NumbersOnly := false;
      end;
  end;
end;

procedure TfrmConsultaVenda.edtPesquisarChange(Sender: TObject);
begin
  CarregaVenda;
end;

procedure TfrmConsultaVenda.FormShow(Sender: TObject);
begin
  inherited;
  CarregaVenda;
  dtpEmissao.DateTime := now;
  edtPesquisar.SetFocus;
end;

end.
