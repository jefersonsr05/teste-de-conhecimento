unit fVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Datasnap.DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmVenda = class(TForm)
    pnlConsulta: TPanel;
    pnlCentral: TPanel;
    pnlRodape: TPanel;
    Vendas: TPanel;
    pnlBotoes: TPanel;
    lblNrNota: TLabel;
    lblCliente: TLabel;
    edtNrVenda: TEdit;
    edtCliente: TEdit;
    imgBuscaCliente: TImage;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValor: TLabel;
    lblTotal: TLabel;
    btnConfirmar: TButton;
    btnExcluirProduto: TButton;
    btnConfirmarFrm: TButton;
    btnCancelarFrm: TButton;
    grtdItem: TDBGrid;
    edtProduto: TEdit;
    edtQuantidade: TEdit;
    imgBuscaProduto: TImage;
    edtValor: TEdit;
    edtTotal: TEdit;
    dtpEmissao: TDateTimePicker;
    lblEmissao: TLabel;
    cmbOperacaoVenda: TComboBox;
    lblOperacaoVenda: TLabel;
    lblTipoVenda: TLabel;
    cmbTipoVenda: TComboBox;
    tblItem: TFDMemTable;
    dtsItens: TDataSource;
    tblItemLcto: TIntegerField;
    tblItemNrVenda: TIntegerField;
    tblItemProduto: TIntegerField;
    tblItemQuantidade: TFloatField;
    tblItemValorUnitario: TFloatField;
    tblItemValorTotal: TFloatField;
    procedure btnCancelarFrmClick(Sender: TObject);

  private
    { Private declarations }
    function RetornaUltimoCodigo: integer;
    procedure LimparCampos;

  public

  end;

var
  frmVenda: TfrmVenda;

implementation

{$R *.dfm}

uses fPrincipal, dConexao, fCliente, fProduto, fConsultaVenda;
{ TfrmVenda }

{ TfrmVenda }

procedure TfrmVenda.btnCancelarFrmClick(Sender: TObject);
begin
  close;
end;

procedure TfrmVenda.LimparCampos;
begin
  edtProduto.clear;
  edtQuantidade.clear;
  edtValor.clear;
  edtTotal.clear;
end;

function TfrmVenda.RetornaUltimoCodigo: integer;
var
  lQuery: TFDQuery;
begin
  Result := 0;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.Conexao; // passei a conexao para qry
    lQuery.close;
    lQuery.SQL.clear;
    lQuery.SQL.add('   select max(nrnota) as codigo from vendas  ');
    lQuery.Open;
    Result := lQuery.FieldByName('nrnota').AsInteger + 1;
  finally
    lQuery.Free;
  end;

end;

end.
