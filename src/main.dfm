object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'DC Address Calculator'
  ClientHeight = 179
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 6
    Top = 4
    Width = 253
    Height = 169
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Address'
      object Label1: TLabel
        Left = 12
        Top = 40
        Width = 217
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Absolute file offset reference to search :'
      end
      object Label2: TLabel
        Left = 12
        Top = 90
        Width = 217
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Value to search in the binary :'
      end
      object Label3: TLabel
        Left = 7
        Top = 7
        Width = 227
        Height = 13
        Caption = 'Absolute file offset to DC virtual address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Edit1: TEdit
        Left = 12
        Top = 55
        Width = 217
        Height = 21
        MaxLength = 8
        TabOrder = 0
        Text = '0'
        OnChange = Edit1Change
        OnKeyPress = Edit1KeyPress
      end
      object Edit2: TEdit
        Left = 12
        Top = 105
        Width = 217
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Offset'
      ImageIndex = 1
      object Label4: TLabel
        Left = 7
        Top = 7
        Width = 230
        Height = 13
        Caption = 'DC virtual address to Absolute file offset '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label5: TLabel
        Left = 12
        Top = 40
        Width = 217
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'DC Virtual address (little-endian) :'
      end
      object Label6: TLabel
        Left = 12
        Top = 90
        Width = 217
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Real file offset :'
      end
      object Edit3: TEdit
        Left = 12
        Top = 55
        Width = 217
        Height = 21
        MaxLength = 8
        TabOrder = 0
        Text = '0000018C'
        OnChange = Edit3Change
        OnKeyPress = Edit3KeyPress
      end
      object Edit4: TEdit
        Left = 12
        Top = 105
        Width = 217
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
end
