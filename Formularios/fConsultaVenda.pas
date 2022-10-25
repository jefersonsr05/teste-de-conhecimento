unit fConsultaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

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
frmConsultaVenda.close; // fecha tela
end;

end.
