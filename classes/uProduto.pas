unit uProduto;

interface

uses
  FireDAC.Comp.Client,
  dconexao,
  Vcl.Dialogs,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  RLReport;

type
  TProduto = class
  private
    FCODIGO: Integer;
    FDESCRICAO: string;
    FREFERENCIA: string;
    FUNIDADE: string;
    FDATA_VENDA: TDateTime;
    FPRECO_VENDA: Double;
    FSALDO: Double;

    class var FObjetoBusca: TProduto;
  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure Carrega;
    procedure Incluir(pEfetuarCommit: boolean);
    procedure Alterar(pEfetuarCommit: boolean);
    procedure Excluir(pEfetuarCommit: boolean);

    constructor Create;
    class property ObjetoBusca: TProduto read FObjetoBusca write FObjetoBusca;
    class function GeraProximoID: Integer;
    class function Existe(pId: Integer): boolean;

    property CODIGO: Integer read FCODIGO write FCODIGO;
    property DESCRICAO: string read FDESCRICAO write FDESCRICAO;
    property REFERENCIA: string read FREFERENCIA write FREFERENCIA;
    property UNIDADE: string read FUNIDADE write FUNIDADE;
    property DATA_VENDA: TDateTime read FDATA_VENDA write FDATA_VENDA;
    property PRECO_VENDA: Double read FPRECO_VENDA write FPRECO_VENDA;
    property SALDO: Double read FSALDO write FSALDO;

  end;

implementation

{ TClassDefault }

procedure TProduto.Carrega;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' SELECT        ');
    lQuery.SQL.Add(' CODIGO        ');
    lQuery.SQL.Add(' , DESCRICAO   ');
    lQuery.SQL.Add(' , REFERENCIA  ');
    lQuery.SQL.Add(' , UNIDADE     ');
    lQuery.SQL.Add(' , DATA_VENDA  ');
    lQuery.SQL.Add(' , PRECO_VENDA ');
    lQuery.SQL.Add(' , SALDO       ');
    lQuery.SQL.Add(' FROM PRODUTOS ');
    lQuery.SQL.Add(' WHERE CODIGO = :CODIGO  ');
    lQuery.ParamByName('CODIGO').AsInteger := FCODIGO;
    lQuery.Open;
    lQuery.FetchAll;

    if lQuery.RecordCount > 0 then
    begin
      //FCODIGO := lQuery.ParamByName('CODIGO').AsInteger;
      FDESCRICAO := lQuery.ParamByName('DESCRICAO').AsString;
      FREFERENCIA := lQuery.ParamByName('REFERENCIA').AsString;
      FUNIDADE := lQuery.ParamByName('UNIDADE').AsString;
      FDATA_VENDA := lQuery.ParamByName('FDATA_VENDA').AsDateTime;
      FPRECO_VENDA := lQuery.ParamByName('PRECO_VENDA').AsFloat;
      FSALDO := lQuery.ParamByName('SALDO').AsFloat;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TProduto.Existe(pId: Integer): boolean;
var
  lQuery: TFDQuery;
begin
  result := false;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.SQL.Add('SELECT * FROM PRODUTOS WHERE CODIGO = :CODIGO');
    lQuery.ParamByName('CODIGO').AsInteger := pId;
    lQuery.Open;

    if (lQuery.RecordCount > 0) then
    begin
      result := true;

      if not Assigned(FObjetoBusca) then
      begin
        FObjetoBusca := TProduto.Create;
      end;

      FObjetoBusca.FCODIGO := pId;
      FObjetoBusca.Carrega;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TProduto.GeraProximoID: Integer;
var
  lQuery: TFDQuery;
begin
  // Criei Class Function para não precisar estanciar a classe.
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' SELECT FIRST(1) CODIGO FROM PRODUTOS ORDER BY CODIGO DESC');
    lQuery.Open;

    if lQuery.RecordCount > 0 then
    begin
      result := lQuery.FieldByName('CODIGO').AsInteger + 1;
    end
    else
    begin
      result := 1;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TProduto.Incluir(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' INSERT INTO PRODUTOS ( ');
    lQuery.SQL.Add(' CODIGO                ');
    lQuery.SQL.Add(' , DESCRICAO           ');
    lQuery.SQL.Add(' , REFERENCIA          ');
    lQuery.SQL.Add(' , UNIDADE             ');
    lQuery.SQL.Add(' , DATA_VENDA          ');
    lQuery.SQL.Add(' , PRECO_VENDA         ');
    lQuery.SQL.Add(' , SALDO               ');
    lQuery.SQL.Add(' )VALUES (             ');
    lQuery.SQL.Add(' :CODIGO               ');
    lQuery.SQL.Add(' , :DESCRICAO          ');
    lQuery.SQL.Add(' , :REFERENCIA         ');
    lQuery.SQL.Add(' , :UNIDADE            ');
    lQuery.SQL.Add(' , :DATA_VENDA         ');
    lQuery.SQL.Add(' , :PRECO_VENDA        ');
    lQuery.SQL.Add(' , :SALDO              ');
    lQuery.SQL.Add(' )                     ');

    lQuery.ParamByName('CODIGO').AsInteger := FCODIGO;
    lQuery.ParamByName('DESCRICAO').AsString := FDESCRICAO;
    lQuery.ParamByName('REFERENCIA').AsString := FREFERENCIA;
    lQuery.ParamByName('UNIDADE').AsString := FUNIDADE;
    lQuery.ParamByName('DATA_VENDA').AsDate := FDATA_VENDA;
    lQuery.ParamByName('PRECO_VENDA').AsFloat := FPRECO_VENDA;
    lQuery.ParamByName('SALDO').AsFloat := FSALDO;
    lQuery.ExecSQL;

    if pEfetuarCommit = true then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TProduto.Alterar(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' UPDATE PRODUTOS SET           ');
    lQuery.SQL.Add(' DESCRICAO = :DESCRICAO       ');
    lQuery.SQL.Add(' , REFERENCIA = :REFERENCIA   ');
    lQuery.SQL.Add(' , UNIDADE = :UNIDADE         ');
    lQuery.SQL.Add(' , DATA_VENDA = :DATA_VENDA   ');
    lQuery.SQL.Add(' , PRECO_VENDA = :PRECO_VENDA ');
    lQuery.SQL.Add(' , SALDO = :SALDO             ');
    lQuery.SQL.Add(' WHERE CODIGO = :CODIGO       ');

    lQuery.ParamByName('CODIGO').AsInteger := FCODIGO;
    lQuery.ParamByName('DESCRICAO').AsString := FDESCRICAO;
    lQuery.ParamByName('REFERENCIA').AsString := FREFERENCIA;
    lQuery.ParamByName('UNIDADE').AsString := FUNIDADE;
    lQuery.ParamByName('DATA_VENDA').AsDate := FDATA_VENDA;
    lQuery.ParamByName('PRECO_VENDA').AsFloat := FPRECO_VENDA;
    lQuery.ParamByName('SALDO').AsFloat := FSALDO;
    lQuery.ExecSQL;

    if pEfetuarCommit = true then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TProduto.Excluir(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    if (MessageDlg('Confirma a Exclusão do Produto: ' + FCODIGO.ToString + '-' +
      FDESCRICAO + ' ?', mtInformation, [mbyes, mbno], 0) = mryes) then
    begin
      lQuery.Connection := dtmConexao.FDConnection;
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add(' DELETE FROM PRODUTOS     ');
      lQuery.SQL.Add(' WHERE CODIGO = :CODIGO  ');
      lQuery.ParamByName('CODIGO').AsInteger := FCODIGO;
      lQuery.ExecSQL;

      if pEfetuarCommit = true then
      begin
        dtmConexao.FDConnection.Commit;
      end;
    end;
  except
    begin
      MessageDlg('Problema na Exclusão do Produto da O.S. ' +
        'Favor tentar mais tarde e conferir rotina !!!', mtError, [mbOK], 0);
    end;
    Screen.Cursor := crDefault;
  end;
end;

procedure TProduto.Inicializar;
begin
  FCODIGO := 0;
  FDESCRICAO := EmptyStr;
  FREFERENCIA := EmptyStr;
  FUNIDADE := EmptyStr;
  FPRECO_VENDA := 0;
  FSALDO := 0;
end;

constructor TProduto.Create;
begin
  Inicializar;
end;

destructor TProduto.Destroy;
begin
  inherited;
end;

end.
