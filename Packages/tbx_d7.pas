{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit tbx_d7;

{$warn 5023 off : no warning about unused units}
interface

uses
  TBX, TBXColorConsts, TBXConsts, TBXDkPanels, TBXExtItems, TBXLists, TBXMDI, 
  TBXStatusBars, TBXStrEdit, TBXSwitcher, TBXThemes, TBXToolPals, TBXUtils, 
  TBXUxThemes, TBXReg_comp, TBXPanel, TB2Acc, TB2Anim, TB2Common, TB2Consts, 
  TB2Delphi, TB2Dock, TB2ExtItems, TB2Hook, TB2Item, TB2MDI, TB2MRU, 
  TB2OleMarshal, TB2Reg_Comp, TB2Toolbar, TB2ToolWindow, TB2Types, 
  TBXAluminumTheme, TBXDefaultTheme, TBXOfficeXPTheme, lclsupport, 
  TBXLCLWinCompat, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('TBXReg_comp', @TBXReg_comp.Register);
  RegisterUnit('TB2Reg_Comp', @TB2Reg_Comp.Register);
end;

initialization
  RegisterPackage('tbx_d7', @Register);
end.
