unit uVenda;

interface

uses
  FireDAC.Comp.Client,
  dconexao,
  Vcl.Dialogs,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  uCliente,
  uItem,
  System.Generics.Collections;

type
  TVenda = class
  private
    FNRNOTA: integer;
    FEMISSAO: TDateTime;
    FCLIENTE: Tcliente;
    FOPERACAO_VENDA: string;
    FTIPO_VENDA: string;
    FVALOR_VENDA: Double;

    FListaVendaItem: TObjectList<TItem>;

    class var FObjetoBusca: TVenda;
  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure Carrega;
    procedure Incluir(pEfetuarCommit: boolean);
    procedure Alterar(pEfetuarCommit: boolean);
    procedure Excluir(pEfetuarCommit: boolean);
    procedure AdicionarVendaItem(pItem: TItem);

    constructor Create;
    class property ObjetoBusca: TVenda read FObjetoBusca write FObjetoBusca;
    class function GeraProximoID: integer;
    class function Existe(pId: integer): boolean;

    property NRNOTA: integer read FNRNOTA write FNRNOTA;
    property EMISSAO: TDateTime read FEMISSAO write FEMISSAO;
    property CLIENTE: Tcliente read FCLIENTE write FCLIENTE;
    property OPERACAO_VENDA: string read FOPERACAO_VENDA write FOPERACAO_VENDA;
    property TIPO_VENDA: string read FTIPO_VENDA write FTIPO_VENDA;
    property VALOR_VENDA: Double read FVALOR_VENDA write FVALOR_VENDA;

    property ListaVendaItem: TObjectList<TItem> read FListaVendaItem write FListaVendaItem;
  end;

implementation

{ TClassDefault }

procedure TVenda.Carrega;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' SELECT                  ');
    lQuery.SQL.Add(' NRNOTA                  ');
    lQuery.SQL.Add(' , EMISSAO               ');
    lQuery.SQL.Add(' , CLIENTE               ');
    lQuery.SQL.Add(' , OPERACAO_VENDA        ');
    lQuery.SQL.Add(' , TIPO_VENDA            ');
    lQuery.SQL.Add(' , VALOR_VENDA           ');
    lQuery.SQL.Add(' FROM VENDAS             ');
    lQuery.SQL.Add(' WHERE NRNOTA = :NRNOTA  ');
    lQuery.ParamByName('NRNOTA').AsInteger := FNRNOTA;
    lQuery.Open;

    if lQuery.RecordCount > 0 then
    begin
      FCLIENTE.CODIGO := lQuery.FieldByName('CLIENTE').AsInteger;
      //FCliente.Carrega;
      //FNRNOTA := lQuery.FieldByName('NRNOTA').AsInteger;
      FEMISSAO := lQuery.FieldByName('EMISSAO').AsInteger;

      FOPERACAO_VENDA := lQuery.FieldByName('OPERACAO_VENDA').AsString;
      FTIPO_VENDA := lQuery.FieldByName('TIPO_VENDA').AsString;
      FVALOR_VENDA := lQuery.FieldByName('VALOR_VENDA').AsInteger;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TVenda.Existe(pId: integer): boolean;
var
  lQuery: TFDQuery;
begin
  result := false;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.SQL.Add('SELECT * FROM VENDAS WHERE NRNOTA = :NRNOTA');
    lQuery.ParamByName('NRNOTA').AsInteger := pId;
    lQuery.Open;

    if (lQuery.RecordCount > 0) then
    begin
      result := true;

      if not Assigned(FObjetoBusca) then
      begin
        FObjetoBusca := TVenda.Create;
      end;

      FObjetoBusca.FNRNOTA := pId;
      FObjetoBusca.Carrega;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TVenda.GeraProximoID: integer;
var
  lQuery: TFDQuery;
begin
  // Criei Class Function para não precisar estanciar a classe.
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' SELECT FIRST(1) NRNOTA FROM VENDAS ORDER BY NRNOTA DESC ');
    lQuery.Open;

    if lQuery.RecordCount > 0 then
    begin
      result := lQuery.FieldByName('NRNOTA').AsInteger + 1;
    end
    else
    begin
      result := 1;
    end;

  finally
    lQuery.Free;
  end;
end;

procedure TVenda.Incluir(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
  I: integer;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' INSERT INTO VENDAS ( ');
    lQuery.SQL.Add(' NRNOTA               ');
    lQuery.SQL.Add(' , EMISSAO            ');
    lQuery.SQL.Add(' , CLIENTE            ');
    lQuery.SQL.Add(' , OPERACAO_VENDA     ');
    lQuery.SQL.Add(' , TIPO_VENDA         ');
    lQuery.SQL.Add(' , VALOR_VENDA        ');
    lQuery.SQL.Add(' )VALUES (            ');
    lQuery.SQL.Add(' :NRNOTA              ');
    lQuery.SQL.Add(' , :EMISSAO           ');
    lQuery.SQL.Add(' , :CLIENTE           ');
    lQuery.SQL.Add(' , :OPERACAO_VENDA    ');
    lQuery.SQL.Add(' , :TIPO_VENDA        ');
    lQuery.SQL.Add(' , :VALOR_VENDA       ');
    lQuery.SQL.Add(' )                    ');

    lQuery.FieldByName('NRNOTA').AsInteger := FNRNOTA;
    lQuery.FieldByName('EMISSAO').AsDateTime := FEMISSAO;
    lQuery.FieldByName('CLIENTE').AsInteger := FCLIENTE.CODIGO;
    lQuery.FieldByName('OPERACAO_VENDA').AsString := FOPERACAO_VENDA;
    lQuery.FieldByName('TIPO_VENDA').AsString := FTIPO_VENDA;
    lQuery.FieldByName('VALOR_VENDA').AsFloat := FVALOR_VENDA;
    lQuery.ExecSQL;

    if FListaVendaItem.Count > 0 then
    begin
      for I := 0 to FListaVendaItem.Count - 1 do
      begin
        FListaVendaItem[I].Incluir(false);
      end;
    end;

    if pEfetuarCommit = true then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TVenda.Alterar(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' UPDATE VENDA SET                   ');
    lQuery.SQL.Add(' EMISSAO = :EMISSAO                 ');
    lQuery.SQL.Add(' , CLIENTE = :CLIENTE               ');
    lQuery.SQL.Add(' , OPERACAO_VENDA = :OPERACAO_VENDA ');
    lQuery.SQL.Add(' , TIPO_VENDA = :TIPO_VENDA         ');
    lQuery.SQL.Add(' , VALOR_VENDA = :VALOR_VENDA       ');
    lQuery.SQL.Add(' WHERE NRNOTA = :NRNOTA             ');

    lQuery.FieldByName('NRNOTA').AsInteger := FNRNOTA;
    lQuery.FieldByName('EMISSAO').AsDateTime := FEMISSAO;
    lQuery.FieldByName('CLIENTE').AsInteger := FCLIENTE.CODIGO;
    lQuery.FieldByName('OPERACAO_VENDA').AsString := FOPERACAO_VENDA;
    lQuery.FieldByName('TIPO_VENDA').AsString := FTIPO_VENDA;
    lQuery.FieldByName('VALOR_VENDA').AsFloat := FVALOR_VENDA;

    lQuery.ExecSQL;

    if pEfetuarCommit = true then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TVenda.Excluir(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    if (MessageDlg('Confirma a Exclusão da Venda: ' + FNRNOTA.ToString + '?',
      mtInformation, [mbyes, mbno], 0) = mryes) then
    begin
      lQuery.Connection := dtmConexao.FDConnection;
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add(' DELETE FROM VENDAS    ');
      lQuery.SQL.Add(' WHERE NRNOTA = :NRNOTA       ');
      lQuery.ParamByName('NRNOTA').AsInteger := FNRNOTA;
      lQuery.ExecSQL;

      if pEfetuarCommit = true then
      begin
        dtmConexao.FDConnection.Commit;
      end;
    end;
  except
    begin
      MessageDlg('Problema na Exclusão da Venda da O.S. ' +
        'Favor tentar mais tarde e conferir rotina !!!', mtError, [mbOK], 0);
    end;
    Screen.Cursor := crDefault;
  end;
end;

procedure TVenda.AdicionarVendaItem(pItem: TItem);
var
  I: integer;
begin
  FListaVendaItem.Add(TItem.Create);
  I := FListaVendaItem.Count - 1;
  FListaVendaItem[I].NR_VENDA := pItem.NR_VENDA;
  FListaVendaItem[I].Produto.CODIGO := pItem.Produto.CODIGO;
  FListaVendaItem[I].QTDE := pItem.QTDE;
  FListaVendaItem[I].VALOR_UNIT := pItem.VALOR_UNIT;
  FListaVendaItem[I].VALOR_TOTAL := pItem.VALOR_TOTAL;
end;

procedure TVenda.Inicializar;
begin
  FNRNOTA := 0;
  FOPERACAO_VENDA := EmptyStr;
  FTIPO_VENDA := EmptyStr;
  FVALOR_VENDA := 0;
end;

constructor TVenda.Create;
begin
  Inicializar;
  FCliente := Tcliente.Create;
  FListaVendaItem := TObjectList<TItem>.Create;
end;

destructor TVenda.Destroy;
begin
  inherited;
  FCliente.Free;
  FListaVendaItem.Free;
end;

end.
