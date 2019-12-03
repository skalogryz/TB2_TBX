unit TBXLCLWinCompat;

interface

uses
  Types, LCLIntf, LCLType, LMessages, Controls;

type
  ULONG = LongWord; //

const
  LM_PRINT            = LM_USER + $3000;
  WM_PrintClient      = LM_USER + $3001; //
  WM_DISPLAYCHANGE    = LM_USER + $3002; // todo: LCL should be used
  WM_SYSCOLORCHANGE   = LM_USER + $3003; // todo: LCL should be used
  WM_THEMECHANGED     = LM_USER + $3004; // todo: LCL should be used
  WM_ACTIVATEAPP      = LM_USER + $3005; // todo: LCL should be used
  WM_Close            = LM_USER + $3006;
  WM_GETOBJECT        = LM_USER + $3007;

  WM_EraseBkgnd       = LM_ERASEBKGND;
  WM_NCCalcSize       = LM_NCCALCSIZE;
  WM_NCPAINT          = LM_NCPAINT;
  WM_PAINT            = LM_PAINT;
  WM_PRINT            = LM_PRINT;
  WM_WindowPosChanged = LM_WINDOWPOSCHANGED;
  WM_Size             = LM_SIZE;
  WM_Move             = LM_MOVE;
  WM_MouseMove        = LM_MOUSEMOVE;
  WM_NCHitTest        = LM_NCHITTEST;
  WM_SetCursor        = LM_SETCURSOR;
  WM_SYSCOMMAND       = LM_SYSCOMMAND;
  HELP_CONTEXTPOPUP   = HELP_CONTEXT;
  WM_CHAR             = LM_CHAR;
  WM_SYSCHAR          = LM_SYSCHAR;
  WM_LBUTTONDOWN      = LM_LBUTTONDOWN;
  WM_RBUTTONDOWN      = LM_RBUTTONDOWN;
  WM_CANCELMODE       = LM_CANCELMODE;

  WHEEL_DELTA         = 120;

type
  TLMNCMouseMove = record
    HitTest : LongWord;
  end;

  TNonClientMetrics = record
    cbSize : UINT;
    iBorderWidth : longint;
    iScrollWidth : longint;
    iScrollHeight : longint;
    iCaptionWidth : longint;
    iCaptionHeight : longint;
    lfCaptionFont : LOGFONT;
    iSmCaptionWidth : longint;
    iSmCaptionHeight : longint;
    lfSmCaptionFont : LOGFONT;
    iMenuWidth : longint;
    iMenuHeight : longint;
    lfMenuFont : LOGFONT;
    lfStatusFont : LOGFONT;
    lfMessageFont : LOGFONT;
    //iPaddedBorderWidth : longint;     // WINVER >= 0x0600
  end;

  TWMSize = TLMSize;
  TMessage = TLMessage;
  TWMKey = TLMKey;

  TWMClose = TLMessage; // todo:
  TWMEraseBkgnd = TLMEraseBkgnd;
  TWMNCCalcSize = TLMNCCalcSize;
  TWMPaint = TLMPaint;

const
  // from WinAPI (Windows)
  VER_PLATFORM_WIN32_NT = 2;
  CS_DBLCLKS = 8;

  // For the TRackMouseEvent
  TME_HOVER     = $00000001;
  TME_LEAVE     = $00000002;
  TME_QUERY     = $40000000;
  TME_CANCEL    = DWORD($80000000);
  HOVER_DEFAULT = DWORD($FFFFFFFF);

  { WM_PRINT message  }
  PRF_CHECKVISIBLE = $1;
  PRF_CHILDREN = $10;
  PRF_CLIENT = $4;
  PRF_ERASEBKGND = $8;
  PRF_NONCLIENT = $2;
  PRF_OWNED = $20;

  { DrawCaption  }
  DC_ACTIVE   = 1;
  DC_SMALLCAP = 2;
  DC_ICON     = 4;
  DC_TEXT     = 8;
  DC_INBUTTON = 16;
  DC_GRADIENT = 32;
  DC_BUTTONS  = $1000;

  IDC_ARROW = 0; // todo:

// from WinAPI (Windows);
function GetWindowDC(AHandle: THandle): HDC;
procedure ValidateRect(Handle: THandle; p: PRect);
function DefWindowProc(FWindowHandle: THandle; Msg: UINT; wParam, lParam: PtrUInt): PtrUInt;
function MapWindowPoints(hWndFrom, hWndTo: HWND; var lpPoints; cPoints: UINT): Integer; // todo: use LCL
type
  ENUMWINDOWSPROC = function (_para1:HWND; _para2:LPARAM):LongBool;stdcall;
function EnumWindows(lpEnumFunc:ENUMWINDOWSPROC; lParam:LPARAM):LongBool;
function EnumChildWindows(hWndParent:HWND; lpEnumFunc:ENUMWINDOWSPROC; lParam:LPARAM):LongBool; // todo: use LCL
procedure OffsetClipRgn(DC: HDC; dx, dy: integer);
function PatBlt(_para1:HDC; _para2:longint; _para3:longint; _para4:longint; _para5:longint;_para6:DWORD): LongBool;
function DrawCaption(Wnd: THandle; DC: HDC; var R: TRect; Flags: LongWord): LongBool;
type
  ENUMFONTSPROC = function (const lplf: TLogFont; const lptm: TTextMetric;
    dwType: DWORD; lpData: LPARAM): Integer; stdcall;
function EnumFonts(_para1:HDC; _para2: PChar; _para3:ENUMFONTSPROC; _para4: Pointer):longint;
function SetTextAlign(DC: hdc; alignFlags: Integer): Integer; // this is not supported by LCL and needs to be handled manualy. (calculated?)
function GetMessagePos: DWORD;
function SetBrushOrgEx(_para1:HDC; _para2:longint; _para3:longint;  _para4: PPOINT):LongBool;

// always return the main thread, as windows can only be created in the main thread (UI) in LCL
function GetWindowThreadProcessId(window: THandle; procId: Pointer): TThreadID;
function GetDesktopWindow: THandle; // todo: this should not be needed

implementation

var
  mainThreadID: TThreadID;

function GetWindowThreadProcessId(window: THandle; procId: Pointer): TThreadID;
begin
  Result:=mainThreadId;
end;

function SetBrushOrgEx(_para1:HDC; _para2:longint; _para3:longint; _para4: PPOINT):LongBool;
begin
end;

function GetMessagePos: DWORD;
var
  p : TPoint;
begin
  if Assigned(Mouse) then begin
    p:= Mouse.CursorPos;
    Result:=(p.x and $FFFF) or (p.y shl 16);
  end else
    Result:=0;
end;

function EnumWindows(lpEnumFunc:ENUMWINDOWSPROC; lParam:LPARAM):LongBool;
begin
  Result := false;
end;

function EnumChildWindows(hWndParent:HWND; lpEnumFunc:ENUMWINDOWSPROC; lParam:LPARAM):LongBool;
begin
  Result := false;
end;

function MapWindowPoints(hWndFrom, hWndTo: HWND; var lpPoints; cPoints: UINT): Integer; // todo: use LCL
begin

end;

function GetWindowDC(AHandle: THandle): HDC;
begin
  Result := 0;
end;

procedure ValidateRect(Handle: THandle; p : PRect);
begin
end;

function DefWindowProc(FWindowHandle: THandle; Msg: UINT; wParam, lParam: PtrUInt): PtrUInt;
begin
  Result := 0;
end;

procedure OffsetClipRgn(DC: HDC; dx, dy: integer);
begin
end;

function PatBlt(_para1:HDC; _para2:longint; _para3:longint; _para4:longint; _para5:longint;_para6:DWORD): LongBool;
begin
end;

function DrawCaption(Wnd: THandle; DC: HDC; var R: TRect; Flags: LongWord): LongBool;
begin
end;

function EnumFonts(_para1:HDC; _para2: PChar; _para3:ENUMFONTSPROC; _para4: Pointer):longint;
begin
  Result:=0;
end;

function SetTextAlign(DC: hdc; alignFlags: Integer): Integer;
begin
  Result:=0;
end;

function GetDesktopWindow: THandle;
begin
  Result := 0;
end;

initialization
  mainThreadID := ThreadID;

end.
