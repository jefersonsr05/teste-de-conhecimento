unit fCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadastroProdutos = class(TfrmCadastroPai)
    FDQueryCadastroCODIGO: TIntegerField;
    FDQueryCadastroDESCRICAO: TWideStringField;
    FDQueryCadastroREFERENCIA: TWideStringField;
    FDQueryCadastroUNIDADE: TWideStringField;
    FDQueryCadastroDATA_VENDA: TDateField;
    FDQueryCadastroPRECO_VENDA: TBCDField;
    FDQueryCadastroSALDO: TBCDField;
    LabelCodigo: TLabel;
    DBEditCodigo: TDBEdit;
    LabelDescricao: TLabel;
    DBEditDescricao: TDBEdit;
    LabelReferencia: TLabel;
    DBEditreferencia: TDBEdit;
    LabelUnidade: TLabel;
    DBEditUnidade: TDBEdit;
    LabelDataVenda: TLabel;
    DBEditDataVenda: TDBEdit;
    LabelPrecoVenda: TLabel;
    DBEditPrecoVenda: TDBEdit;
    LabelSaldo: TLabel;
    DBEditSaldo: TDBEdit;
    procedure limpa;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProdutos: TfrmCadastroProdutos;

implementation

{$R *.dfm}

{ TfrmCadastroPai1 }

procedure TfrmCadastroProdutos.limpa;
var
  i: integer;
begin

  //  Limpa os campos
  for i := 0 to frmCadastroProdutos.ComponentCount -1 do
  begin
    if frmCadastroProdutos.Components[i] is TDBEdit then
      TDBEdit(frmCadastroProdutos.Components[i]).Clear

  end;
end;

end.
