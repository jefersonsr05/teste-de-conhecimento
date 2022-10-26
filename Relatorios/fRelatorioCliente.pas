unit fRelatorioCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet;

type
  TfrmRelatorioCliente = class(TForm)
    frxDb: TfrxDBDataset;
    frxReport: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioCliente: TfrmRelatorioCliente;

implementation

{$R *.dfm}

uses dConexao, fCliente, fPrincipal, fConsultaVenda, fProduto, fVenda;

end.
