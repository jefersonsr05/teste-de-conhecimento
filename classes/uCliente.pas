unit uCliente;

interface

uses
  FireDAC.Comp.Client,
  dconexao,
  Vcl.Dialogs,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  RLReport,
  uHelpersImagensBase64,
  uHelpersrlImagensBase64;

type
  TCliente = class
  private
    FCODIGO: integer;
    FNOME: string;
    FENDERECO: string;
    FBAIRRO: string;
    FCIDADE: string;
    FCEP: string;
    FUF: string;
    FFONE: string;
    FCELULAR: string;
    FEMAIL: string;

    class var FObjetoBusca: TCliente;
  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure Carrega;
    procedure Incluir(pEfetuarCommit: boolean);
    procedure Alterar(pEfetuarCommit: boolean);
    procedure Excluir(pEfetuarCommit: boolean);

    constructor Create;
    class property ObjetoBusca: TCliente read FObjetoBusca write FObjetoBusca;
    class function GeraProximoID: integer;
    class function ValidaCPF(Const s: String): boolean;
    class function ValidaCNPJ(Const s: String): boolean;
    class function Existe(pId: integer): boolean;

    property CODIGO: integer read FCODIGO write FCODIGO;
    property NOME: string read FNOME write FNOME;
    property ENDERECO: string read FENDERECO write FENDERECO;
    property BAIRRO: string read FBAIRRO write FBAIRRO;
    property CIDADE: string read FCIDADE write FCIDADE;
    property CEP: string read FCEP write FCEP;
    property UF: string read FUF write FUF;
    property FONE: string read FFONE write FFONE;
    property CELULAR: string read FCELULAR write FCELULAR;
    property EMAIL: string read FEMAIL write FEMAIL;

  end;

implementation

{ TCliente }

procedure TCliente.Carrega;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' SELECT       ');
    lQuery.SQL.Add(' CODIGO       ');
    lQuery.SQL.Add(' , NOME       ');
    lQuery.SQL.Add(' , ENDERECO   ');
    lQuery.SQL.Add(' , BAIRRO     ');
    lQuery.SQL.Add(' , CIDADE     ');
    lQuery.SQL.Add(' , CEP        ');
    lQuery.SQL.Add(' , UF         ');
    lQuery.SQL.Add(' , FONE       ');
    lQuery.SQL.Add(' , CELULAR    ');
    lQuery.SQL.Add(' , EMAIL      ');
    lQuery.SQL.Add(' FROM CLIENTE ');
    lQuery.Open;
    lQuery.FetchAll;

    if lQuery.RecordCount > 0 then
    begin
      FCODIGO := lQuery.FieldByName('CODIGO').AsInteger;
      FNOME := lQuery.FieldByName('NOME').AsString;
      FENDERECO := lQuery.FieldByName('ENDERECO').AsString;
      FBAIRRO := lQuery.FieldByName('BAIRRO').AsString;
      FCIDADE := lQuery.FieldByName('CIDADE').AsString;
      FCEP := lQuery.FieldByName('CEP').AsString;
      FUF := lQuery.FieldByName('UF').AsString;
      FFONE := lQuery.FieldByName('FONE').AsString;
      FCELULAR := lQuery.FieldByName('CELULAR').AsString;
      FEMAIL := lQuery.FieldByName('EMAIL').AsString;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TCliente.Existe(pId: integer): boolean;
var
  lQuery: TFDQuery;
begin
  result := false;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.SQL.Add('SELECT * FROM CLIENTE WHERE ID = :CODIGO');
    lQuery.ParamByName('CODIGO').AsInteger := pId;
    lQuery.Open;

    if (lQuery.RecordCount > 0) then
    begin
      result := true;

      if not Assigned(FObjetoBusca) then
      begin
        FObjetoBusca := TCliente.Create;
      end;
      FObjetoBusca.Carrega;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TCliente.GeraProximoID: integer;
var
  lQuery: TFDQuery;
begin
  // Criei Class Function para não precisar estanciar a classe cliente.
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' SELECT FIRST(1) CODIGO FROM CLIENTE ORDER BY CODIGO DESC');
    lQuery.Open;

    if lQuery.RecordCount > 0 then
    begin
      result := lQuery.FieldByName('codigo').AsInteger + 1;
    end
    else
    begin
      result := 1;
    end;

  finally
    lQuery.Free;
  end;
end;

procedure TCliente.Incluir(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' INSERT INTO CLIENTE ( ');
    lQuery.SQL.Add(' CODIGO                ');
    lQuery.SQL.Add(' , NOME                ');
    lQuery.SQL.Add(' , ENDERECO            ');
    lQuery.SQL.Add(' , BAIRRO              ');
    lQuery.SQL.Add(' , CIDADE              ');
    lQuery.SQL.Add(' , CEP                 ');
    lQuery.SQL.Add(' , UF                  ');
    lQuery.SQL.Add(' , FONE                ');
    lQuery.SQL.Add(' , CELULAR             ');
    lQuery.SQL.Add(' , EMAIL               ');
    lQuery.SQL.Add(' )                     ');
    lQuery.SQL.Add(' VALUES (              ');
    lQuery.SQL.Add(' :CODIGO               ');
    lQuery.SQL.Add(' , :NOME               ');
    lQuery.SQL.Add(' , :ENDERECO           ');
    lQuery.SQL.Add(' , :BAIRRO             ');
    lQuery.SQL.Add(' , :CIDADE             ');
    lQuery.SQL.Add(' , :CEP                ');
    lQuery.SQL.Add(' , :UF                 ');
    lQuery.SQL.Add(' , :FONE               ');
    lQuery.SQL.Add(' , :CELULAR            ');
    lQuery.SQL.Add(' , :EMAIL              ');
    lQuery.SQL.Add(' )                     ');

    lQuery.ParamByName('CODIGO').AsInteger := FCODIGO;
    lQuery.ParamByName('NOME').AsString := FNOME;
    lQuery.ParamByName('ENDERECO').AsString := FENDERECO;
    lQuery.ParamByName('BAIRRO').AsString := FBAIRRO;
    lQuery.ParamByName('CIDADE').AsString := FCIDADE;
    lQuery.ParamByName('CEP').AsString := FCEP;
    lQuery.ParamByName('UF').AsString := FUF;
    lQuery.ParamByName('FONE').AsString := FFONE;
    lQuery.ParamByName('CELULAR').AsString := FCELULAR;
    lQuery.ParamByName('EMAIL').AsString := FEMAIL;
    lQuery.ExecSQL;

    if pEfetuarCommit then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TCliente.Alterar(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' UPDATE CLIENTE SET      ');
    lQuery.SQL.Add('   NOME = :NOME          ');
    lQuery.SQL.Add('  , ENDERECO = :ENDERECO ');
    lQuery.SQL.Add('  , BAIRRO = :BAIRRO     ');
    lQuery.SQL.Add('  , CIDADE = :CIDADE     ');
    lQuery.SQL.Add('  , CEP = :CEP           ');
    lQuery.SQL.Add('  , UF = :UF             ');
    lQuery.SQL.Add('  , FONE = :FONE         ');
    lQuery.SQL.Add('  , CELULAR = :CELULAR   ');
    lQuery.SQL.Add('  , EMAIL = :EMAIL       ');
    lQuery.SQL.Add(' WHERE CODIGO = :CODIGO  ');

    lQuery.ParamByName('CODIGO').AsInteger := FCODIGO;
    lQuery.ParamByName('NOME').AsString := FNOME;
    lQuery.ParamByName('ENDERECO').AsString := FENDERECO;
    lQuery.ParamByName('BAIRRO').AsString := FBAIRRO;
    lQuery.ParamByName('CIDADE').AsString := FCIDADE;
    lQuery.ParamByName('CEP').AsString := FCEP;
    lQuery.ParamByName('UF').AsString := FUF;
    lQuery.ParamByName('FONE').AsString := FFONE;
    lQuery.ParamByName('CELULAR').AsString := FCELULAR;
    lQuery.ParamByName('EMAIL').AsString := FEMAIL;
    lQuery.ExecSQL;

    if pEfetuarCommit then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TCliente.Excluir(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    if (MessageDlg('Confirma a Exclusão do Cliente: ' + FCODIGO.ToString + '-' +
      FNOME + ' ?', mtInformation, [mbyes, mbno], 0) = mryes) then
    begin
      lQuery.Connection := dtmConexao.FDConnection;
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.Add(' DELETE FROM CLIENTE ');
      lQuery.SQL.Add(' WHERE CODIGO = :CODIGO ');
      lQuery.ParamByName('CODIGO').AsInteger := FCODIGO;
      lQuery.ExecSQL;

      if pEfetuarCommit = true then
      begin
        dtmConexao.FDConnection.Commit;
      end;
    end;
  except
    begin
      MessageDlg('Problema na Exclusão do Cliente da O.S. ' +
        'Favor tentar mais tarde e conferir rotina !!!', mtError, [mbOK], 0);
    end;
    Screen.Cursor := crDefault;
  end;
end;

procedure TCliente.Inicializar;
begin
  FCODIGO := 0;
  FNOME := EmptyStr;
  FENDERECO := EmptyStr;
  FBAIRRO := EmptyStr;
  FCIDADE := EmptyStr;
  FCEP := EmptyStr;
  FUF := EmptyStr;
  FFONE := EmptyStr;
  FCELULAR := EmptyStr;
  FEMAIL := EmptyStr;
end;

constructor TCliente.Create;
begin
  Inicializar;
end;

destructor TCliente.Destroy;
begin
  inherited;
end;

class function TCliente.ValidaCNPJ(const s: string): boolean;
var
  aDig: array [1 .. 14] of Byte; // array q armazena os valores do CAdastro
  i, Resto: Byte;
  DV1, DV2: Byte;

  Total1, Total2: integer;

begin
  result := false;
  if Length(trim(s)) = 14 then
  begin
    for i := 1 to 14 do
      try
        aDig[i] := StrToInt(s[i]);
      except
        aDig[i] := 0;
      end;
    Total1 := aDig[1] * 5 + aDig[2] * 4 + aDig[3] * 3 + aDig[4] * 2 + aDig[5] *
      9 + aDig[6] * 8 + aDig[7] * 7 + aDig[8] * 6 + aDig[9] * 5 + aDig[10] * 4 +
      aDig[11] * 3 + aDig[12] * 2;
    Resto := Total1 mod 11;
    if Resto > 1 then
      DV1 := 11 - Resto
    else
      DV1 := 0;
    Total2 := aDig[1] * 6 + aDig[2] * 5 + aDig[3] * 4 + aDig[4] * 3 + aDig[5] *
      2 + aDig[6] * 9 + aDig[7] * 8 + aDig[8] * 7 + aDig[9] * 6 + aDig[10] * 5 +
      aDig[11] * 4 + aDig[12] * 3 + DV1 * 2;
    Resto := Total2 mod 11;
    if Resto > 1 then
      DV2 := 11 - Resto
    else
      DV2 := 0;
    if (DV1 = aDig[13]) and (DV2 = aDig[14]) then
      result := true;
  end;

end;

class function TCliente.ValidaCPF(const s: string): boolean;
var
  i, a, Numero, Resto: Byte;
  DV1, DV2: Byte;
  Total, Soma: integer;
  res: string;
begin
  result := false;
  if Length(trim(s)) = 11 then
  begin

    // Não digitar 11 numeros iguais
    for a := 0 to 9 do // percorre os nr iguais
    begin
      res := '';
      for i := 1 to 11 do // repete o nr para formar o CPF igual
        res := res + IntToStr(a);
      if s = res then // se o CPF for igual os nr repetido cai fora
      begin
        result := false;
        Exit;
      end;
    end;
    // fim não digitar nr iguais

    Total := 0;
    Soma := 0;
    for i := 1 to 9 do
    begin
      try
        Numero := StrToInt(s[i]);
      except
        Numero := 0;
      end;
      Total := Total + (Numero * (11 - i));
      Soma := Soma + Numero;
    end;
    Resto := Total mod 11;
    if Resto > 1 then
      DV1 := 11 - Resto
    else
      DV1 := 0;
    Total := Total + Soma + 2 * DV1;
    Resto := Total mod 11;
    if Resto > 1 then
      DV2 := 11 - Resto
    else
      DV2 := 0;
    if (IntToStr(DV1) = s[10]) and (IntToStr(DV2) = s[11]) then
      result := true;
  end;
end;

end.
