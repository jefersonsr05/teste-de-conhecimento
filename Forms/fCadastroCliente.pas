unit fCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadastroCliente = class(TfrmCadastroPai)
    FDQueryCadastroCODIGO: TIntegerField;
    FDQueryCadastroNOME: TWideStringField;
    FDQueryCadastroENDERECO: TWideStringField;
    FDQueryCadastroBAIRRO: TWideStringField;
    FDQueryCadastroCIDADE: TWideStringField;
    FDQueryCadastroCEP: TWideStringField;
    FDQueryCadastroUF: TWideStringField;
    FDQueryCadastroFONE: TWideStringField;
    FDQueryCadastroCELULAR: TWideStringField;
    FDQueryCadastroEMAIL: TWideStringField;
    LabelNome: TLabel;
    DBEditNome: TDBEdit;
    LabelCodigo: TLabel;
    LabelEndereco: TLabel;
    DBEditEndereco: TDBEdit;
    LabelBairro: TLabel;
    DBEditBairro: TDBEdit;
    LabelCidade: TLabel;
    DBEditCidade: TDBEdit;
    LabelCep: TLabel;
    DBEditCep: TDBEdit;
    LabelUf: TLabel;
    DBEditUf: TDBEdit;
    LabelFone: TLabel;
    DBEditFone: TDBEdit;
    LabelCelular: TLabel;
    DBEditCelular: TDBEdit;
    LabelEmail: TLabel;
    DBEditEmail: TDBEdit;
    DBEditCodigo: TDBEdit;
    Edit1: TEdit;
    procedure BitBtnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

procedure TfrmCadastroCliente.BitBtnNovoClick(Sender: TObject);

var
  cod: String;

begin

   FDQueryCadastro.Active := False;
   FDQueryCadastro.SQL.Text := 'select max(codigo) from cliente';
   FDQueryCadastro.Active := True;

   if FDQueryCadastro.IsEmpty then
      cod :='1'
   else
      cod := InttoStr(FDQueryCadastro.FieldByName('CODIGO').AsInteger + 1)
end;

end.
