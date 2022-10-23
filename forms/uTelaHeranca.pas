unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uDtmConexao, uEnum, RxToolEdit, RxCurrEdit,
  Vcl.WinXPickers;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlBaixo: TPanel;
    TabListagem: TTabSheet;
    TabSheet2: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisa: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    btnApagar: TBitBtn;
    btnFechar: TBitBtn;
    btnNavegar: TDBNavigator;
    qryListagem: TZQuery;
    dtsListagem: TDataSource;
    lblIndice: TLabel;
    lblTextoPesquisa: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisaChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);

  private
    { Private declarations }

    procedure ControleBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar:TBitBtn;
            navegador:TDBNavigator; pgcPrincipal:TPageControl; flag:boolean);
    procedure ControlarIndice(pgcPrincipal: TPageControl; indice: integer);
    function RetornarCampoPesquisa(campo: string): string;
    procedure ExibirIndiceLabel(campo: string; _label: TLabel);
    function VerificarCampoObrigatorio: boolean;
    procedure VerificarCampoNaoEditavel;
    procedure LimparCampos;

  public
    { Public declarations }
    indiceAtual:string;
    EstadoDoCadastro:TEstadoDoCadastro;
    function Apagar:boolean; virtual;
    function Salvar(EstadoDocadastro:TEstadoDoCadastro):boolean; virtual;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

{$region 'COMENTARIOS'}
  //TAG 1: Campos obrigatorios;
  //TAG 9: Campos que usuario nao pode alterar;
{$ENDREGION}

{$Region 'VIRTUAL METHODS'}

function TfrmTelaHeranca.Apagar: boolean;
begin
  ShowMessage('DELETADO');
  Result := true;
end;

function TfrmTelaHeranca.Salvar(EstadoDocadastro: TEstadoDoCadastro): boolean;
begin
  if (EstadoDoCadastro=ecInserir) then
    showMessage('CADASTRADO')
  else if (EstadoDoCadastro=ecAlterar) then
    showMessage('ATUALIZADO');
  Result:=true;
end;

{$endregion}

{$region 'FUNCTIONS E PROCEDURES'}

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  qryListagem.Connection:=dtmConexao.ConexaoDB;
  dtsListagem.DataSet:=qryListagem;
  grdListagem.DataSource:=dtsListagem;
  btnNavegar.DataSource:=dtsListagem;
  grdListagem.Options:=[dgTitles,dgIndicator,dgColumnResize,dgColLines,
                      dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,
                      dgCancelOnExit,dgTitleClick,dgTitleHotTrack];
end;

procedure TfrmTelaHeranca.ControleBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnApagar:TBitBtn;
            navegador:TDBNavigator; pgcPrincipal:TPageControl; flag:boolean);
begin
  btnNovo.Enabled     :=flag;
  btnApagar.Enabled   :=flag;
  btnAlterar.Enabled  :=flag;
  navegador.Enabled   :=flag;
  pgcPrincipal.Pages[0].TabVisible:=flag;
  btnCancelar.Enabled :=not(flag);
  btnGravar.Enabled   :=not(flag);
end;

procedure TfrmTelaHeranca.ControlarIndice(pgcPrincipal:TPageControl; indice:integer);
begin
  if (pgcPrincipal.Pages[indice].TabVisible) then
    pgcPrincipal.TabIndex:=indice;
end;

function TfrmTelaHeranca.RetornarCampoPesquisa(campo:string):string;
var I:integer;
begin
  for I :=0 to qryListagem.Fields.Count-1 do
  begin
    if UpperCase(qryListagem.Fields[i].FieldName)=UpperCase(campo) then
    begin
      result:=qryListagem.Fields[i].DisplayLabel;
      break;
    end;
  end;
end;

procedure TfrmTelaHeranca.ExibirIndiceLabel(campo:string; _label:TLabel);
begin
  _label.Caption:=RetornarCampoPesquisa(campo);
end;

function TfrmTelaHeranca.VerificarCampoObrigatorio:boolean;
var i:integer;
begin
  Result:=false;
  for i := 0 to ComponentCount-1 do
  begin
    if ((Components[i] is TLabeledEdit)) then
    begin
      if (TLabeledEdit(Components[i]).Tag = 1) and (TLabeledEdit(Components[i]).Text=EmptyStr) then
      begin
        MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption +
                    ' é um campo obrigatório.', mtInformation,[mbOk],0);
        TLabeledEdit(Components[i]).SetFocus;
        Result:=true;
        Break;
      end;
    if ((Components[i] is TMaskEdit)) then
    begin
      if (TMaskEdit(Components[i]).Tag = 1) and (TMaskEdit(Components[i]).Text='') then
        begin
          MessageDlg('Preencha os campos obrigatórios.', mtInformation,[mbOk],0);
          TMaskEdit(Components[i]).SetFocus;
          Result:=true;
          Break;
        end;
    end;
    if ((Components[i] is TCurrencyEdit)) then
      if (TCurrencyEdit(Components[i]).Tag = 1) and (TCurrencyEdit(Components[i]).Value=0.00) then
        begin
          MessageDlg('Preencha os campos obrigatórios.', mtInformation,[mbOk],0);
          TCurrencyEdit(Components[i]).SetFocus;
          Result:=true;
          Break;
        end;
    end;
  end;
end;

procedure TfrmTelaHeranca.VerificarCampoNaoEditavel;
var i:integer;
begin
  for i := 0 to ComponentCount-1 do
  begin
    if (Components[i] is TLabeledEdit) then
    begin
      if (TLabeledEdit(Components[i]).Tag = 9) then
      begin
        TLabeledEdit(Components[i]).Enabled := false;
        break;
      end;
    end;
  end;
end;

procedure TfrmTelaHeranca.LimparCampos;
var i:integer;
begin
  for i := 0 to ComponentCount-1 do
    begin
      if (Components[i] is TLabeledEdit) then
          TLabeledEdit(Components[i]).Text := EmptyStr
      else if (Components[i] is TMaskEdit) then
        TMaskEdit(components[i]).Text := EmptyStr
      else if (Components[i] is TCurrencyEdit)  then
        TCurrencyEdit(Components[i]).Value := 0
      else if (Components[i] is TDatePicker)  then
        TDatePicker(Components[i]).Date := 0
  end;
end;

{$EndRegion}

{$region 'INTERACOES NA TELA'}

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryListagem.Close;
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  if (qryListagem.SQL.Text <> EmptyStr) then
  begin
    qryListagem.IndexFieldNames:=indiceAtual;
    ExibirIndiceLabel(indiceAtual, lblIndice);
    qryListagem.Open;
  end;
  ControlarIndice(pgcPrincipal,0);
  VerificarCampoNaoEditavel;
  ControleBotoes(btnNovo,btnAlterar,btnCancelar,btnSalvar,btnApagar,btnNavegar,pgcPrincipal,true);
end;

procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  indiceAtual := Column.FieldName;
  qryListagem.IndexFieldNames:=indiceAtual;
  ExibirIndiceLabel(indiceAtual,lblIndice);
end;

procedure TfrmTelaHeranca.mskPesquisaChange(Sender: TObject);
begin
  qryListagem.Locate(indiceAtual,TMaskEdit(Sender).Text, [loPartialKey]);
end;

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControleBotoes(btnNovo,btnAlterar,btnCancelar,btnSalvar,btnApagar,btnNavegar,pgcPrincipal,false);
  EstadoDoCadastro:=ecInserir;
  LimparCampos;
end;

procedure TfrmTelaHeranca.btnSalvarClick(Sender: TObject);
begin
  if (VerificarCampoObrigatorio) then
    abort;

  Try
  if Salvar(EstadoDoCadastro) then
    begin
      ControleBotoes(btnNovo,btnAlterar,btnCancelar,btnSalvar,btnApagar,btnNavegar,pgcPrincipal,true);
      ControlarIndice(pgcPrincipal,0);
      EstadoDoCadastro:=ecNenhum;
      LimparCampos;

      qryListagem.Refresh;
    end
    else begin
        MessageDlg('Erro na gravação!',mtError,[mbOk],0);
    end;
  Finally
  End;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  ControleBotoes(btnNovo,btnAlterar,btnCancelar,btnSalvar,btnApagar,btnNavegar,pgcPrincipal,false);
  EstadoDoCadastro:=ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  Try
    if (Apagar) then
    begin
      ControleBotoes(btnNovo,btnAlterar,btnCancelar,btnSalvar,btnApagar,btnNavegar,pgcPrincipal,true);
      ControlarIndice(pgcPrincipal,0);
      LimparCampos;
      qryListagem.Refresh;
    end
    else begin
      MessageDlg('Erro na exclusão!',mtError,[mbOk],0);
    end;
  Finally
    EstadoDoCadastro:=ecNenhum;
  End;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControleBotoes(btnNovo,btnAlterar,btnCancelar,btnSalvar,btnApagar,btnNavegar,pgcPrincipal,true);
  ControlarIndice(pgcPrincipal,0);
  LimparCampos;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  close;
end;

{$endregion}

end.
