unit fFiltroProduto;

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
  fFiltroDefault,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  fRelatorioProduto;

type
  TfrmFiltroProduto = class(TfrmFiltroDefault)
    rdgFiltro: TRadioGroup;
    Panel4: TPanel;
    rdgBusca: TRadioGroup;
    lblMenValor: TLabel;
    lblMaiValor: TLabel;
    edtMenValor: TEdit;
    edtMaiValor: TEdit;
    procedure btnVisualizarClick(Sender: TObject);
    procedure cbxListaTodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FRelatorio: TfrmRelatorioProduto;
  public
    { Public declarations }
  end;

var
  frmFiltroProduto: TfrmFiltroProduto;

implementation

{$R *.dfm}

procedure TfrmFiltroProduto.btnVisualizarClick(Sender: TObject);
begin
  FRelatorio := TfrmRelatorioProduto.create(nil);
  try

    FRelatorio.DataSource1.DataSet := FRelatorio.qryRelatorio;
    FRelatorio.rlpRelatorio.datasource := FRelatorio.DataSource1;

    FRelatorio.qryRelatorio.close;
    FRelatorio.qryRelatorio.SQL.clear;
    FRelatorio.qryRelatorio.SQL.Add(' SELECT * FROM PRODUTOS ');

    if not cbxListaTodos.Checked then
    begin
      case rdgBusca.ItemIndex of
        0:
          begin
            FRelatorio.qryRelatorio.SQL.Add(' WHERE CUSTO >= ' + QuotedStr('%' + edtMenValor.Text + '%') +
            ' AND CUSTO <= ' + QuotedStr('%' + edtMaiValor.Text + '%'));
          end;
        1:
          begin
            FRelatorio.qryRelatorio.SQL.Add(' WHERE PRECO_VENDA >= ' + QuotedStr('%' + edtMenValor.Text + '%') +
            ' AND PRECO_VENDA <= ' + QuotedStr('%' + edtMaiValor.Text + '%'));
          end;
        2:
          begin
            FRelatorio.qryRelatorio.SQL.Add(' WHERE SALDO >= ' + QuotedStr('%' + edtMenValor.Text + '%') +
            ' AND SALDO <= ' + QuotedStr('%' + edtMaiValor.Text + '%'));
          end;
      end;
    end;


    case rdgFiltro.ItemIndex of
    0:
      begin
        FRelatorio.qryRelatorio.SQL.Add(' ORDER BY CODIGO ');
      end;
    1:
      begin
        FRelatorio.qryRelatorio.SQL.Add(' ORDER BY DESCRICAO ');
      end;
    2:
      begin
        FRelatorio.qryRelatorio.SQL.Add(' ORDER BY DATA_VENDA ');
      end;
    end;


    FRelatorio.qryRelatorio.Open;
    FRelatorio.rlpRelatorio.preview;
  finally
    FRelatorio.Free;
  end;
end;

procedure TfrmFiltroProduto.cbxListaTodosClick(Sender: TObject);
begin
  if cbxListaTodos.Checked then
  begin
    edtMenValor.Text := emptystr;
    edtMaiValor.Text := emptystr;
  end;
end;

procedure TfrmFiltroProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmFiltroProduto.FormShow(Sender: TObject);
begin
  inherited;
  btnLimpar.Visible := False;
end;

end.
