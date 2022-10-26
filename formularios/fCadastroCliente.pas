unit fCadastroCliente;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  dConexao,
  uCliente;

type
  TfrmCadastroCliente = class(TForm)
    pnlTitulo: TPanel;
    pnlGrid: TPanel;
    pnlBotoes: TPanel;
    edtEmail: TEdit;
    btnSalvar: TButton;
    btnSair: TButton;
    edtNome: TEdit;
    lblNome: TLabel;
    lblEmail: TLabel;
    lblEndereco: TLabel;
    lblBairro: TLabel;
    lblCep: TLabel;
    lblCidade: TLabel;
    edtCep: TEdit;
    edtCidade: TEdit;
    edtBairro: TEdit;
    edtEndereco: TEdit;
    edtID: TEdit;
    lblID: TLabel;
    edtUf: TEdit;
    lblUf: TLabel;
    edtFone: TEdit;
    edtCelular: TEdit;
    lblCelular: TLabel;
    lblFone: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    procedure IncluirCliente;
    procedure AlterarCliente;

    function ValidaCampos: Boolean;

  public
    { Public declarations }
    TipoRotina: String;
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}
{ TfrmCadastroCliente }

procedure TfrmCadastroCliente.IncluirCliente;
var
  lCliente: TCliente;
begin
  lCliente := TCliente.Create;
  try
    lCliente.CODIGO := StrToInt(edtID.Text);
    lCliente.NOME := edtNome.Text;
    lCliente.ENDERECO := edtEndereco.Text;
    lCliente.BAIRRO := edtBairro.Text;
    lCliente.CIDADE := edtCidade.Text;
    lCliente.CEP := edtCep.Text;
    lCliente.UF := edtUf.Text;
    lCliente.FONE := edtFone.Text;
    lCliente.CELULAR := edtCelular.Text;
    lCliente.EMAIL := edtEmail.Text;
    lCliente.Incluir(true);
  finally
    lCliente.Free;
  end;
end;

procedure TfrmCadastroCliente.AlterarCliente;
var
  lCliente: TCliente;
begin
  lCliente := TCliente.Create;
  try
    lCliente.CODIGO := StrToInt(edtID.Text);
    lCliente.NOME := edtNome.Text;
    lCliente.ENDERECO := edtEndereco.Text;
    lCliente.BAIRRO := edtBairro.Text;
    lCliente.CIDADE := edtCidade.Text;
    lCliente.CEP := edtCep.Text;
    lCliente.UF := edtUf.Text;
    lCliente.FONE := edtFone.Text;
    lCliente.CELULAR := edtCelular.Text;
    lCliente.EMAIL := edtEmail.Text;

    lCliente.Alterar(true);
  finally
    lCliente.Free;
  end;
end;

function TfrmCadastroCliente.ValidaCampos: Boolean;
begin
  if trim(edtNome.Text) = emptyStr then
  begin
    showmessage ('O campo Nome precisa ser preenchido para a conclusão do cadastro.');
    edtNome.SetFocus;
    Result := False;
  end
  else if trim(edtEndereco.Text) = emptyStr then
  begin
    showmessage ('O campo Endereço precisa ser preenchido para a conclusão do cadastro.');
    edtEndereco.SetFocus;
    Result := False;
  end
  else if trim(edtBairro.Text) = emptyStr then
  begin
    showmessage ('O campo Bairro precisa ser preenchido para a conclusão do cadastro.');
    edtBairro.SetFocus;
    Result := False;
  end
  else if trim(edtCidade.Text) = emptyStr then
  begin
    showmessage ('O campo Cidade precisa ser preenchido para a conclusão do cadastro.');
    edtCep.SetFocus;
    Result := False;
  end
  else if trim(edtCep.Text) = emptyStr then
  begin
    showmessage ('O campo CEP precisa ser preenchido para a conclusão do cadastro.');
    edtCep.SetFocus;
    Result := False;
  end
  else if Length(edtCep.Text) < 8 then
  begin
    showmessage('Este CEP é invalido, favor conferir digitação.');
    edtCep.SetFocus;
    Result := False;
  end
  else if trim(edtEmail.Text) = emptyStr then
  begin
    showmessage ('O campo E-mail precisa ser preenchido para a conclusão do cadastro.');
    edtEmail.SetFocus;
    Result := False;
  end
  else if Trim(edtFone.text) = EmptyStr then
  begin
    showmessage ('O campo Fone precisa ser preenchido para a conclusão do cadastro.');
    edtFone.SetFocus;
    Result := False;
  end
  else if Trim(edtCelular.text) = EmptyStr then
  begin
    showmessage ('O campo Celular precisa ser preenchido para a conclusão do cadastro.');
    edtCelular.SetFocus;
    Result := False;
  end
  else
  begin
    Result := True;
  end;
end;

procedure TfrmCadastroCliente.btnSalvarClick(Sender: TObject);
begin
  if ValidaCampos then
  begin
    if TipoRotina = 'Incluir' then
    begin
      IncluirCliente;
    end
    else if TipoRotina = 'Alterar' then
    begin
      AlterarCliente;
    end;
    close;
  end;
end;

procedure TfrmCadastroCliente.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['a' .. 'z', #32, #8]) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmCadastroCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCadastroCliente.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;

  if TipoRotina = 'Incluir' then
  begin
    edtNome.SetFocus;
  end
  else if TipoRotina = 'Alterar' then
  begin
    edtNome.SetFocus;
  end
  else
  begin
    btnSair.SetFocus;
  end;
end;

procedure TfrmCadastroCliente.btnSairClick(Sender: TObject);
begin
  close;
end;

end.
