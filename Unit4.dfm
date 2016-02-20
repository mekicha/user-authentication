object Form4: TForm4
  Left = 508
  Top = 177
  Width = 445
  Height = 394
  Caption = 'Add new user'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 56
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object UserName: TEdit
    Left = 104
    Top = 56
    Width = 193
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 104
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 216
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
