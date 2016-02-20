object Form1: TForm1
  Left = 329
  Top = 187
  Width = 460
  Height = 426
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 120
    Top = 216
    Width = 209
    Height = 57
    Caption = 'Log In'
    TabOrder = 0
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 80
    Top = 8
    object N1: TMenuItem
      Caption = 'Users'
      object Change: TMenuItem
        Caption = 'Change Password'
        Enabled = False
        OnClick = ChangeClick
      end
      object New: TMenuItem
        Caption = 'New user'
        Enabled = False
        OnClick = NewClick
      end
      object All: TMenuItem
        Caption = 'All users'
        Enabled = False
        OnClick = AllClick
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object N2: TMenuItem
      Caption = 'About'
      OnClick = N2Click
    end
  end
end
