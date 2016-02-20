program zilab1;

uses
  Forms,
  Unit1 in '..\..\Documents\8sem\labs\Unit1.pas' {Form1},
  Unit2 in '..\..\Documents\8sem\labs\Unit2.pas' {PasswordDlg},
  Unit3 in '..\..\Documents\8sem\labs\Unit3.pas' {Form3},
  Unit4 in '..\..\Documents\8sem\labs\Unit4.pas' {Form4},
  Unit5 in '..\..\Documents\8sem\labs\Unit5.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TPasswordDlg, PasswordDlg);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
