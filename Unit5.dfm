object Form5: TForm5
  Left = 222
  Top = 146
  Width = 445
  Height = 391
  Caption = 'List of users'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object UserName: TEdit
    Left = 96
    Top = 16
    Width = 233
    Height = 21
    TabOrder = 0
  end
  object CheckBox1: TCheckBox
    Left = 96
    Top = 72
    Width = 97
    Height = 17
    Caption = 'Block user'
    TabOrder = 1
  end
  object CheckBox2: TCheckBox
    Left = 96
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Restrict Password'
    TabOrder = 2
  end
  object Next: TButton
    Left = 40
    Top = 168
    Width = 113
    Height = 25
    Caption = 'Next'
    TabOrder = 3
    OnClick = NextClick
  end
  object Button2: TButton
    Left = 216
    Top = 168
    Width = 113
    Height = 25
    Caption = 'Save'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 32
    Top = 232
    Width = 113
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 5
  end
  object Button4: TButton
    Left = 216
    Top = 232
    Width = 113
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
end
