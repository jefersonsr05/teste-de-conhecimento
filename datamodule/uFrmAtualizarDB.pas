unit uFrmAtualizarDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmAtualizarDB = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    chkConexao: TCheckBox;
    chkProdutos: TCheckBox;
    chkClientes: TCheckBox;
    chkItens: TCheckBox;
    chkVendas: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizarDB: TfrmAtualizarDB;

implementation

{$R *.dfm}

end.
