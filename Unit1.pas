unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TMain = class(TForm)
    Background: TImage;
    AboutLb: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AboutLbClick(Sender: TObject);
  private
    procedure WMHotKey(var Msg : TWMHotKey); message WM_HOTKEY;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

const
  ExtendedKeys: set of Byte = [
  VK_INSERT, VK_DELETE, VK_HOME, VK_END, VK_PRIOR, VK_NEXT,
  VK_LEFT, VK_UP, VK_RIGHT, VK_DOWN, VK_NUMLOCK];

implementation

{$R *.dfm}

procedure SimulateKeyDown(Key : byte);
var
  flags: DWORD;
begin
  if Key in ExtendedKeys then flags := KEYEVENTF_EXTENDEDKEY else flags := 0;
  keybd_event(Key, MapVirtualKey(Key, 0), flags, 0);
end;

procedure SimulateKeyUp(Key : byte);
var
  flags: DWORD;
begin
  if Key in ExtendedKeys then flags := KEYEVENTF_EXTENDEDKEY else flags := 0;
  keybd_event(Key, MapVirtualKey(Key, 0), KEYEVENTF_KEYUP or flags, 0);
end;

procedure SimulateKey(Key : byte);
begin
  SimulateKeyDown(Key);
  Sleep(10);
  SimulateKeyUp(Key);
end;

procedure TMain.WMHotKey(var Msg: TWMHotKey);
begin
  if Msg.HotKey = VK_NumPad1 then begin
    SimulateKey(ord('Q'));
    SimulateKey(ord('Q'));
    SimulateKey(ord('Q'));
    SimulateKey(ord('R'));
  end;

  if Msg.HotKey = VK_NumPad2 then begin
    SimulateKey(ord('Q'));
    SimulateKey(ord('Q'));
    SimulateKey(ord('W'));
    SimulateKey(ord('R'));
    Sleep(500);
    SimulateKey(ord('D'));
  end;

  if Msg.HotKey = VK_NumPad3 then begin
    SimulateKey(ord('Q'));
    SimulateKey(ord('Q'));
    SimulateKey(ord('E'));
    SimulateKey(ord('R'));
  end;

  if Msg.HotKey = VK_NumPad4 then begin
    SimulateKey(ord('W'));
    SimulateKey(ord('W'));
    SimulateKey(ord('W'));
    SimulateKey(ord('R'));
  end;

  if Msg.HotKey = VK_NumPad5 then begin
    SimulateKey(ord('W'));
    SimulateKey(ord('W'));
    SimulateKey(ord('Q'));
    SimulateKey(ord('R'));
  end;

  if Msg.HotKey = VK_NumPad6 then begin
    SimulateKey(ord('W'));
    SimulateKey(ord('W'));
    SimulateKey(ord('E'));
    SimulateKey(ord('R'));
  end;

  if Msg.HotKey = VK_NumPad7 then begin
    SimulateKey(ord('Q'));
    SimulateKey(ord('W'));
    SimulateKey(ord('E'));
    SimulateKey(ord('R'));
  end;

  if Msg.HotKey = VK_NumPad8 then begin
    SimulateKey(ord('E'));
    SimulateKey(ord('E'));
    SimulateKey(ord('E'));
    SimulateKey(ord('R'));
  end;

  if Msg.HotKey = VK_NumPad9 then begin
    SimulateKey(ord('E'));
    SimulateKey(ord('E'));
    SimulateKey(ord('Q'));
    SimulateKey(ord('R'));
  end;

  if Msg.HotKey = VK_NumPad0 then begin
    SimulateKey(ord('E'));
    SimulateKey(ord('E'));
    SimulateKey(ord('W'));
    SimulateKey(ord('R'));
  end;

end;

procedure TMain.FormCreate(Sender: TObject);
begin
  Application.Title:=Caption;
  RegisterHotKey(Main.Handle, VK_NumPad0, 0, VK_NumPad0);
  RegisterHotKey(Main.Handle, VK_NumPad1, 0, VK_NumPad1);
  RegisterHotKey(Main.Handle, VK_NumPad2, 0, VK_NumPad2);
  RegisterHotKey(Main.Handle, VK_NumPad3, 0, VK_NumPad3);
  RegisterHotKey(Main.Handle, VK_NumPad4, 0, VK_NumPad4);
  RegisterHotKey(Main.Handle, VK_NumPad5, 0, VK_NumPad5);
  RegisterHotKey(Main.Handle, VK_NumPad6, 0, VK_NumPad6);
  RegisterHotKey(Main.Handle, VK_NumPad7, 0, VK_NumPad7);
  RegisterHotKey(Main.Handle, VK_NumPad8, 0, VK_NumPad8);
  RegisterHotKey(Main.Handle, VK_NumPad9, 0, VK_NumPad9);
end;

procedure TMain.FormDestroy(Sender: TObject);
begin
  UnRegisterHotKey(Main.Handle, VK_NumPad0);
  UnRegisterHotKey(Main.Handle, VK_NumPad1);
  UnRegisterHotKey(Main.Handle, VK_NumPad2);
  UnRegisterHotKey(Main.Handle, VK_NumPad3);
  UnRegisterHotKey(Main.Handle, VK_NumPad4);
  UnRegisterHotKey(Main.Handle, VK_NumPad5);
  UnRegisterHotKey(Main.Handle, VK_NumPad6);
  UnRegisterHotKey(Main.Handle, VK_NumPad7);
  UnRegisterHotKey(Main.Handle, VK_NumPad8);
  UnRegisterHotKey(Main.Handle, VK_NumPad9);
end;

procedure TMain.AboutLbClick(Sender: TObject);
begin
  Application.MessageBox('Последнее обновления: 08.06.2017'+#13#10+'http://r57zone.github.io'+#13#10+'r57zone@gmail.com', 'О программе...', 0);
end;

end.
