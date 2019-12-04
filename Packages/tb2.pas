{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit tb2;

{$warn 5023 off : no warning about unused units}
interface

uses
  lclsupport, TB2Acc, TB2Anim, TB2Common, TB2Consts, TB2Dock, TB2ExtItems, 
  TB2Hook, TB2Item, TB2OleMarshal, TB2Toolbar, TB2ToolWindow, TB2Types, 
  TB2Version, TB2LCLWinCompat, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('tb2', @Register);
end.
