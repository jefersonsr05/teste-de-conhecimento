unit fConsultaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmConsultaVenda = class(TForm)
    pnlFiltros: TPanel;
    pnlBotoes: TPanel;
    pnlTopo: TPanel;
    pnlCentral: TPanel;
    btnAlterar: TButton;
    btnAtualizar: TButton;
    btnExcluir: TButton;
    btnInserir: TButton;
    btnSair: TButton;
    btnRelatorio: TButton;
    dtpFiltroData: TDateTimePicker;
    chbFiltoData: TCheckBox;
    DBGrid1: TDBGrid;
    cmbFiltro: TComboBox;
    Panel1: TPanel;
    pgcPrincipal: TPageControl;
    tbsConsulta: TTabSheet;
    grdProduto: TDBGrid;
    pnlPesquisas: TPanel;
    lblPesquisaProduto: TLabel;
    edtFiltroProduto: TEdit;
    tbsCadastro: TTabSheet;
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
    dtpDataVenda: TDateTimePicker;
    qryConsultaVenda: TFDQuery;
    dtsProduto: TDataSource;
    qryConsultaVendaNRNOTA: TIntegerField;
    qryConsultaVendaEMISSAO: TDateField;
    qryConsultaVendaCLIENTE: TIntegerField;
    qryConsultaVendaTIPO_VENDA: TStringField;
    qryConsultaVendaVALOR_VENDA: TBCDField;
    qryConsultaVendaOPERACAO_VENDA: TStringField;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaVenda: TfrmConsultaVenda;

implementation

{$R *.dfm}

uses dConexao, fPrincipal, fVenda, fCliente, fProduto;

procedure TfrmConsultaVenda.btnSairClick(Sender: TObject);
begin
  close;
end;

end.
