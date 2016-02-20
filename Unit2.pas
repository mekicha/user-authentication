unit Unit2;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    Label2: TLabel;
    Login: TEdit;
    procedure FormShow(Sender: TObject);
   // procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

{$R *.dfm}

procedure TPasswordDlg.FormShow(Sender: TObject);
begin
Login.Text:='';
Password.Text:='';
ActiveControl:=Login; //set focus on login textbox
end;



procedure TPasswordDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if ModalResult=mrOk then CanClose:=Login.Text<>''; //close if login is entered

end;

end.
 
