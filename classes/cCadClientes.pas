unit cCadClientes;

interface

uses System.Classes, vcl.Controls, vcl.ExtCtrls, vcl.Dialogs,
      ZAbstractConnection, ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset, System.SysUtils;

type
  TCliente = class

  private
    { Private declarations }

    ConexaoDB:TZConnection;

    _fCodigo:integer;
    _fNome:string;
    _fEndereco:string;
    _fBairro:string;
    _fCidade:string;
    _fCep:string;
    _fUf:string;
    _fFone:string;
    _fCelular:string;
    _fEmail:string;

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
    property codigo:integer    read _fCodigo   write _fCodigo;
    property nome:string       read _fNome     write _fNome;
    property endereco:string   read _fEndereco write _fEndereco;
    property bairro:string     read _fBairro   write _fBairro;
    property cidade:string     read _fCidade   write _fCidade;
    property cep:string        read _fCep      write _fCep;
    property uf:string         read _fUf       write _fUf;
    property fone:string       read _fFone     write _fFone;
    property celular:string    read _fCelular  write _fCelular;
    property email:string      read _fEmail    write _fEmail;
  end;

implementation

{ TCliente }

{$region 'CONSTRUCTOR AND DESTRUCTOR'}

constructor TCliente.Create(_Conexao:TZConnection);
begin
  ConexaoDB := _Conexao;
end;

destructor TCliente.Destroy;
begin

  inherited;
end;

{$endregion}

{$region 'CRUD'}

function TCliente.Inserir: boolean;
var qry : TZQuery;
begin
  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear; //Limpar possiveis sujeiras na memoria.
    if (PrimeiroCodigo) then
    begin
      qry.SQL.Add('INSERT INTO CLIENTE VALUES (1,'+
                    ':nome,:endereco,:bairro,:cidade,:cep,:uf,:fone,:celular,:email)');
      qry.ParamByName('nome').Value := self._fNome;
      qry.ParamByName('endereco').value := self._fEndereco;
      qry.ParamByName('bairro').value := self._fBairro;
      qry.ParamByName('cidade').value := self._fCidade;
      qry.ParamByName('cep').Value := self._fCep;
      qry.ParamByName('uf').Value := self._fUf;
      qry.ParamByName('fone').Value := self._fFone;
      qry.ParamByName('celular').Value := self._fCelular;
      qry.ParamByName('email').Value := self._fEmail;
      try
        qry.ExecSQL;
      except
        result := false;
      end;
    end
    else
      begin
      qry.SQL.Add('INSERT INTO CLIENTE VALUES ((SELECT max(codigo) FROM cliente)+1,'+
                    ':nome,:endereco,:bairro,:cidade,:cep,:uf,:fone,:celular,:email)');
      qry.ParamByName('nome').Value := self._fNome;
      qry.ParamByName('endereco').value := self._fEndereco;
      qry.ParamByName('bairro').value := self._fBairro;
      qry.ParamByName('cidade').value := self._fCidade;
      qry.ParamByName('cep').Value := self._fCep;
      qry.ParamByName('uf').Value := self._fUf;
      qry.ParamByName('fone').Value := self._fFone;
      qry.ParamByName('celular').Value := self._fCelular;
      qry.ParamByName('email').Value := self._fEmail;
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

function TCliente.PrimeiroCodigo: boolean;
var qry :TZQuery;
begin
  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear; //Limpar possiveis sujeiras na memoria.
    qry.SQL.Add('select codigo from cliente');
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

function TCliente.Selecionar(Id: Integer): boolean;
var qry : TZQuery;
begin
  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('select codigo,nome,endereco,bairro,cidade,cep,uf,fone,celular,email from cliente where codigo=:codigo');
    qry.ParamByName('codigo').Value:=Id;
    try
      qry.Open;

      self._fCodigo := qry.FieldByName('codigo').AsInteger;
      self._fNome := qry.FieldByName('nome').AsString;
      SELF._fEndereco := qry.FieldByName('endereco').AsString;
      self._fBairro := qry.FieldByName('bairro').AsString;
      self._fCidade := qry.FieldByName('cidade').AsString;
      self._fCep := qry.FieldByName('cep').AsString;
      self._fUf := qry.FieldByName('uf').AsString;
      self._fFone := qry.FieldByName('fone').AsString;
      self._fCelular := qry.FieldByName('celular').AsString;
      self._fEmail := qry.FieldByName('email').AsString;
    except
      result := false;
    end;
  finally
    if Assigned(qry) then
      FreeAndNil(qry);
end;
end;

function TCliente.Apagar: boolean;
var qry : TZQuery;
begin
  if MessageDlg('Apagar o cliente '+_fNome,mtConfirmation,[mbYes,mbNo], 0) = mrNo then
  begin
    result := false;
    abort;
  end;

  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('delete from cliente where codigo=:codigo');
    qry.ParamByName('codigo').AsInteger := _fCodigo;
    try
      qry.ExecSQL;  
    except
      result := false;
    end;

  finally
    if Assigned(qry) then
      FreeAndNil(qry);
  end;


end;

function TCliente.Atualizar: boolean;
var qry : TZQuery;
begin
  try
    result := true;
    qry := TZQuery.Create(nil);
    qry.Connection := ConexaoDB;
    qry.SQL.Clear;
    qry.SQL.Add('update cliente' +
                ' set nome=:nome ' +
                ',endereco=:endereco' +
                ',bairro=:bairro' +
                ',cidade=:cidade' +
                ',cep=:cep' +
                ',uf=:uf' +
                ',fone=:fone' +
                ',celular=:celular' +
                ',email=:email ' +
                ' where codigo=:codigo');
    qry.ParamByName('codigo').Value := self._fCodigo;
    qry.ParamByName('nome').Value := self._fNome;
    qry.ParamByName('endereco').value := self._fEndereco;
    qry.ParamByName('bairro').value := self._fBairro;
    qry.ParamByName('cidade').value := self._fCidade;
    qry.ParamByName('cep').Value := self._fCep;
    qry.ParamByName('uf').Value := self._fUf;
    qry.ParamByName('fone').Value := self._fFone;
    qry.ParamByName('celular').Value := self._fCelular;
    qry.ParamByName('email').Value := self._fEmail;
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
