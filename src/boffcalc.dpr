program boffcalc;

uses
  Forms,
  main in 'main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Dreamcast Binary Address Calculator';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
