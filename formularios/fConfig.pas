unit fConfig;

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
  Vcl.ComCtrls,
  uConfig;

type
  TfrmConfig = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    Panel2: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    pgcConfig: TPageControl;
    tbsGeral: TTabSheet;
    Panel4: TPanel;
    Label1: TLabel;
    ColorBox: TColorBox;
    btnAplicar: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FLogin: String;
    FSenha: String;
  public
    { Public declarations }
    property Login: String read FLogin write FLogin;
    property Senha: String read FSenha write FSenha;
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

procedure TfrmConfig.btnAplicarClick(Sender: TObject);
begin
  pnlTitulo.Color := ColorBox.selected;
  pnlBotoes.Color := ColorBox.selected;
end;

procedure TfrmConfig.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConfig.btnSalvarClick(Sender: TObject);
begin
  lConfig.CarregaCorProBanco(pnlTitulo.Color);
  lConfig.SobeRestricoesBanco(true);
  close;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  pgcConfig.ActivePage := tbsGeral;
  lConfig.CarregaUsuarioAcessando(FLogin, FSenha);
end;

procedure TfrmConfig.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
