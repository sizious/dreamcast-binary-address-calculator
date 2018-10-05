unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  START_ADDRESS = $8c010000;

function Swap(Value: Int64): Int64;
var
  Temp: Int64;
  i: Integer;
  
begin
  Temp := Value;
  Value := 0;
  for i := 0 to 3 do
  begin
    Value := (Value shl 8) or (Temp and $FF);
    Temp := Temp shr 8;
  end;
  Result := Value;
end;

function HexToInt64(Hex: string): Int64;
const
  HexValues = '0123456789ABCDEF';
var
  i: integer;
begin
  Result := 0;
  case Length(Hex) of
    0: Result := 0;
    1..16: for i:=1 to Length(Hex) do
      Result := 16*Result + Pos(Upcase(Hex[i]), HexValues)-1;
    else for i:=1 to 16 do
      Result := 16*Result + Pos(Upcase(Hex[i]), HexValues)-1;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  new_value: Int64;

begin
  new_value := HexToInt64(Edit1.Text) + START_ADDRESS;
  edit2.text := IntToHex(Swap(new_value), 8);
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (GetKeyState(VK_CONTROL) < 0) then Exit;
  if not (Key in [#8, 'A'..'F', 'a'..'f', '0'..'9']) then
    Key := #0;
end;

procedure TForm1.Edit3Change(Sender: TObject);
var
  new_value: Int64;

begin
  try
    new_value := Swap(HexToInt64(Edit3.Text));
    if new_value < START_ADDRESS then
      raise Exception.Create('ERR');
    edit4.text := IntToHex(new_value - START_ADDRESS, 1);
  except
    edit4.text := '<< INVALID INPUT >>';
  end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if (GetKeyState(VK_CONTROL) < 0) then Exit;
  if not (Key in [#8, 'A'..'F', 'a'..'f', '0'..'9']) then
    Key := #0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1Change(Self);
  Edit3Change(Self);
end;

end.
