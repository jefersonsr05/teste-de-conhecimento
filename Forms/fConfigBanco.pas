unit fConfigBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmConfigBanco = class(TForm)
    Image1: TImage;
    OpenDialogPastas: TOpenDialog;
    LabelLocalBD: TLabel;
    EditLocal: TEdit;
    ButtonConfigurar: TButton;
    Label1: TLabel;
    procedure ButtonConfigurarClick(Sender: TObject);
  private
    { Private declarations }

    procedure configura;

  public
    { Public declarations }
  end;

var
  frmConfigBanco: TfrmConfigBanco;

implementation

{$R *.dfm}

procedure TfrmConfigBanco.ButtonConfigurarClick(Sender: TObject);
begin

  //  Chama a procedure ara configurar o banco
  configura;

end;

procedure TfrmConfigBanco.configura;
begin

end;

end.
