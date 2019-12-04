unit TBXLCLWinCompat;

interface

uses
  {$ifdef MSWindows}Windows,{$endif}
  Types, LCLIntf, LCLType, LMessages, Controls;

type
  ULONG    = LongWord; //
  LONG_PTR = PtrInt;
  WINBOOL  = LongBool;

const
  LM_PRINT            = LM_USER + $3000;
  WM_PrintClient      = LM_USER + $3001; //
  WM_DISPLAYCHANGE    = LM_USER + $3002; // todo: LCL should be used
  WM_SYSCOLORCHANGE   = LM_USER + $3003; // todo: LCL should be used
  WM_THEMECHANGED     = LM_USER + $3004; // todo: LCL should be used
  WM_ACTIVATEAPP      = LM_USER + $3005; // todo: LCL should be used
  WM_Close            = LM_USER + $3006;
  WM_GETOBJECT        = LM_USER + $3007;
  WM_GETMINMAXINFO    = LM_USER + $3008;
  WM_MOUSEACTIVATE    = LM_USER + $3009;
  WM_NCRButtonUp      = LM_USER + $300A;
  WM_NCMouseLeave     = LM_USER + $300B;

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
  WM_KEYDOWN          = LM_KEYDOWN;
  WM_KEYUP            = LM_KEYUP;
  WM_ACTIVATE         = LM_ACTIVATE;
  WM_NCLBUTTONDOWN    = LM_NCLBUTTONDOWN;
  WM_CONTEXTMENU      = LM_CONTEXTMENU;
  WM_NCMOUSEMOVE      = LM_NCMOUSEMOVE;
  WM_CAPTURECHANGED   = LM_CAPTURECHANGED;
  WM_NCLButtonDblClk  = LM_NCLBUTTONDBLCLK;
  WM_NCACTIVATE       = LM_NCACTIVATE;
  WM_TIMER            = LM_TIMER;

  WHEEL_DELTA         = 120;

type
  TMinMaxInfo = record
    ptReserved     : TPoint;
    ptMaxSize      : TPoint;
    ptMaxPosition  : TPoint;
    ptMinTrackSize : TPoint;
    ptMaxTrackSize : TPoint;
  end;
  PMinMaxInfo = ^TMinMaxInfo;

  TLMNCMouseMove = record
    Msg: Cardinal;
    {$ifdef cpu64}
    UnusedMsg: Cardinal;
    {$endif}
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

  TWMSize            = TLMSize;
  TMessage           = TLMessage;
  TWMKey             = TLMKey;

  TWMClose           = TLMessage; // todo:
  TWMEraseBkgnd      = TLMEraseBkgnd;
  TWMNCCalcSize      = TLMNCCalcSize;
  TWMPaint           = TLMPaint;
  TWMKeyDown         = TLMKeyDown;
  TWMMove            = TLMMove;
  TWMSysCommand      = TLMSysCommand;
  TWMActivate        = TLMActivate;
  TWMGetMinMaxInfo   = record
    Msg: Cardinal;
    {$ifdef cpu64}
    UnusedMsg: Cardinal;
    {$endif}
    UnusedW : WPARAM;
    MinMaxInfo : PMinMaxInfo;
  end; // todo!
  TWMMouseActivate   = TLMessage; // todo:
  TWMNCHitTest       = TLMNCHITTEST;
  TLMNCMouseUpDown   = record
    Msg: Cardinal;
    {$ifdef cpu64}
    UnusedMsg: Cardinal;
    {$endif}
    HitTest : WPARAM;
    XCursor: SmallInt;
    YCursor: SmallInt;
  end;
  TWMNCLButtonDblClk = TLMNCMouseUpDown;
  TWMNCLButtonDown   = TLMNCMouseUpDown;
  TWMNCRButtonUp     = TLMNCMouseUpDown;
  TWMContextMenu     = TLMContextMenu;
  TWMMouseMove       = TLMMouseMove;
  TWMNCMouseMove     = TLMNCMouseMove;
  TWMSetCursor       = TLMSetCursor;
  TWMTimer           = TLMTimer;

const
  // from WinAPI (Windows)
  VER_PLATFORM_WIN32_NT = 2;

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

  IDC_ARROW   = nil; // todo:
  IDC_SIZEALL = nil; // todo!
  IDC_SIZEWE  = nil; // todo!
  IDC_SIZENS  = nil; // todo!
  IDC_NO      = nil;

  { WNDCLASS structure  }
  CS_BYTEALIGNCLIENT = 4096;
  CS_BYTEALIGNWINDOW = 8192;
  CS_CLASSDC = 64;
  CS_DBLCLKS = 8;
  CS_GLOBALCLASS = 16384;
  CS_HREDRAW = 2;
  CS_KEYCVTWINDOW = 4;
  CS_NOCLOSE = 512;
  CS_NOKEYCVT = 256;
  CS_OWNDC = 32;
  CS_PARENTDC = 128;
  CS_SAVEBITS = 2048;
  CS_VREDRAW = 1;

  { WM_NCHITTEST message  }
  HTBOTTOM = 15;
  HTBOTTOMLEFT = 16;
  HTBOTTOMRIGHT = 17;
  HTCAPTION = 2;
  HTCLIENT = 1;
  HTERROR = -(2);
  HTGROWBOX = 4;
  HTHSCROLL = 6;
  HTLEFT = 10;
  HTMENU = 5;
  HTNOWHERE = 0;
  HTREDUCE = 8;
  HTRIGHT = 11;
  HTSIZE = 4;
  HTSYSMENU = 3;
  HTTOP = 12;
  HTTOPLEFT = 13;
  HTTOPRIGHT = 14;
  HTTRANSPARENT = -(1);
  HTVSCROLL = 7;
  HTZOOM = 9;

  HTBORDER = 18;
  HTSIZEFIRST = HTLEFT;
  HTSIZELAST = HTBOTTOMRIGHT;
  HTOBJECT = 19;
  HTCLOSE = 20;
  HTHELP = 21;
  HTMINBUTTON = HTREDUCE;
  HTMAXBUTTON = HTZOOM;

  MA_ACTIVATE         = 1; // Activates the window, and does not discard the mouse message.
  MA_ACTIVATEANDEAT   = 2; // Activates the window, and discards the mouse message.
  MA_NOACTIVATE       = 3; // Does not activate the window, and does not discard the mouse message.
  MA_NOACTIVATEANDEAT = 4; // Does not activate the window, but discards the mouse message.

  { GetNextWindow, GetWindow  }
  GW_HWNDNEXT  = 2;
  GW_HWNDPREV  = 3;
  GW_CHILD     = 5;
  GW_HWNDFIRST = 0;
  GW_HWNDLAST  = 1;
  GW_OWNER     = 4;

// from WinAPI (Windows);
function GetWindowDC(AHandle: THandle): HDC;
procedure ValidateRect(Handle: THandle; p: PRect);
function DefWindowProc(FWindowHandle: THandle; Msg: UINT; wParam, lParam: PtrUInt): PtrUInt;
function MapWindowPoints(hWndFrom, hWndTo: HWND; var lpPoints; cPoints: UINT): Integer; // todo: use LCL
type
  ENUMWINDOWSPROC = function (_para1:HWND; _para2:LPARAM):LongBool;stdcall;
function EnumWindows(lpEnumFunc:ENUMWINDOWSPROC; lParam:LPARAM):LongBool;
function EnumChildWindows(hWndParent:HWND; lpEnumFunc:ENUMWINDOWSPROC; lParam:LPARAM):LongBool; // todo: use LCL
function EnumThreadWindows(dwThreadId:DWORD; lpfn:ENUMWINDOWSPROC; lParam:LPARAM):WINBOOL;

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
function SendNotifyMessage(hWnd:HWND; Msg:UINT; wParam:WPARAM; lParam:LPARAM):LongBool;
function IsChild(aparent, achild: HWND): Boolean; //todo: LCL should be used instead;
function BringWindowToTop(win: HWND): LongBool; //todo: LCL should be used
function GetUpdateRect(hWnd: HWND; const lpRect: TRect; bErase: LongBool): LongBool;
function GetWindow(hWnd: HWND; direction: Longword): HWND; //todo: LCL should be used
function SetPixelV(dc: HDC; x,y: integer; color: COLORREF): LongBool; //todo:
function OffsetWindowOrgEx(DC: hdc; x,y: integer; var lppt : TPoint): WINBOOL;

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

function EnumThreadWindows(dwThreadId: DWORD; lpfn: ENUMWINDOWSPROC;
  lParam: LPARAM): WINBOOL;
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

function SendNotifyMessage(hWnd:HWND; Msg:UINT; wParam:WPARAM; lParam:LPARAM):LongBool;
begin
  if ThreadID <> mainThreadID then
    LCLIntf.PostMessage(hWnd, Msg, wParam, lParam)
  else
    LCLIntf.SendMessage(hWnd, Msg, wParam, lParam);
  Result := true;
end;

function IsChild(aparent, achild: HWND): Boolean;
begin
  Result := false;
end;

function BringWindowToTop(win: HWND): LongBool;
begin
  Result := true;
end;

function GetUpdateRect(hWnd: HWND; const lpRect: TRect; bErase: LongBool): LongBool;
begin
  Result := true;
end;

function GetWindow(hWnd: HWND; direction: Longword): HWND; //todo: LCL should be used
begin
  Result := 0;
end;

function SetPixelV(dc: HDC; x,y: integer; color: COLORREF): LongBool;
begin
  Result := false;
end;

function OffsetWindowOrgEx(DC: hdc; x,y: integer; var lppt : TPoint): WINBOOL;
begin
end;

initialization
  mainThreadID := ThreadID;

end.
