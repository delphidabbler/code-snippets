program TestDriveCatXE;

uses
  Forms,
  FmDriveCatDemo in 'FmDriveCatDemo.pas' {DriveCatDemoForm},
  UDriveCatSnippets in 'UDriveCatSnippets.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF CONDITIONALEXPRESSIONS}
  {$IF CompilerVersion >= 18.5} // Delphi 2007 and later
  Application.MainFormOnTaskbar := True;
  {$IFEND}
  {$ENDIF}
  Application.CreateForm(TDriveCatDemoForm, DriveCatDemoForm);
  Application.Run;
end.
