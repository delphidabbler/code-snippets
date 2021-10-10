program TestWinSysCatXE;

uses
  Forms,
  FmWinSysCatDemo in 'FmWinSysCatDemo.pas' {WinSysCatDemoForm},
  UWinSysCatSnippets in 'UWinSysCatSnippets.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.HintHidePause := 10000;
  {$IFDEF CONDITIONALEXPRESSIONS}
  {$IF CompilerVersion >= 18.5} // Delphi 2007 and later
  Application.MainFormOnTaskbar := True;
  {$IFEND}
  {$ENDIF}
  Application.CreateForm(TWinSysCatDemoForm, WinSysCatDemoForm);
  Application.Run;
end.
