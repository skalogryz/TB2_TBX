unit TB2RegLaz;

{
  Toolbar2000
  Copyright (C) 1998-2008 by Jordan Russell
  All rights reserved.

  The contents of this file are subject to the "Toolbar2000 License"; you may
  not use or distribute this file except in compliance with the
  "Toolbar2000 License". A copy of the "Toolbar2000 License" may be found in
  TB2k-LICENSE.txt or at:
    http://www.jrsoftware.org/files/tb2k/TB2k-LICENSE.txt

  Alternatively, the contents of this file may be used under the terms of the
  GNU General Public License (the "GPL"), in which case the provisions of the
  GPL are applicable instead of those in the "Toolbar2000 License". A copy of
  the GPL may be found in GPL-LICENSE.txt or at:
    http://www.jrsoftware.org/files/tb2k/GPL-LICENSE.txt
  If you wish to allow use of your version of this file only under the terms of
  the GPL and not to allow others to use your version of this file under the
  "Toolbar2000 License", indicate your decision by deleting the provisions
  above and replace them with the notice and other provisions required by the
  GPL. If you do not delete the provisions above, a recipient may use your
  version of this file under either the "Toolbar2000 License" or the GPL.

  $jrsoftware: tb2k/Source/TB2Reg.pas,v 1.32 2008/09/18 19:08:40 jr Exp $
}
{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
  Classes, TB2Dock, TB2Toolbar, TB2ToolWindow, TB2Item
  {$ifdef mswindows}
  ,TB2MRU, TB2MDI
  {$endif}
  ;

{$I TB2Ver.inc}

procedure Register;

implementation

{$R TB2DsgnItemEditor.res}

procedure Register;
begin
  RegisterComponents('Toolbar2000', [TTBDock, TTBToolbar, TTBToolWindow,
    TTBPopupMenu, TTBImageList, TTBItemContainer, TTBBackground]);
  {$ifdef mswindows}
  RegisterComponents('Toolbar2000', [TTBMRUList, TTBMDIHandler]);
  {$endif}
end;

end.
