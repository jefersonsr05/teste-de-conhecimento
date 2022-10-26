﻿unit cCadProdutos;

interface

uses System.Classes, vcl.Controls, vcl.ExtCtrls, vcl.Dialogs,
      ZAbstractConnection, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset, System.SysUtils;

type
  TProduto = class

  private
    { Private declarations }

    ConexaoDB:TZConnection;

    _fCodigo:integer;
    _fDescricao:string;
    _fReferencia:string;
    _fUnidade:string;
    _fDataVenda:TDateTime;
    _fPreco:double;
    _fSaldo:double;
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
    property codigo:integer         read _fCodigo        write _fCodigo;
    property descricao:string       read _fDescricao     write _fDescricao;
    property referencia:string      read _fReferencia    write _fReferencia;
    property unidade:string         read _fUnidade       write _fUnidade;
    property datavenda:TDateTime    read _fDataVenda     write _fDataVenda;
    property preco:double           read _fPreco         write _fPreco;
    property saldo:double           read _fSaldo         write _fSaldo;
  end;

implementation

{ TProduto }

{$region 'CONSTRUCTOR AND DESTRUCTOR'}

constructor TProduto.Create(_Conexao: TZConnection);
begin
  ConexaoDB := _Conexao;
end;

destructor TProduto.Destroy;
begin

  inherited;
end;

{$endregion}

{$region 'CRUD'}

function TProduto.Inserir: boolean;
var qry : TZQuery;
begin
  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear; //Limpar possiveis sujeiras na memoria.
    if (PrimeiroCodigo) then
    begin
      qry.SQL.Add('INSERT INTO PRODUTOS VALUES (1,'+
                    ':descricao,:referencia,:unidade,:datavenda,:precovenda,:saldo)');
      qry.ParamByName('descricao').Value := self._fDescricao;
      qry.ParamByName('referencia').Value := self._fReferencia;
      qry.ParamByName('unidade').Value := self._fUnidade;
      qry.ParamByName('datavenda').Value := self._fDataVenda;
      qry.ParamByName('precovenda').Value := self._fPreco;
      qry.ParamByName('saldo').Value := self._fSaldo;
      try
        qry.ExecSQL;
      except
        result := false;
      end;
    end
    else
      begin
      qry.SQL.Add('INSERT INTO PRODUTOS VALUES ((SELECT max(codigo) FROM produtos)+1,'+
                    ':descricao,:referencia,:unidade,:datavenda,:precovenda,:saldo)');
      qry.ParamByName('descricao').Value := self._fDescricao;
      qry.ParamByName('referencia').Value := self._fReferencia;
      qry.ParamByName('unidade').Value := self._fUnidade;
      qry.ParamByName('datavenda').Value := self._fDataVenda;
      qry.ParamByName('precovenda').Value := self._fPreco;
      qry.ParamByName('saldo').Value := self._fSaldo;
      try
        qry.ExecSQL;
      except
        result := false;
      end;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

function TProduto.PrimeiroCodigo: boolean;
var qry :TZQuery;
begin
  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear; //Limpar possiveis sujeiras na memoria.
    qry.SQL.Add('select codigo from produtos');
      try
        qry.Open;

        if qry.FieldByName('codigo').AsString = '' then
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

function TProduto.Selecionar(Id: Integer): boolean;
var qry : TZQuery;
begin
  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('select codigo,descricao,referencia,unidade,data_venda,preco_venda,saldo from produtos where codigo=:codigo');
    qry.ParamByName('codigo').Value:=Id;
    try
      qry.Open;

      self._fCodigo := qry.FieldByName('codigo').AsInteger;
      self._fDescricao := qry.FieldByName('descricao').AsString;
      self._fReferencia := qry.FieldByName('referencia').AsString;
      self._fUnidade := qry.FieldByName('unidade').AsString;
      self._fDataVenda := qry.FieldByName('data_venda').AsDateTime;
      self._fPreco := qry.FieldByName('preco_venda').AsFloat;
      self._fSaldo := qry.FieldByName('saldo').AsFloat;
    except
      result := false;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
end;
end;

function TProduto.Apagar: boolean;
var qry : TZQuery;
begin
  if MessageDlg('Apagar o produto '+_fDescricao,mtConfirmation,[mbYes,mbNo], 0) = mrNo then
  begin
    result := false;
    abort;
  end;

  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('select count(lcto) as cont from item_venda where produto=:codigo');
    qry.ParamByName('codigo').Value := self._fCodigo;
    try
      qry.Open;

      if qry.FieldByName('cont').AsInteger = 0 then
        begin
        qry.SQL.Clear;
        qry.SQL.Add('delete from produtos where codigo=:codigo');
        qry.ParamByName('codigo').AsInteger := _fCodigo;
        try
          qry.ExecSQL;
        except
          result := false;
        end;
        end
      else
      begin
        ShowMessage('Produto '+ _fDescricao +' tem vendas registradas e não pode ser excluido.');
        result := false;
      end;
    except
      result := false;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;
end;

function TProduto.Atualizar: boolean;
var qry : TZQuery;
begin
  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('update produtos' +
                ' set descricao=:descricao ' +
                ',referencia=:referencia' +
                ',unidade=:unidade' +
                ',data_venda=:data_venda' +
                ',preco_venda=:preco_venda' +
                ',saldo=:saldo' +
                ' where codigo=:codigo');
    qry.ParamByName('codigo').Value := self._fCodigo;
    qry.ParamByName('descricao').Value := self._fDescricao;
    qry.ParamByName('referencia').Value := self._fReferencia;
    qry.ParamByName('unidade').Value := self._fUnidade;
    qry.ParamByName('data_venda').Value := self._fDataVenda;
    qry.ParamByName('preco_venda').Value := self._fPreco;
    qry.ParamByName('saldo').Value := self._fSaldo;
    try
      qry.ExecSQL;
    except
      result := false;
    end;
  finally
  end;
end;

{$endregion}

end.
