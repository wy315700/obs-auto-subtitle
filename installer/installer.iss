; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "obs-auto-subtitle"
#define MyAppVersion "0.1.0"
#define MyAppPublisher "Yibai Zhang"
#define MyAppURL "http://github.com/summershrimp/obs-auto-subtitle"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={1E6609F4-E1F7-470D-9756-B3FAED45031D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={code:GetDirName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=..\LICENSE
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename=obs-auto-subtitle-Windows-Installer
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "..\release\bin\*"; DestDir: "{app}\bin"; Flags: ignoreversion recursesubdirs createallsubdirs onlyifdoesntexist uninsneveruninstall
Source: "..\release\data\*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\release\obs-plugins\*"; DestDir: "{app}\obs-plugins"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[code]

// credit where it's due :
// following function comes from https://github.com/Xaymar/obs-studio_amf-encoder-plugin/blob/master/%23Resources/Installer.in.iss#L45
function GetDirName(Value: string): string;
var
  InstallPath: string;
begin
  // initialize default path, which will be returned when the following registry
  // key queries fail due to missing keys or for some different reason
  Result := '{autopf}\obs-studio';
  // query the first registry value; if this succeeds, return the obtained value
  if RegQueryStringValue(HKLM32, 'SOFTWARE\OBS Studio', '', InstallPath) then
    Result := InstallPath
end;
