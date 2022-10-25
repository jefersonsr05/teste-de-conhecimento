unit uCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, cCadClientes, uDtmConexao, uEnum,
  System.ImageList, Vcl.ImgList;

type
  TfrmCadClientes = class(TfrmTelaHeranca)
    qryListagemCODIGO: TIntegerField;
    qryListagemNOME: TWideStringField;
    qryListagemCIDADE: TWideStringField;
    qryListagemUF: TWideStringField;
    qryListagemFONE: TWideStringField;
    qryListagemCELULAR: TWideStringField;
    edtCodigo: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtUf: TLabeledEdit;
    edtEmail: TLabeledEdit;
    edtCep: TMaskEdit;
    lblTextoCep: TLabel;
    edtCelular: TMaskEdit;
    edtFone: TMaskEdit;
    lblTextoTelefone: TLabel;
    lblTextoCelular: TLabel;
    pnlCima: TPanel;
    pnlMeio: TPanel;
    lblGrandeNome: TLabel;
    lblGrandeCodigo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
    _Cliente:TCliente;
     function Apagar:boolean; override;
    function Salvar(EstadoDocadastro:TEstadoDoCadastro):boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

{$R *.dfm}

{$region 'OVERRIDE'}

function TfrmCadClientes.Salvar(EstadoDocadastro: TEstadoDoCadastro): boolean;
begin
  if (edtCodigo.Text <> EmptyStr) then
    _Cliente.codigo := StrToInt(edtCodigo.Text)
  else

  _Cliente.codigo := 0;
  _Cliente.nome := edtNome.Text;
  _Cliente.endereco := edtEndereco.Text;
  _Cliente.bairro := edtBairro.Text;
  _Cliente.cidade := edtCidade.Text;
  _Cliente.cep := edtCep.Text;
  _Cliente.uf := edtUf.Text;
  _Cliente.fone := edtFone.Text;
  _Cliente.celular := edtCelular.Text;
  _Cliente.email := edtEmail.Text;

  if (EstadoDocadastro=ecInserir) then
    Result := _Cliente.Inserir
  else if (EstadoDocadastro=ecAlterar) then
    Result := _Cliente.Atualizar;
end;

function TfrmCadClientes.Apagar: boolean;
begin
  if _Cliente.Selecionar(qryListagem.FieldByName('CODIGO').AsInteger)  then
    Result := _Cliente.Apagar;
end;

{$endregion}

{$region 'INTERACOES NA TELA'}

procedure TfrmCadClientes.btnAlterarClick(Sender: TObject);
begin
  if _Cliente.Selecionar(qryListagem.FieldByName('CODIGO').AsInteger)  then
  begin
    edtCodigo.Text := IntToStr(_Cliente.codigo);
    edtNome.Text := _Cliente.nome;
    edtEndereco.Text := _Cliente.endereco;
    edtBairro.Text := _Cliente.bairro;
    edtCidade.Text := _Cliente.cidade;
    edtCep.Text := _Cliente.cep;
    edtUf.Text := _Cliente.uf;
    edtFone.Text := _Cliente.fone;
    edtCelular.Text := _Cliente.celular;
    edtEmail.Text := _Cliente.email;

    lblGrandeCodigo.Caption := IntToStr(_Cliente.codigo);
    lblGrandeNome.Caption := _Cliente.nome;
  end
  else
  begin
    btnCancelar.Click;
    abort;
  end;

  inherited;
end;

procedure TfrmCadClientes.btnNovoClick(Sender: TObject);
begin
  inherited;
  lblGrandeCodigo.Caption := '0';
  lblGrandeNome.Caption := 'Novo cliente';
  edtNome.SetFocus;
end;

procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(_Cliente) then
    FreeAndNil(_Cliente);
end;

procedure TfrmCadClientes.FormCreate(Sender: TObject);
begin
  inherited;
  _Cliente:=TCLiente.Create(dtmConexao.ConexaoDB);
  indiceAtual:='CODIGO';
end;

{$endregion}

end.
