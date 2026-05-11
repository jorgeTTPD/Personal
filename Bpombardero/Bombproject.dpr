program Bombproject;

{$R *.dres}

uses
  Vcl.Forms,
  bombSight in 'bombSight.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
