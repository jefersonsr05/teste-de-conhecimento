unit fCliente;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
    FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
    FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
    FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
    FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, dConexao,
    Vcl.StdCtrls, Vcl.ComCtrls;

type
    TfrmCliente = class(TForm)
        dtsCliente: TDataSource;
        qryConsultaCliente: TFDQuery;
        pnlCentral: TPanel;
        pnlBotoes: TPanel;
        pnlTopo: TPanel;
        pgcPrincipal: TPageControl;
        tbsConsulta: TTabSheet;
        tbsCadastro: TTabSheet;
        grdCliente: TDBGrid;
        pnlCentralCad: TPanel;
        edtNome: TEdit;
        edtEndereco: TEdit;
        lblNome: TLabel;
        lblEndereco: TLabel;
        pnlPesquisas: TPanel;
        lblCodigo: TLabel;
        edtCodigo: TEdit;
        lblBairro: TLabel;
        edtBairro: TEdit;
        lblCidade: TLabel;
        edtCidade: TEdit;
        lblCep: TLabel;
        edtCep: TEdit;
        lblUf: TLabel;
        edtUf: TEdit;
        lblFone: TLabel;
        edtFone: TEdit;
        edtCelular: TEdit;
        lblCelular: TLabel;
        edtEmail: TEdit;
        lblEmail: TLabel;
        pnlBotoesCliente: TPanel;
        btnConfirmar: TButton;
        btnCancelar: TButton;
        btnInserir: TButton;
        btnAlterar: TButton;
        btnExcluir: TButton;
        btnAtualizar: TButton;
        btnSair: TButton;
        edtFiltroNome: TEdit;
        lblPesquisaCliente: TLabel;
        qryConsultaClienteCODIGO: TIntegerField;
        qryConsultaClienteNOME: TStringField;
        qryConsultaClienteENDERECO: TStringField;
        qryConsultaClienteBAIRRO: TStringField;
        qryConsultaClienteCIDADE: TStringField;
        qryConsultaClienteCEP: TStringField;
        qryConsultaClienteUF: TStringField;
        qryConsultaClienteFONE: TStringField;
        qryConsultaClienteCELULAR: TStringField;
        qryConsultaClienteEMAIL: TStringField;
        procedure FormShow(Sender: TObject);
        procedure btnExcluirClick(Sender: TObject);
        procedure btnAtualizarClick(Sender: TObject);
        procedure btnAlterarClick(Sender: TObject);
        procedure edtFiltroNomeChange(Sender: TObject);
        procedure grdClienteTitleClick(Column: TColumn);
        procedure btnSairClick(Sender: TObject);
        procedure btnConfirmarClick(Sender: TObject);
        procedure btnCancelarClick(Sender: TObject);
        procedure btnInserirClick(Sender: TObject);
        procedure edtCepKeyPress(Sender: TObject; var Key: Char);
        procedure edtCelularKeyPress(Sender: TObject; var Key: Char);

    private
        { Private declarations }
        FTipoOperacao: string;
        procedure ConfirmarInserir;
        procedure ConfirmarEditar;
        procedure ConfirmarExcluir;
        procedure Consultar;
        procedure LimparCampos;
        procedure MontarTela;
        function RetornaUltimoCodigo: integer;
    public
        { Public declarations }
        property TipoOperacao: string read FTipoOperacao write FTipoOperacao;
    end;

var
    frmCliente: TfrmCliente;

implementation

{$R *.dfm}
{ TfrmCliente }

procedure TfrmCliente.btnAlterarClick(Sender: TObject);

begin
    LimparCampos; // limpar campos
    if not qryConsultaCliente.IsEmpty then // verifica se tem registros
    begin
        FTipoOperacao := 'Alterar';
        MontarTela;
        edtCodigo.Text := qryConsultaCliente.FieldByName('CODIGO').AsString;
    end
    else
    begin
        showmessage('Selecione para alterar')
    end;
end;

procedure TfrmCliente.btnAtualizarClick(Sender: TObject);
begin
    Consultar; // atualiza qry
end;

procedure TfrmCliente.btnCancelarClick(Sender: TObject);
begin
    FTipoOperacao := 'Consultar';
    MontarTela;
end;

procedure TfrmCliente.btnConfirmarClick(Sender: TObject);
begin
    begin
        if (edtNome.Text) = emptyStr then // validação
        begin
            showmessage('Preencher o campo nome');
            edtNome.SetFocus;
            abort;
        end
        else if (edtEndereco.Text) = emptyStr then // validação
        begin
            showmessage('Preencher o campo endereço');
            edtEndereco.SetFocus;
            abort;
        end
        else if (edtBairro.Text) = emptyStr then // validação
        begin
            showmessage('Preencher o campo bairro');
            edtBairro.SetFocus;
            abort;
        end
        else if (edtCidade.Text) = emptyStr then // validação
        begin
            showmessage('Preencher o campo cidade');
            edtCidade.SetFocus;
            abort;
        end
        else if (edtCep.Text) = emptyStr then // validação
        begin
            showmessage('Preencher o campo cep');
            edtCep.SetFocus;
            abort;
        end
        else if (edtUf.Text) = emptyStr then // validação
        begin
            showmessage('Preencher  o campo uf');
            edtUf.SetFocus;
            abort;
        end
        else if (edtCelular.Text) = emptyStr then // validação
        begin
            showmessage('Preencher o campo celular');
            edtCelular.SetFocus;
            abort;
        end;
        begin
            if FTipoOperacao = 'Incluir' then
            begin
                ConfirmarInserir;
            end
            else
            begin
                ConfirmarEditar;
            end;
            FTipoOperacao := 'Consultar';
            MontarTela;
            Consultar; // atualiza a qry
        end;
    end;
end;

procedure TfrmCliente.btnExcluirClick(Sender: TObject);

begin
    if not qryConsultaCliente.IsEmpty then // verifica se tem registros
    begin
        ConfirmarExcluir;
    end
    else
    begin
        showmessage('Selecione para excluir')
    end;
end;

procedure TfrmCliente.btnInserirClick(Sender: TObject);
begin
    LimparCampos; // limpar campos
    FTipoOperacao := 'Incluir';
    MontarTela;
    edtCodigo.Text := RetornaUltimoCodigo.ToString;
    edtNome.SetFocus;
end;

procedure TfrmCliente.btnSairClick(Sender: TObject);
begin
    close; // fecha tela
end;

procedure TfrmCliente.Consultar;
begin
    qryConsultaCliente.Connection := dtmConexao.Conexao;
    qryConsultaCliente.close;
    qryConsultaCliente.SQL.Clear;
    qryConsultaCliente.SQL.add(' select*from cliente order by codigo desc');
    qryConsultaCliente.Open;
end;

procedure TfrmCliente.edtCelularKeyPress(Sender: TObject; var Key: Char);
begin
    if not(Key in ['0' .. '9', ',', '.', #8, '''']) then
        Key := #0;
    if Key in ['.'] then
        Key := #44;
end;

procedure TfrmCliente.edtCepKeyPress(Sender: TObject; var Key: Char);
begin
    if not(Key in ['0' .. '9', ',', '.', #8, '''']) then
        Key := #0;
    if Key in ['.'] then
        Key := #44;
end;

procedure TfrmCliente.edtFiltroNomeChange(Sender: TObject);
begin
    qryConsultaCliente.Filtered := False;
    qryConsultaCliente.Filter := 'NOME like' + // filtro cliente não exato
    QuotedStr('%' + edtFiltroNome.Text + '%');
    qryConsultaCliente.Filtered := True;
end;

procedure TfrmCliente.ConfirmarEditar;
var
    lQuery: TFDQuery;
begin
    lQuery := TFDQuery.Create(nil);
    try
        lQuery.Connection := dtmConexao.Conexao; // passei a conexao para qry

        if not qryConsultaCliente.IsEmpty then // verifica se tem registros
        begin
            lQuery.close;
            lQuery.SQL.Clear;
            lQuery.SQL.add('    UPDATE CLIENTE SET     ');
            lQuery.SQL.add('    NOME = :NOME           ');
            lQuery.SQL.add('  , ENDERECO = :ENDERECO   ');
            lQuery.SQL.add('  , BAIRRO = :BAIRRO       ');
            lQuery.SQL.add('  , CIDADE = :CIDADE       ');
            lQuery.SQL.add('  , CEP = :CEP             ');
            lQuery.SQL.add('  , UF = :UF               ');
            lQuery.SQL.add('  , FONE = :FONE           ');
            lQuery.SQL.add('  , CELULAR = :CELULAR     ');
            lQuery.SQL.add('  , EMAIL = :EMAIL         ');
            lQuery.SQL.add('where (CODIGO = :CODIGO)   ');
            lQuery.ParamByName('CODIGO').AsInteger :=
            qryConsultaCliente.FieldByName('CODIGO').AsInteger;// peguei o codigo da query do grid
            lQuery.ParamByName('NOME').AsString := edtNome.Text;
            lQuery.ParamByName('ENDERECO').AsString := edtEndereco.Text;
            lQuery.ParamByName('BAIRRO').AsString := edtBairro.Text;
            lQuery.ParamByName('CIDADE').AsString := edtCidade.Text;
            lQuery.ParamByName('CEP').AsString := edtCep.Text;
            lQuery.ParamByName('UF').AsString := edtUf.Text;
            lQuery.ParamByName('FONE').AsString := edtFone.Text;
            lQuery.ParamByName('CELULAR').AsString := edtCelular.Text;
            lQuery.ParamByName('EMAIL').AsString := edtEmail.Text;
            lQuery.ExecSQL;
            lQuery.Connection.Commit;
            Consultar; // atualiza a query cliente
        end
        else
        begin
            showmessage('Selecione para editar')
        end;
    finally
        lQuery.Free;
    end;

end;

procedure TfrmCliente.ConfirmarExcluir;
var
    lQuery: TFDQuery;
begin
    lQuery := TFDQuery.Create(nil);
    try
        lQuery.Connection := dtmConexao.Conexao; // passei a conexao para qry
        lQuery.close;
        lQuery.SQL.Clear;
        lQuery.SQL.add('   DELETE FROM CLIENTE WHERE CODIGO =:CODIGO  ');
        lQuery.ParamByName('CODIGO').AsInteger := qryConsultaCliente.FieldByName('CODIGO').AsInteger; // peguei o codigo da query do grid
        lQuery.ExecSQL;
        lQuery.Connection.Commit;
        Consultar; // atualiza a query cliente
    finally
        lQuery.Free;
    end;

end;

procedure TfrmCliente.FormShow(Sender: TObject);
begin
    WindowState := wsMaximized; // abre tela maximizado
    pgcPrincipal.activepageindex := 0; // abre na tela consulta
    tbsCadastro.TabVisible := False; // deixa  cadastro oculto
    Consultar;
end;

procedure TfrmCliente.grdClienteTitleClick(Column: TColumn);
begin
    qryConsultaCliente.IndexFieldNames := Column.FieldName; // ordena grid
end;

procedure TfrmCliente.LimparCampos;
begin
    edtNome.Clear;
    edtEndereco.Clear;
    edtBairro.Clear;
    edtCidade.Clear;
    edtCep.Clear;
    edtUf.Clear;
    edtFone.Clear;
    edtCelular.Clear;
    edtEmail.Clear;
    edtUf.Clear;
end;

procedure TfrmCliente.MontarTela;
begin
    if TipoOperacao <> 'Consultar' then
    begin
        tbsCadastro.TabVisible := True;
        tbsConsulta.TabVisible := False;
        pgcPrincipal.ActivePage := tbsCadastro; // abre na tela cadastro
        pnlBotoes.Visible := False;

        if TipoOperacao = 'Incluir' then
            edtCodigo.Text := RetornaUltimoCodigo.ToString;

        edtNome.SetFocus;
    end
    else
    begin
        tbsCadastro.TabVisible := False;
        tbsConsulta.TabVisible := True;
        pgcPrincipal.ActivePage := tbsConsulta; // abre na tela consulta
        pnlBotoes.Visible := True;
        Consultar;
    end;
end;

function TfrmCliente.RetornaUltimoCodigo: integer;
var
    lQuery: TFDQuery;
begin
    Result := 0;
    lQuery := TFDQuery.Create(nil);
    try
        lQuery.Connection := dtmConexao.Conexao; // passei a conexao para qry
        lQuery.close;
        lQuery.SQL.Clear;
        lQuery.SQL.add('   select max(codigo) as codigo from cliente  ');
        lQuery.Open;
        Result := lQuery.FieldByName('codigo').AsInteger + 1;
    finally
        lQuery.Free;
    end;

end;

procedure TfrmCliente.ConfirmarInserir;
begin
    qryConsultaCliente.close;
    qryConsultaCliente.SQL.Clear;
    qryConsultaCliente.SQL.add('   INSERT INTO CLIENTE  (             ');
    qryConsultaCliente.SQL.add('   CODIGO                             ');
    qryConsultaCliente.SQL.add('  ,NOME                               ');
    qryConsultaCliente.SQL.add('  ,ENDERECO                           ');
    qryConsultaCliente.SQL.add('  ,BAIRRO                             ');
    qryConsultaCliente.SQL.add('  ,CIDADE                             ');
    qryConsultaCliente.SQL.add('  ,CEP                                ');
    qryConsultaCliente.SQL.add('  ,UF                                 ');
    qryConsultaCliente.SQL.add('  ,FONE                               ');
    qryConsultaCliente.SQL.add('  ,CELULAR                            ');
    qryConsultaCliente.SQL.add('  ,EMAIL                              ');
    qryConsultaCliente.SQL.add('  )                                   ');
    qryConsultaCliente.SQL.add('   values(                            ');
    qryConsultaCliente.SQL.add('   :CODIGO                            ');
    qryConsultaCliente.SQL.add('  ,:NOME                              ');
    qryConsultaCliente.SQL.add('  ,:ENDERECO                          ');
    qryConsultaCliente.SQL.add('  ,:BAIRRO                            ');
    qryConsultaCliente.SQL.add('  ,:CIDADE                            ');
    qryConsultaCliente.SQL.add('  ,:CEP                               ');
    qryConsultaCliente.SQL.add('  ,:UF                                ');
    qryConsultaCliente.SQL.add('  ,:FONE                              ');
    qryConsultaCliente.SQL.add('  ,:CELULAR                           ');
    qryConsultaCliente.SQL.add('  ,:EMAIL                             ');
    qryConsultaCliente.SQL.add('  )                                   ');
    qryConsultaCliente.ParamByName('CODIGO').AsFloat := StrToFloatDef(edtCodigo.Text, 0);
    qryConsultaCliente.ParamByName('NOME').AsString := edtNome.Text;
    qryConsultaCliente.ParamByName('ENDERECO').AsString := edtEndereco.Text;
    qryConsultaCliente.ParamByName('BAIRRO').AsString := edtBairro.Text;
    qryConsultaCliente.ParamByName('CIDADE').AsString := edtCidade.Text;
    qryConsultaCliente.ParamByName('CEP').AsString := edtCep.Text;
    qryConsultaCliente.ParamByName('UF').AsString := edtUf.Text;
    qryConsultaCliente.ParamByName('FONE').AsString := edtFone.Text;
    qryConsultaCliente.ParamByName('CELULAR').AsString := edtCelular.Text;
    qryConsultaCliente.ParamByName('EMAIL').AsString := edtEmail.Text;
    qryConsultaCliente.ExecSQL;
    qryConsultaCliente.Connection.Commit;

end;

end.
