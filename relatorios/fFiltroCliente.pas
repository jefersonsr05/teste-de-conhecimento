unit fFiltroCliente;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  fRelatorioCliente;

type
  TfrmFiltroCliente = class(TForm)
    Panel1: TPanel;
    chkListaTodos: TCheckBox;
    rdgOrdem: TRadioGroup;
    pnlBotoes: TPanel;
    btnVisualizar: TButton;
    pnlTitulo: TPanel;
    edtBusca: TEdit;
    rdgBusca: TRadioGroup;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure chkListaTodosClick(Sender: TObject);
  private
    { Private declarations }
    FRelatorio: TfrmRelatorioCliente;
  public
    { Public declarations }
  end;

var
  frmFiltroCliente: TfrmFiltroCliente;

implementation

{$R *.dfm}

procedure TfrmFiltroCliente.btnVisualizarClick(Sender: TObject);
begin
  FRelatorio := TfrmRelatorioCliente.create(nil);
  try
    FRelatorio.DataSource1.DataSet := FRelatorio.qryRelatorio;
    FRelatorio.rlpRelatorio.datasource := FRelatorio.DataSource1;

    FRelatorio.qryRelatorio.close;
    FRelatorio.qryRelatorio.SQL.clear;
    FRelatorio.qryRelatorio.SQL.Add('SELECT * FROM CLIENTE');

    if not chkListaTodos.checked then
    begin
      case rdgBusca.ItemIndex of
        0:
          begin
            FRelatorio.qryRelatorio.SQL.Add('WHERE CODIGO LIKE' +
              QuotedStr('%' + edtBusca.Text + '%'));
          end;
        1:
          begin
            FRelatorio.qryRelatorio.SQL.Add('WHERE NOME LIKE' +
              QuotedStr('%' + edtBusca.Text + '%'));
          end;
        2:
          begin
            FRelatorio.qryRelatorio.SQL.Add('WHERE EMAIL LIKE' +
              QuotedStr('%' + edtBusca.Text + '%'));
          end;
      end;
    end;

    case rdgOrdem.ItemIndex of
        0:
          begin
            FRelatorio.qryRelatorio.SQL.Add('ORDER BY CODIGO');
          end;
        1:
          begin
            FRelatorio.qryRelatorio.SQL.Add('ORDER BY NOME');
          end;
        2:
          begin
            FRelatorio.qryRelatorio.SQL.Add('ORDER BY CEP');
          end;
      end;

    FRelatorio.qryRelatorio.Open;

    FRelatorio.rlpRelatorio.preview;
  finally
    FRelatorio.Free;
  end;
end;

procedure TfrmFiltroCliente.chkListaTodosClick(Sender: TObject);
begin
  if chkListaTodos.Checked then
  begin
    edtBusca.text := emptystr;
  end;
end;

procedure TfrmFiltroCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
