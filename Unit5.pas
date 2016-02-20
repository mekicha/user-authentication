unit Unit5;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,unit1;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    UserName: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Next: TButton;
    Button2: TButton;
    Button1: TButton;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure NextClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.FormShow(Sender: TObject);
begin
 ActiveControl:=Button1;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  UserAcc.Block:=CheckBox1.Checked;
  UserAcc.Restrict:=CheckBox2.Checked;
  // Go to the user we want to modify its parameters
  Seek(AccFile,RecCount-1);
  Write(AccFile,UserAcc);

end;

procedure TForm5.NextClick(Sender: TObject);
begin
 Read(AccFile,UserAcc);
 // Increase number of current account
 Inc(RecCount); 
 // display name of account
 UserName.Text:=UserAcc.UserName;
 // display blocking parameter
 CheckBox1.Checked:=UserAcc.Block;
 // display restriction parameter
 CheckBox2.Checked:=UserAcc.Restrict;
 //disable next if this is the last user
 Next.Enabled:=not Eof(AccFile);

end;

end.
