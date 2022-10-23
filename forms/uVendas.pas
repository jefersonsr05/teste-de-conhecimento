unit uVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmVendas = class(TfrmTelaHeranca)
    qryListagemNRNOTA: TIntegerField;
    qryListagemEMISSAO: TDateField;
    qryListagemCLIENTE: TIntegerField;
    qryListagemNOME: TWideStringField;
    qryListagemTIPO_VENDA: TWideStringField;
    qryListagemVALOR_VENDA: TExtendedField;
    qryListagemOPERACAO_VENDA: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

end.
