{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit tb2_laz_design;

{$warn 5023 off : no warning about unused units}
interface

uses
  TB2RegLaz, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('TB2RegLaz', @TB2RegLaz.Register);
end;

initialization
  RegisterPackage('tb2_ide', @Register);
end.
