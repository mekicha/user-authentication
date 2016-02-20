object PasswordDlg: TPasswordDlg
  Left = 118
  Top = 410
  BorderStyle = bsDialog
  Caption = 'Log In'
  ClientHeight = 286
  ClientWidth = 376
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 97
    Width = 76
    Height = 13
    Caption = 'Enter password:'
  end
  object Label2: TLabel
    Left = 16
    Top = 24
    Width = 73
    Height = 17
    Caption = 'Username:'
  end
  object Password: TEdit
    Left = 96
    Top = 91
    Width = 177
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object OKBtn: TButton
    Left = 46
    Top = 195
    Width = 83
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelBtn: TButton
    Left = 166
    Top = 195
    Width = 83
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object Login: TEdit
    Left = 96
    Top = 24
    Width = 177
    Height = 21
    TabOrder = 3
  end
end
