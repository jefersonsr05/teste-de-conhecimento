unit fRelatorioProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fRelatorioDefault, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, uProduto;

type
  TfrmRelatorioProduto = class(TfrmRelatorioDefault)
    RLDBText1: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    lblUnidade: TRLLabel;
    RLDBText2: TRLDBText;
    txtUnidade: TRLDBText;
    txtPreco: TRLDBText;
    RLDBText5: TRLDBText;
    txtData: TRLDBText;
    txtCodigo: TRLDBText;
    lblPreco: TRLLabel;
    RLLabel5: TRLLabel;
    lblData: TRLLabel;
    lblCodigo: TRLLabel;
    qryRelatorioCODIGO: TIntegerField;
    qryRelatorioDESCRICAO: TStringField;
    qryRelatorioREFERENCIA: TStringField;
    qryRelatorioUNIDADE: TStringField;
    qryRelatorioDATA_VENDA: TDateField;
    qryRelatorioPRECO_VENDA: TBCDField;
    qryRelatorioSALDO: TBCDField;
    procedure RLImage1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioProduto: TfrmRelatorioProduto;

implementation

{$R *.dfm}

procedure TfrmRelatorioProduto.RLImage1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  lProduto: TProduto;
begin
  lProduto := TProduto.Create;
  lProduto.ID := qryRelatorio.FieldByName('ID').asinteger;
  lProduto.carrega; // aqui carrega propriedades do cliente na classe

  lProduto.CarregaRLImagem(RLImage1);
end;

end.
