unit fVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmVenda: TfrmVenda;

implementation

{$R *.dfm}

uses fPrincipal, dConexao, fCliente, fProduto, fConsultaVenda;

procedure TfrmVenda.btnCancelarFrmClick(Sender: TObject);
begin
frmVenda.close; // fecha tela
end;

procedure TfrmVenda.btnConfirmarClick(Sender: TObject);
begin
var
  lTotal: Double;
begin
  if edtProduto.Text <> EmptyStr then
  begin
    if StrToFloat(edtProduto.Text) > 0.5 then
    begin
    lTotal := StrToFloat(edtTotal.Text);
    tblItem.append;
    tblItemLcto.AsString := edtNrVenda.Text;
    tblItemProduto.AsString := edtProduto.Text;
    tblItemQuantidade.AsString := edtQuantidade.Text;
    tblItemValorUnitario.AsString := edtValor.Text;
    tblItemValorTotal.AsString := edtTotal.Text;
    tblItem.Post;
     // edtTotal.Caption := FormatFloat('#,##0.00', StrToFloat(edtTotal.Caption) + lTotal);
     // AlimentaLabelTotal;
      LimparCampos;
    end
    else
    begin
      ShowMessage('Não é permitido vender abaixo de 0,5 unidades.');
      LimparCampos;
    end;
  end
  else
  begin
    ShowMessage('Nenhum produto foi selecionado.');
    LimparCampos;
  end;
end;
end;
procedure TfrmVenda.LimparCampos;
begin
        edtCliente.clear;
        cmbOperacaoVenda.clear;
        cmbTipoVenda.clear;
        edtProduto.clear;
        edtQuantidade.clear;
        edtValor.clear;
        edtTotal.clear;

end;

end.
