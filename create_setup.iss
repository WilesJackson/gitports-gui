; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "GitPorts GUI"
#define MyAppVersion "0.0.1-ALPHA"
#define MyAppPublisher "Wiles Jackson, Inc."
#define MyAppURL "http://www.wilesjackson.com"
#define MyAppExeName "GitPorts-gui.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{CD3AF6B3-463E-4908-92F7-398EF315FA4D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=gp-gui-install
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\JoeyHops\workspace\gp-gui\dist\GitPorts-gui.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\win\gitports-v0.1.1-x64.exe"; DestDir: "{app}"; AfterInstall: RunOtherInstaller
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Code]
procedure RunOtherInstaller;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{app}\gitports-v0.1.1-x64.exe'), '', '', SW_SHOWNORMAL, ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('GitPorts CLI Installer Failed to Run' + #13#10 + SysErrorMessage(ResultCode), mbError, MB_OK);
end;

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

