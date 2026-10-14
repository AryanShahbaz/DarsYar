#define MyAppName "DarsYar"
#define MyAppVersion "1.23.8"
#define MyAppPublisher "Aryan Shahbaz"
#define MyAppExeName "DarsYar.exe"
#define MyAppId "{{A71B80F0-DA7B-4F11-8A1A-DA7D9B1E2026}"

; Compile this script from the project root (the folder containing assets and dist).
#ifnexist "assets\DarsYar.ico"
  #error "Logo icon not found: assets\DarsYar.ico. Add a valid Windows .ico file first."
#endif
#ifnexist "dist\DarsYar\DarsYar.exe"
  #error "DarsYar.exe was not found in dist\DarsYar. Build and test the app first."
#endif

[Setup]
AppId={#MyAppId}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppVerName={#MyAppName} {#MyAppVersion}
UninstallDisplayName={#MyAppName}
UninstallDisplayIcon={app}\{#MyAppExeName}
SetupIconFile=assets\DarsYar.ico
DefaultDirName={localappdata}\Programs\DarsYar
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
OutputDir=installer-output
OutputBaseFilename=DarsYar-Setup-{#MyAppVersion}
SetupLogging=yes
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
CloseApplications=yes
RestartApplications=no
Uninstallable=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create desktop shortcut"; GroupDescription: "Shorcuts :"; Flags: unchecked

[Dirs]
; This creates the folder only. The app itself must use this path for its database.
Name: "{localappdata}\DarsYar\data"; Flags: uninsneveruninstall

[Files]
; Include the entire PyInstaller onedir output (including _internal, DLLs, and data files).
Source: "dist\DarsYar\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\DarsYar"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"
Name: "{autodesktop}\DarsYar"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Run DarsYar"; WorkingDir: "{app}"; Flags: postinstall nowait skipifsilent
