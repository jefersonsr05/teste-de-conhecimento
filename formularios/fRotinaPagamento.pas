unit fRotinaPagamento;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  System.ImageList,
  Vcl.ImgList;

type
  TfrmRotinaPagamento = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    lblNotaTotal: TLabel;
    edtNotaTotal: TEdit;
    btnSalva: TButton;
    lblFormaDePagamento: TLabel;
    rdgFPgto: TRadioGroup;
    rdgOperacao: TRadioGroup;
    dtpVencimento: TDateTimePicker;
    lblDataVencimento: TLabel;
    procedure btnSalvaClick(Sender: TObject);
    procedure rdgFPgtoClick(Sender: TObject);
  private
    { Private declarations }
    FTotal: Double;
  public
    { Public declarations }
  end;

var
  frmRotinaPagamento: TfrmRotinaPagamento;

implementation

{$R *.dfm}



procedure TfrmRotinaPagamento.btnSalvaClick(Sender: TObject);
begin
  close;
end;

procedure TfrmRotinaPagamento.rdgFPgtoClick(Sender: TObject);
begin
  case rdgFPgto.itemIndex of
    0:
    begin
      lblDataVencimento.visible := False;
      dtpVencimento.visible := False;
    end;
    1:
    begin
      lblDataVencimento.visible := True;
      dtpVencimento.visible := True;
    end;
  end;
end;

end.
