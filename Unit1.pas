unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

  const
MAXNAME=20; //maximum length of username
MAXPASS=10; //maximum length of password

type
  AccountType=record
    UserName:string[MAXNAME];
    UserPass:string[MAXPASS];
    Block:Boolean; //true if user is blocked, false otherwise.
    Restrict:Boolean; //restrict password parameters
    end;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Button1: TButton;
    N1: TMenuItem;
    N2: TMenuItem;
    Change: TMenuItem;
    New: TMenuItem;
    All: TMenuItem;
    Exit1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ChangeClick(Sender: TObject);
    procedure NewClick(Sender: TObject);
    procedure AllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  UserAcc:AccountType;
  AccFile:file of AccountType; //file handle for storing account data
  RecCount:Cardinal; // number of current account
  UserN:string;

implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}

const SECFILE='security.db'; //file for storing account data
var EnterCount:Cardinal=0; //number of sign in attempts.


procedure TForm1.FormCreate(Sender: TObject);
begin
AssignFile(AccFile,SECFILE);
if not FileExists(SECFILE) then begin
  Rewrite(AccFile);
  UserAcc.UserName:='ADMIN';
  UserAcc.UserPass:='';
  UserAcc.Block:=false;
  UserAcc.Restrict:=true;
  Write(AccFile,UserAcc);
  CloseFile(AccFile);
 end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if PasswordDlg.ShowModal=mrOk then begin
Reset(AccFile);
RecCount:=0;
while not Eof(AccFile) do begin
 Read(AccFile,UserAcc);
 Inc(RecCount);
 if PasswordDlg.Login.Text=UserAcc.UserName then
 Break;
  end;
  if PasswordDlg.Login.Text<>UserAcc.UserName then begin
  CloseFile(AccFile);
  Raise Exception.Create('You are not registered');
  end
  else if UserAcc.UserPass='' then
   if Form3.ShowModal=mrOk then begin
   Seek(AccFile,RecCount-1);
   UserAcc.UserPass:=Form3.Edit1.Text;
   write(AccFile,UserAcc);
   end
   else begin
   CloseFile(AccFile);
   Exit;
   end
   else begin  //user already has password
   if UserAcc.UserPass<>PasswordDlg.Password.Text then
   begin
    Inc(EnterCount);
    CloseFile(AccFile);
    if EnterCount>2 then begin //login attempts exceeded
     Button1.Visible:=false;
     Raise Exception.Create('Login not possible');
     end
     else
     Raise Exception.Create('Incorrect password');
     end
     else;
     end;
     if UserAcc.Block then begin
     CloseFile(AccFile);
     Raise Exception.Create('You have been blocked');
     end;

     if UserAcc.UserName='ADMIN' then begin
      All.Enabled:=true;
      New.Enabled:=true;
      CloseFile(AccFile);
      end;
      Change.Enabled:=true;
      Button1.Visible:=false;
      end;
      

end;

procedure TForm1.ChangeClick(Sender: TObject);
begin
  if All.Enabled then begin
      Reset(AccFile);
      // clear number of current user
      RecCount:=0;
      // get account of the ADMIN
      Read(AccFile,UserAcc);
      Inc(RecCount);
      end;
  if Form3.ShowModal=mrOk then begin
    // смещение к началу текущей учетной записи в файле
    Seek(AccFile,RecCount-1);
    UserAcc.UserPass:=Form3.Edit1.Text;

   Write(AccFile,UserAcc);
    end; 
  // close file if admin session
 if All.Enabled then CloseFile(AccFile);
end;

procedure TForm1.NewClick(Sender: TObject);
begin
  Reset(AccFile);
  // show window to add new user
 if Form4.ShowModal=mrOk then begin 
    // add to the file ending.
    Seek(AccFile,FileSize(AccFile));
    // save the name
    UserAcc.UserName:=Form4.UserName.Text;
    // password field is empty
    UserAcc.UserPass:='';
    UserAcc.Block:=false;
    // user is restricted until he enters password
    UserAcc.Restrict:=true;

    Write(AccFile,UserAcc);
    end;
  CloseFile(AccFile);

end;

procedure TForm1.AllClick(Sender: TObject);
begin
  Reset(AccFile);
  RecCount:=0;
  // чтение первой учетной записи
  Read(AccFile,UserAcc);
  Inc(RecCount);
  // отображение имени учетной записи
  Form5.UserName.Text:=UserAcc.UserName;
  Form5.CheckBox1.Checked:=UserAcc.Block;
  Form5.CheckBox2.Checked:=UserAcc.Restrict;
  //disable next button if there is no other user.
  Form5.Next.Enabled:=not Eof(AccFile);
  //if file end, return to the begin
  if Eof(AccFile) then Seek(AccFile,0)
  //else, go to the next account in the file
  else Seek(AccFile,RecCount);
  Form5.ShowModal;
  CloseFile(AccFile); 

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
           // if normal user, then close file
          if Change.Enabled and not All.Enabled then CloseFile(AccFile);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 MessageDLG('A-08-12 Icha C.A. Вариант 22: Чередование цифр, букв и снова цифр.',mtInformation,[mbOk],0);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  close();
end;

end.
