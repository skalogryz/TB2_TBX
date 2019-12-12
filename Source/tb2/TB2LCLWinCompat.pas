unit TB2LCLWinCompat;

interface

uses
  {$ifdef MSWindows}Windows,{$endif}
  Types, LCLIntf, LCLType, LMessages, Controls;

type
  ULONG    = LongWord; //
  LONG_PTR = PtrInt;
  WINBOOL  = LongBool;

const
  WM_APP              = {$ifndef mswindows}$8000{$else}Windows.WM_APP{$endif};
  LM_PRINT            = {$ifndef mswindows}LM_USER + $3000{$else}Windows.WM_PRINT         {$endif};
  WM_PrintClient      = {$ifndef mswindows}LM_USER + $3001{$else}Windows.WM_PrintClient   {$endif};
  WM_DISPLAYCHANGE    = {$ifndef mswindows}LM_USER + $3002{$else}Windows.WM_DISPLAYCHANGE {$endif}; // todo: LCL should be used
  WM_SYSCOLORCHANGE   = {$ifndef mswindows}LM_USER + $3003{$else}Windows.WM_SYSCOLORCHANGE{$endif}; // todo: LCL should be used
  WM_THEMECHANGED     = {$ifndef mswindows}LM_USER + $3004{$else}Windows.WM_THEMECHANGED  {$endif}; // todo: LCL should be used
  WM_ACTIVATEAPP      = {$ifndef mswindows}LM_USER + $3005{$else}Windows.WM_ACTIVATEAPP   {$endif}; // todo: LCL should be used
  WM_Close            = {$ifndef mswindows}LM_USER + $3006{$else}Windows.WM_Close         {$endif};
  WM_GETOBJECT        = {$ifndef mswindows}LM_USER + $3007{$else}Windows.WM_GETOBJECT     {$endif};
  WM_GETMINMAXINFO    = {$ifndef mswindows}LM_USER + $3008{$else}Windows.WM_GETMINMAXINFO {$endif};
  WM_MOUSEACTIVATE    = {$ifndef mswindows}LM_USER + $3009{$else}Windows.WM_MOUSEACTIVATE {$endif};
  WM_NCMouseLeave     = {$ifndef mswindows}LM_USER + $300B{$else}Windows.WM_NCMouseLeave  {$endif};
  WM_SETREDRAW        = {$ifndef mswindows}LM_USER + $300A{$else}Windows.WM_SETREDRAW     {$endif};
  WM_DEADCHAR         = LM_USER + $3010;
  WM_SYSDEADCHAR      = LM_USER + $3011;



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
  WM_CONTEXTMENU      = LM_CONTEXTMENU;
  WM_NCMOUSEMOVE      = LM_NCMOUSEMOVE;
  WM_CAPTURECHANGED   = LM_CAPTURECHANGED;
  WM_NCACTIVATE       = LM_NCACTIVATE;
  WM_TIMER            = LM_TIMER;
  WM_MouseLeave       = LM_MOUSELEAVE;
  WM_KILLFOCUS        = LM_KILLFOCUS;
  WM_SETFOCUS         = LM_SETFOCUS;
  WM_NOTIFY           = LM_NOTIFY;
  WM_SETFONT          = LM_SETFONT;
  WM_LBUTTONDBLCLK    = LM_LBUTTONDBLCLK;
  WM_RBUTTONDBLCLK    = LM_RBUTTONDBLCLK;
  WM_MBUTTONDOWN      = LM_MBUTTONDOWN;
  WM_MBUTTONDBLCLK    = LM_MBUTTONDBLCLK;
  WM_SYSKEYDOWN       = LM_SYSKEYDOWN;
  WM_SYSKEYUP         = LM_SYSKEYUP;
  WM_MOUSEFIRST       = LM_MOUSEFIRST;
  WM_MOUSELAST        = LM_MOUSELAST;
  WM_MOUSEWHEEL       = LM_MOUSEWHEEL;

  WM_NCLBUTTONDOWN    = LM_NCLBUTTONDOWN;
  WM_NCLBUTTONUP      = LM_NCLBUTTONUP;
  WM_NCLButtonDblClk  = LM_NCLBUTTONDBLCLK;
  WM_NCRBUTTONDOWN    = 164;
  WM_NCRBUTTONUP      = 165;
  WM_NCRBUTTONDBLCLK  = 166;
  WM_NCMBUTTONDOWN    = 167;
  WM_NCMBUTTONUP      = 168;
  WM_NCMBUTTONDBLCLK  = 169;
  WM_COMMAND          = LM_COMMAND;

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
  TWMWinIniChange    = TLMessage;
  TWMCancelMode      = TLMessage;
  TWMWindowPosChanged = TLMessage;
  TWMActivateApp     = TLMessage;
  TCMFocusChanged    = TLMessage;
  TWMNotify          = TLMNotify;
  TWMNCPaint         = TLMessage;
  TWMKillFocus       = TLMKillFocus;
  TWMMeasureItem     = TLMMeasureItem;
  TWMDrawItem        = TLMDrawItems;
  TWMSetFont         = TLMessage;
  TWMChar            = TLMChar;

  TMessageEvent = procedure (var Msg: TMsg; var Handled: Boolean) of object;

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
  IDC_NO      = nil; // todo!
  IDC_IBEAM   = nil; // todo!
  IDI_APPLICATION = nil; //todo:
  IDC_HAND        = nil; //todo:

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
  CS_IME = $10000;
  CS_DROPSHADOW = $20000;

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

  { ForegroundIdleProc  }
  HC_ACTION = 0;

  { CBTProc  }
  HCBT_ACTIVATE = 5;
  HCBT_CLICKSKIPPED = 6;
  HCBT_CREATEWND = 3;
  HCBT_DESTROYWND = 4;
  HCBT_KEYSKIPPED = 7;
  HCBT_MINMAX = 1;
  HCBT_MOVESIZE = 0;
  HCBT_QS = 2;
  HCBT_SETFOCUS = 9;
  HCBT_SYSCOMMAND = 8;

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
function WideCharToMultiByte(
  CodePage: UInt;
  dwFlags: LongWord;
  lpWideCharStr: PWideChar;
  cchWideChar: integer;
  lpMultiByteStr: PAnsiChar;
  cbMultiByte: integer;
  lpDefaultChar: PChar;
  lpUsedDefaultChar: PLongBool
): Integer;
function MessageBeep(uType: LongWord): LongBool;

const
  { Combo Box  }
  CB_ADDSTRING             = 323;
  CB_DELETESTRING          = 324;
  CB_DIR                   = 325;
  CB_FINDSTRING            = 332;
  CB_FINDSTRINGEXACT       = 344;
  CB_GETCOUNT              = 326;
  CB_GETCURSEL             = 327;
  CB_GETDROPPEDCONTROLRECT = 338;
  CB_GETDROPPEDSTATE       = 343;
  CB_GETDROPPEDWIDTH       = 351;
  CB_GETEDITSEL            = 320;
  CB_GETEXTENDEDUI         = 342;
  CB_GETHORIZONTALEXTENT   = 349;
  CB_GETITEMDATA           = 336;
  CB_GETITEMHEIGHT         = 340;
  CB_GETLBTEXT             = 328;
  CB_GETLBTEXTLEN          = 329;
  CB_GETLOCALE             = 346;
  CB_GETTOPINDEX           = 347;
  CB_INITSTORAGE           = 353;
  CB_INSERTSTRING          = 330;
  CB_LIMITTEXT             = 321;
  CB_RESETCONTENT          = 331;
  CB_SELECTSTRING          = 333;
  CB_SETCURSEL             = 334;
  CB_SETDROPPEDWIDTH       = 352;
  CB_SETEDITSEL            = 322;
  CB_SETEXTENDEDUI         = 341;
  CB_SETHORIZONTALEXTENT   = 350;
  CB_SETITEMDATA           = 337;
  CB_SETITEMHEIGHT         = 339;
  CB_SETLOCALE             = 345;
  CB_SETTOPINDEX           = 348;
  CB_SHOWDROPDOWN          = 335;


{$ifndef mswindows}
// these variables are present at System Utils
var
  Win32Platform : Longint = 0;
  Win32MajorVersion  : dword = 0;
  Win32MinorVersion  : dword = 0;
  Win32BuildNumber   : dword = 0;
  Win32CSDVersion    : ShortString = '';   // CSD record is 128 bytes only?
{$endif}
function GetMenuStringW(hMenu: HMENU; uIDItem: UINT; lpString: PWideString;
  cchMax: integer; flags: UINT): integer;
function lStrLenW(pw: PWideChar): integer;

type
  TMenuItemInfo = record
    cbSize        : UINT;
    fMask         : UINT;
    fType         : UINT;
    fState        : UINT;
    wID           : UINT;
    hSubMenu      : HMENU;
    hbmpChecked   : HBITMAP;
    hbmpUnchecked : HBITMAP;
    dwItemData    : ULONG_PTR;
    dwTypeData    : PWideChar;
    cch           : UINT;
    hbmpItem      : HBITMAP;
  end;

const
  { MENUITEMINFO structure  }
  MIIM_CHECKMARKS  = 8;
  MIIM_DATA        = 32;
  MIIM_ID          = 2;
  MIIM_STATE       = 1;
  MIIM_SUBMENU     = 4;
  MIIM_TYPE        = 16;
  MIIM_STRING      = 64;
  MIIM_BITMAP      = 128;
  MIIM_FTYPE       = 256;
  MFT_BITMAP       = $4;
  MFT_MENUBARBREAK = $20;
  MFT_MENUBREAK    = $40;
  MFT_OWNERDRAW    = $100;
  MFT_RADIOCHECK   = $200;
  MFT_RIGHTJUSTIFY = $4000;
  MFT_SEPARATOR    = $800;
  MFT_RIGHTORDER   = $2000;
  MFT_STRING       = 0;
  MFS_CHECKED      = $8;
  MFS_DEFAULT      = $1000;
  MFS_DISABLED     = $3;
  MFS_ENABLED      = 0;
  MFS_GRAYED       = $3;
  MFS_HILITE       = $80;
  MFS_UNCHECKED    = 0;
  MFS_UNHILITE     = 0;
  { TrackPopupMenu, TrackPopMenuEx  }
  TPM_CENTERALIGN = $4;
  TPM_LEFTALIGN   = 0;
  TPM_RIGHTALIGN  = $8;
  TPM_LEFTBUTTON  = 0;
  TPM_RIGHTBUTTON = $2;
  TPM_HORIZONTAL  = 0;
  TPM_VERTICAL    = $40;
  TPM_TOPALIGN    = 0;
  TPM_VCENTERALIGN= $10;
  TPM_BOTTOMALIGN = $20;
  TPM_NONOTIFY    = $80;
  TPM_RETURNCMD   = $100;
  TPM_RECURSE         = $0001;
  TPM_HORPOSANIMATION = $0400;
  TPM_HORNEGANIMATION = $0800;
  TPM_VERPOSANIMATION = $1000;
  TPM_VERNEGANIMATION = $2000;
  TPM_NOANIMATION     = $4000;
  TPM_LAYOUTRTL       = $8000;

function IsMenu(AMenu: HMenu): Boolean;
function GetMenuItemCount(AMenu: HMenu): Integer;
function GetMenuItemInfo(mnu: HMENU; item: UINT; fByPosition : LongBool; var lpmii: TMenuItemInfo): LongBool;
function GetSystemMenu(hWnd: HWND; bRevert: LongBool): HMENU;
function EnableMenuItem(Mnu: HMENU; uIDEnableItem: UINT; uEnable: UINT): LongBool;
function TrackPopupMenuEx({%H-}Menu: HMENU; {%H-}uFlags: UINT; x,y: Integer;
  wnd: HWND; lptpm: Pointer): LongBool;

function GetClipBox(DC: HDC; var BoxR: TRect): integer;
function EnumFontFamiliesEx(DC: HDC; var LogFont:TLogFont;
  Callback: FontEnumExProc; Lparam:LParam; Flags: dword): longint;

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

function WideCharToMultiByte(
  CodePage: UInt;
  dwFlags: LongWord;
  lpWideCharStr: PWideChar;
  cchWideChar: integer;
  lpMultiByteStr: PAnsiChar;
  cbMultiByte: integer;
  lpDefaultChar: PChar;
  lpUsedDefaultChar: PLongBool
): Integer;
begin
  Result:=0;
end;

function MessageBeep(uType: LongWord): LongBool;
begin
  Result:=false;
end;

function GetMenuStringW(hMenu: HMENU; uIDItem: UINT; lpString: PWideString;
  cchMax: integer; flags: UINT): integer;
begin
  Result:=0;
end;

function lStrLenW(pw: PWideChar): integer;
begin
  //todo:
  Result:=0;
end;

function IsMenu(AMenu: HMenu): Boolean;
begin
  Result:=false;
end;

function GetMenuItemCount(AMenu: HMenu): Integer;
begin
  Result:=0;
end;

function GetMenuItemInfo(mnu: HMENU; item: UINT; fByPosition : LongBool; var lpmii: TMENUITEMINFO): LongBool;
begin
  Result:=false;
end;

function GetSystemMenu(hWnd: HWND; bRevert: LongBool): HMENU;
begin
  Result:=0;
end;

function EnableMenuItem(Mnu: HMENU; uIDEnableItem: UINT; uEnable: UINT): LongBool;
begin
  Result:=false;
end;

function TrackPopupMenuEx(Menu: HMENU; uFlags: UINT; x,y: Integer;
  wnd: HWND; lptpm: Pointer): LongBool;
begin
  Result:=false;
end;

function GetClipBox(DC: HDC; var BoxR: TRect): integer;
begin
  Result := LCLIntf.GetClipBox(dc, @BoxR);
end;

function EnumFontFamiliesEx(DC: HDC; var LogFont:TLogFont;
  Callback: FontEnumExProc; Lparam:LParam; Flags: dword): longint;
begin
  Result := LCLIntf.EnumFontFamiliesEx(DC, @LogFont,
    Callback, LParam, Flags);
end;


initialization
  mainThreadID := ThreadID;

end.
