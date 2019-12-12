unit lclsupport;

interface

uses
  Classes, SysUtils, Graphics, LCLType, Controls, Menus;

procedure InitializeCriticalSection(var CriticalSection : TRTLCriticalSection);
procedure DeleteCriticalSection(var CriticalSection : TRTLCriticalSection);

function ToSmallPoint(w: WParam): TSmallPoint;
function CopyPalette(src: HPALETTE): HPALETTE;

type

  { TVCLCompatcontrol }

  TVCLCompatcontrol = class helper for TControl
  public
    procedure SendCancelMode(Sender: TObject);
    function DrawTextBiDiModeFlags(aflags: integer): integer;
  end;

  { TVCLImageList }

  TVCLImageList = class helper for TImageList
  public
    procedure SetSize(AWidth, AHeight: integer);
  end;

  { TVCLControlCanvasHelper }

  TVCLControlCanvasHelper = class helper for TControlCanvas
    procedure UpdateTextFlags;
  end;

  { TVCLPopupMenu }

  TVCLPopupMenu = class helper for TPopupMenu
    procedure SetPopupPoint(const p: TPoint);
  end;

implementation

function ToSmallPoint(w: WParam): TSmallPoint;
begin
  result.X:=w and $FFFF;
  result.Y:=(w shr 4) and $FFFF;
end;

procedure InitializeCriticalSection(var CriticalSection : TRTLCriticalSection);
begin
  System.InitCriticalSection(CriticalSection);
end;

procedure DeleteCriticalSection(var CriticalSection : TRTLCriticalSection);
begin
  System.DoneCriticalsection(CriticalSection);
end;

function CopyPalette(src: HPALETTE): HPALETTE;
begin
  //todo:
  Result := src;
end;

{ TVCLPopupMenu }

procedure TVCLPopupMenu.SetPopupPoint(const p: TPoint);
begin

end;

{ TVCLControlCanvasHelper }

procedure TVCLControlCanvasHelper.UpdateTextFlags;
begin
  //todo:
end;

{ TVCLImageList }

procedure TVCLImageList.SetSize(AWidth, Aheight: integer);
begin
  Width:=AWidth;
  Height:=AHeight;
end;

{ TVCLCompatcontrol }

procedure TVCLCompatcontrol.SendCancelMode(Sender: TObject);
begin
  //todo:
end;

function TVCLCompatcontrol.DrawTextBiDiModeFlags(aflags: integer): integer;
begin
  Result:=aflags;
end;

end.
