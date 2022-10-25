unit cVendas;

interface

uses System.Classes, vcl.Controls, vcl.ExtCtrls, vcl.Dialogs,
      ZAbstractConnection, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset, System.SysUtils,
      data.DB, datasnap.DBClient;

type
  TVendas = class

  private
    { Private declarations }
    ConexaoDB:TZConnection;

    _fNrnota:integer;
    _fEmissao:TDateTime;
    _fCliente:integer;
    _fTipo_Venda:string;
    _fValor_Venda:double;
    _fOperacao_Venda:string;

    function PrimeiroCodigo: boolean;
    function InserirItens(cds: TClientDataSet; nrnota: integer): boolean;

  public
    { Public declarations }
    constructor Create(_Conexao:TZConnection);
    destructor Destroy; override;
    function Inserir(cds:TClientDataSet):boolean;
    function Atualizar:boolean;
    function Apagar:boolean;
    function Selecionar(id:Integer):boolean;

  published
    { Public declarations properties/runtime }
    property nrnota:integer          read _fNrnota          write _fNrnota;
    property emissao:TDateTime       read _fEmissao         write _fEmissao;
    property cliente:integer         read _fCliente         write _fCliente;
    property tipo_Venda:string       read _fTipo_Venda      write _fTipo_Venda;
    property valor_Venda:double      read _fValor_Venda     write _fValor_Venda;
    property operacao_Venda:string   read _fOperacao_Venda   write _fOperacao_Venda;
  end;

implementation

{ TVendas }

{$region 'CONSTRUCTOR AND DESTRUCTOR'}

constructor TVendas.Create(_Conexao: TZConnection);
begin
  ConexaoDB := _Conexao;
end;

destructor TVendas.Destroy;
begin

  inherited;
end;

{$endregion}

{$region 'FUCTIONS E PROCEDURES'}

function TVendas.InserirItens(cds:TClientDataSet; nrnota:integer):boolean;
var qry:TZQuery;
begin
  try
    result := true;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQL.Clear;
    qry.sql.Add('insert into item_venda (lcto,nr_venda,produto,qtde,valor_unit,valor_total)' +
                ' values (1,:nr_venda,:produto,:qtde,:valor_unit,:valor_total)');
    qry.ParamByName('nr_venda').AsInteger := nrnota;
    qry.ParamByName('produto').AsInteger := cds.FieldByName('Código').AsInteger;
    qry.ParamByName('qtde').AsFloat := cds.FieldByName('Quantidade').AsFloat;
    qry.ParamByName('valor_unit').AsFloat := cds.FieldByName('Unitário').AsFloat;
    qry.ParamByName('valor_total').AsFloat := cds.FieldByName('Total').AsFloat;

    try
      qry.ExecSQL;
    except
      result := false;
    end;

  finally
    if Assigned(qry) then
      FreeAndNil(qry)
  end;
end;

{$endregion}

{$region 'CRUD'}

function TVendas.Inserir(cds:TClientDataSet): boolean;
var qry:TZQuery;
IdItens:Integer;
begin
  try
    result := true;
    ConexaoDB.StartTransaction;
    qry:=TZQuery.Create(nil);
    qry.Connection:=ConexaoDB;
    qry.SQL.Clear;
    if (PrimeiroCodigo) then
    begin
      qry.SQL.Add('Insert into venda values (1,:emissao,:cliente,:tipo_venda,:valor_venda,:operacao_venda)');
      qry.ParamByName('emissao').AsDateTime := self._fEmissao;
      qry.ParamByName('cliente').AsInteger := self._fCliente;
      qry.ParamByName('valor_venda').AsFloat := self._fValor_Venda;
      qry.ParamByName('tipo_venda').AsString := self._fTipo_Venda;
      qry.ParamByName('operacao_venda').AsString := self._fOperacao_Venda;
    end
    else
    begin
      qry.SQL.Add('Insert into venda values ((SELECT max(nrnota) FROM venda)+1,:emissao,:cliente,:tipo_venda,:valor_venda,:operacao_venda)');
      qry.ParamByName('emissao').AsDateTime := self._fEmissao;
      qry.ParamByName('cliente').AsInteger := self._fCliente;
      qry.ParamByName('valor_venda').AsFloat := self._fValor_Venda;
      qry.ParamByName('tipo_venda').AsString := self._fTipo_Venda;
      qry.ParamByName('operacao_venda').AsString := self._fOperacao_Venda;
    end;

    try
      qry.ExecSQL;
      qry.sql.Clear;
      //qry.SQL.Add('select scope_identity() as IdItens');
      qry.SQL.Add('SELECT max(nrnota) as IdItens FROM venda');
      qry.Open;

      IdItens:=qry.FieldByName('IdItens').AsInteger;

      cds.First;
      while not cds.Eof do
      begin
        InserirItens(cds, IdItens);
        cds.Next;
      end;

      ConexaoDB.Commit;
    except
      conexaodb.Rollback;
      result:=false;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
end;
end;

function TVendas.PrimeiroCodigo: boolean;
var qry :TZQuery;
begin
  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear; //Limpar possiveis sujeiras na memoria.
    qry.SQL.Add('select nrnota from venda');
      try
        qry.Open;

        if qry.FieldByName('nrnota').AsString = '' then
          result := true
        else
          result := false;
      except
        result := false;
      end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

function TVendas.Apagar: boolean;
var qry:TZQuery;
begin
  if MessageDlg('Apagar a venda '+IntToStr(_fNrnota),mtConfirmation,[mbYes,mbNo], 0) = mrNo then
    begin
      result := false;
      abort;
    end;

  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    //qry.SQL.Clear;
    //qry.sql.Add('delete from item_venda where nr_venda=:nrnota');
    //qry.ParamByName('nrnota').AsInteger := nrnota;
    try
      //qry.ExecSQL;
      qry.sql.Clear;
      qry.sql.Add('delete from venda where nrnota=:nrnota');
      qry.ParamByName('nrnota').AsInteger := nrnota;
      qry.ExecSQL;
    except
      result := false;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

function TVendas.Atualizar: boolean;
var qry:TZQuery;
begin
  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.sql.Add('update venda set nrnota=:nrnota, emissao=:emissao,' +
                ' cliente=:cliente, valor_venda=:valor_venda, tipo_venda=:tipo_venda,' +
                ' operacao_venda=:operacao_venda where nrnota=:nrnota ');
    qry.ParamByName('nrnota').AsInteger := self._fNrnota;
    qry.ParamByName('emissao').AsDateTime := self._fEmissao;
    qry.ParamByName('cliente').AsInteger := self._fCliente;
    qry.ParamByName('valor_venda').AsFloat := self._fValor_Venda;
    qry.ParamByName('tipo_venda').AsString := self._fTipo_Venda;
    qry.ParamByName('operacao_venda').AsString := self._fOperacao_Venda;
    try
      qry.ExecSQL;
    except
      result:=false;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;

end;

function TVendas.Selecionar(id: Integer): boolean;
var qry:TZQuery;
begin
  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('select nrnota,emissao,cliente,valor_venda,tipo_venda,operacao_venda from venda where nrnota=:nrnota');
    qry.ParamByName('nrnota').AsInteger := id;
    try
      qry.open;

      self._fNrnota := qry.FieldByName('nrnota').AsInteger;
      self._fEmissao := qry.FieldByName('emissao').AsDateTime;
      self._fCliente  := qry.FieldByName('cliente').AsInteger;
      self._fValor_Venda := qry.FieldByName('valor_venda').AsFloat;
      self._fTipo_Venda := qry.FieldByName('tipo_venda').AsString;
      self._fOperacao_Venda := qry.FieldByName('operacao_venda').AsString;
    except
      result := false;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
    end;
end;

{$endregion}

end.
