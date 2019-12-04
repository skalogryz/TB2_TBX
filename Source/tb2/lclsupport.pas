unit lclsupport;

interface

uses
  Classes, SysUtils, Graphics, LCLType, Controls;

procedure InitializeCriticalSection(var CriticalSection : TRTLCriticalSection);
procedure DeleteCriticalSection(var CriticalSection : TRTLCriticalSection);

function ToSmallPoint(w: WParam): TSmallPoint;
function CopyPalette(src: HPALETTE): HPALETTE;

type

  { TVCLCompatcontrol }

  TVCLCompatcontrol = class helper for TControl
  public
    procedure SendCancelMode(Sender: TObject);
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

{ TVCLCompatcontrol }

procedure TVCLCompatcontrol.SendCancelMode(Sender: TObject);
begin
  //todo:
end;

end.
