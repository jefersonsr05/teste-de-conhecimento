unit uItem;

interface

uses
  FireDAC.Comp.Client
  , dconexao
  , Vcl.Dialogs
  , System.SysUtils
  , Vcl.Controls
  , Vcl.Forms
  , uProduto;

type
  TItem = class
  private
    FLCTO: Integer;
    FNR_VENDA: Integer;
    FPRODUTO: TProduto;
    FQTDE: Double;
    FVALOR_UNIT: Double;
    FVALOR_TOTAL: Double;

    class var FObjetoBusca: TItem;
  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure Carrega;
    procedure Incluir(pEfetuarCommit: boolean);
    procedure Alterar(pEfetuarCommit: boolean);
    procedure Excluir(pEfetuarCommit: boolean);

    constructor Create;
    class property ObjetoBusca: TItem read FObjetoBusca write FObjetoBusca;
    class function GeraProximoID: integer; static;

    property LCTO: Integer read FLCTO write FLCTO;
    property NR_VENDA: Integer read FNR_VENDA write FNR_VENDA;
    property PRODUTO: TProduto read FPRODUTO write FPRODUTO;
    property QTDE: Double read FQTDE write FQTDE;
    property VALOR_UNIT: Double read FVALOR_UNIT write FVALOR_UNIT;
    property VALOR_TOTAL: Double read FVALOR_TOTAL write FVALOR_TOTAL;
  end;

implementation

{ TClassDefault }

procedure TItem.Carrega;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' SELECT             ');
    lQuery.SQL.Add(' LCTO               ');
    lQuery.SQL.Add(' , NR_VENDA         ');
    lQuery.SQL.Add(' , PRODUTO          ');
    lQuery.SQL.Add(' , QTDE             ');
    lQuery.SQL.Add(' , VALOR_UNIT       ');
    lQuery.SQL.Add(' , VALOR_TOTAL      ');
    lQuery.SQL.Add(' FROM ITEM_VENDA    ');
    lQuery.SQL.Add(' WHERE LCTO = :LCTO ');
    lQuery.ParamByName('NR_VENDA').AsInteger := FNR_VENDA;
    lQuery.Open;

    if lQuery.RecordCount > 0 then
    begin
      FProduto.CODIGO := lQuery.FieldByName('PRODUTO').AsInteger;
      FProduto.Carrega;

      FLCTO := lQuery.ParamByName('LCTO').AsInteger;
//      FNR_VENDA := lQuery.FieldByName('FNR_VENDA').AsInteger;
      FQTDE := lQuery.FieldByName('QTDE').AsFloat;
      FVALOR_UNIT := lQuery.FieldByName('VALOR_UNIT').AsFloat;
      FVALOR_TOTAL := lQuery.FieldByName('VALOR_TOTAL').AsFloat;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TItem.GeraProximoID: integer;
var
  lQuery: TFDQuery;
begin
  // Criei Class Function para não precisar estanciar a classe.
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add
      (' SELECT FIRST(1) LCTO FROM ITEM_VENDA ORDER BY LCTO DESC ');
    lQuery.Open;

    if lQuery.RecordCount > 0 then
    begin
      result := lQuery.FieldByName('LCTO').AsInteger + 1;
    end
    else
    begin
      result := 1;
    end;

  finally
    lQuery.Free;
  end;
end;

procedure TItem.Incluir(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' INSERT INTO ITEM_VENDA (   ');
    lQuery.SQL.Add(' LCTO                       ');
    lQuery.SQL.Add(' , NR_VENDA                 ');
    lQuery.SQL.Add(' , PRODUTO                  ');
    lQuery.SQL.Add(' , QTDE                     ');
    lQuery.SQL.Add(' , VALOR_UNIT               ');
    lQuery.SQL.Add(' , VALOR_TOTAL              ');
    lQuery.SQL.Add(' )VALUES (                  ');
    lQuery.SQL.Add(' :LCTO                      ');
    lQuery.SQL.Add(' , :NR_VENDA                ');
    lQuery.SQL.Add(' , :PRODUTO                 ');
    lQuery.SQL.Add(' , :QTDE                    ');
    lQuery.SQL.Add(' , :VALOR_UNIT              ');
    lQuery.SQL.Add(' , :VALOR_TOTAL             ');
    lQuery.SQL.Add(' )                          ');

    lQuery.ParamByName('LCTO').AsInteger := FLCTO;
    lQuery.FieldByName('PRODUTO').AsInteger := FProduto.CODIGO;
    lQuery.FieldByName('FNR_VENDA').AsInteger := FNR_VENDA;
    lQuery.FieldByName('QTDE').AsFloat := FQTDE;
    lQuery.FieldByName('VALOR_UNIT').AsFloat := FVALOR_UNIT;
    lQuery.FieldByName('VALOR_TOTAL').AsFloat := FVALOR_TOTAL;
    lQuery.ExecSQL;

    if pEfetuarCommit then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TItem.Alterar(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' UPDATE ITEM_VENDA SET        ');
    lQuery.SQL.Add(' LCTO = :LCTO                 ');
    lQuery.SQL.Add(' , NR_VENDA = :NR_VENDA       ');
    lQuery.SQL.Add(' , PRODUTO = :PRODUTO         ');
    lQuery.SQL.Add(' , QTDE = :QTDE               ');
    lQuery.SQL.Add(' , VALOR_UNIT = :VALOR_UNIT   ');
    lQuery.SQL.Add(' , VALOR_TOTAL = :VALOR_TOTAL ');
    lQuery.SQL.Add(' WHERE LCTO = :LCTO           ');

    lQuery.ParamByName('LCTO').AsInteger := FLCTO;
    lQuery.FieldByName('PRODUTO').AsInteger := FProduto.CODIGO;
    lQuery.FieldByName('FNR_VENDA').AsInteger := FNR_VENDA;
    lQuery.FieldByName('QTDE').AsFloat := FQTDE;
    lQuery.FieldByName('VALOR_UNIT').AsFloat := FVALOR_UNIT;
    lQuery.FieldByName('VALOR_TOTAL').AsFloat := FVALOR_TOTAL;
    lQuery.ExecSQL;

    if pEfetuarCommit = true then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TItem.Excluir(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try

    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' DELETE FROM ITEM_VENDA ');
    lQuery.SQL.Add(' WHERE NR_VENDA = :NR_VENDA     ');
    lQuery.ParamByName('NR_VENDA').AsInteger := FNR_VENDA;
    lQuery.ExecSQL;

    if pEfetuarCommit = true then
    begin
      dtmConexao.FDConnection.Commit;
    end;

  except
    begin
      MessageDlg('Problema na Exclusão da Venda da O.S. ' +
        'Favor tentar mais tarde e conferir rotina !!!', mtError, [mbOK], 0);
    end;
    Screen.Cursor := crDefault;
  end;
end;

procedure TItem.Inicializar;
begin
  FLCTO := 0;
  FQTDE := 0;
  FProduto := TProduto.Create;
  NR_VENDA := 0;
  FVALOR_UNIT := 0;
  FVALOR_TOTAL := 0;
end;

constructor TItem.Create;
begin
  Inicializar;
end;

destructor TItem.Destroy;
begin
  inherited;
  FProduto.Free;
end;

end.
