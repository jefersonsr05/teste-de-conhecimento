unit cVendas;

interface

uses System.Classes, vcl.Controls, vcl.ExtCtrls, vcl.Dialogs,
      ZAbstractConnection, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset, System.SysUtils;

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
    _fOpercao_Venda: string;

    function PrimeiroCodigo: boolean;

  public
    { Public declarations }
    constructor Create(_Conexao:TZConnection);
    destructor Destroy; override;
    function Inserir:boolean;
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
    property operacao_Venda:string   read _fOpercao_Venda   write _fOpercao_Venda;
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

{$region 'CRUD'}

function TVendas.Inserir: boolean;
 begin

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
 begin

end;

function TVendas.PrimeiroCodigo: boolean;
begin

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
