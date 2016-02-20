unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, unit1;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

  function CheckPassword(const Pass:string):Boolean;

implementation

{$R *.dfm}

function CheckPassword(const Pass:string):Boolean;
var
  i,plen:integer;
  cbeg,bukv,cend:boolean;

begin
  cbeg:=false;
  bukv:=false;
  cend:=false;
  plen:=length(Pass);
  for i:= 1 to plen do
  begin
  if (Pass[i] in ['0'..'9']) and not cbeg then cbeg:=true;
  if (cbeg and IsCharAlpha(Pass[i]) and not bukv) then bukv:=true;
  if (cbeg and bukv and (Pass[i] in ['0'..'9'])) and not cend then cend:=true;
  end;
  Result:=cbeg and bukv and cend;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
Edit1.Text:='';
Edit2.Text:='';
ActiveControl:=Edit1;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if ModalResult=mrOk then
  // если новый пароль не совпадает с его подтверждением
  if Edit1.Text<>Edit2.Text then begin
          // вывод сообщения об ошибке
  ShowMessage('Password must match!');
           // установка фокуса ввода на редактор для ввода пароля
  ActiveControl:=Edit1;
          // запрет закрытия окна
  CanClose:=false;
  end
    // если в введенном пароле не соблюдены установленные администратором ограничения
  else if UserAcc.Restrict and not CheckPassword(Edit1.Text) then begin
              // вывод сообщения об ошибке
  ShowMessage('Password does not meet requirement!');
              // установка фокуса ввода на редактор для ввода пароля
  ActiveControl:=Edit1;
              // запрет закрытия окна
  CanClose:=false;
  end
  // если ошибок нет, то окно может быть закрыто
 else CanClose:=true;

end;
procedure TForm3.Button1Click(Sender: TObject);
begin
 if Edit1.Text<>Edit2.Text then begin
          // вывод сообщения об ошибке
  ShowMessage('Password must match!');
           // установка фокуса ввода на редактор для ввода пароля
  ActiveControl:=Edit1;
          // запрет закрытия окна
  //CanClose:=false;
  end
    // если в введенном пароле не соблюдены установленные администратором ограничения
  else if UserAcc.Restrict and not CheckPassword(Edit1.Text) then begin
              // вывод сообщения об ошибке
  ShowMessage('Password does not meet requirement!');
              // установка фокуса ввода на редактор для ввода пароля
  ActiveControl:=Edit1;
              // запрет закрытия окна
  //CanClose:=false;
  end;
  // если ошибок нет, то окно может быть закрыто
  //else CanClose:=true;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
close();
end;

end.
