unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,unit1;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    UserName: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormShow(Sender: TObject);
begin
ActiveControl:=UserName;
UserName.Text:='';
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if ModalResult=mrOk then
  if UserName.Text='' then begin
    CanClose:=false;
    ActiveControl:=UserName;
    end
  else begin
    Seek(AccFile,0);
    // чтение учетных записей из файла для проверки уникальности введенного имени
    while not Eof(AccFile) do begin
      Read(AccFile,UserAcc);
        if UserName.Text=UserAcc.UserName then Break;
      end;
    // if user already exists
    if UserName.Text=UserAcc.UserName then begin
      // вывод сообщения об ошибке 
      ShowMessage('User '+Form4.UserName.Text+
          ' is already registered!');
      CanClose:=false;
      ActiveControl:=UserName;
      end;
    end;

end;

end.
