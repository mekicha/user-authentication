object Form3: TForm3
  Left = 494
  Top = 203
  Width = 445
  Height = 392
  Caption = 'Change Password'
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
    Left = 24
    Top = 48
    Width = 71
    Height = 13
    Caption = 'New Password'
  end
  object Label2: TLabel
    Left = 40
    Top = 112
    Width = 35
    Height = 13
    Caption = 'Confirm'
  end
  object Edit1: TEdit
    Left = 120
    Top = 48
    Width = 185
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 120
    Top = 112
    Width = 185
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 56
    Top = 224
    Width = 97
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 224
    Width = 105
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = Button2Click
  end
end
