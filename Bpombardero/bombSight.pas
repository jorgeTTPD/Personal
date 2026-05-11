unit bombSight;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Winapi.MMSystem; // <--- Necesaria para PlaySound

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mensaje: TEdit;
    numVeces: TEdit;
    Empezar: TButton;
    Image2: TImage;
    CERAAR: TButton;
    procedure EmpezarClick(Sender: TObject);
  private
    procedure EnviarTextoUnicode(Texto: string);
  public
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.EnviarTextoUnicode(Texto: string);
var
  Input: array of TInput;
  i, n: Integer;
begin
  n := Length(Texto);
  SetLength(Input, n * 2 + 2);
  for i := 0 to n - 1 do
  begin
    Input[i*2].Itype := INPUT_KEYBOARD;
    Input[i*2].ki.wScan := Ord(Texto[i+1]);
    Input[i*2].ki.dwFlags := KEYEVENTF_UNICODE;
    Input[i*2+1].Itype := INPUT_KEYBOARD;
    Input[i*2+1].ki.wScan := Ord(Texto[i+1]);
    Input[i*2+1].ki.dwFlags := KEYEVENTF_UNICODE or KEYEVENTF_KEYUP;
  end;
  i := n * 2;
  Input[i].Itype := INPUT_KEYBOARD;
  Input[i].ki.wVk := VK_RETURN;
  Input[i+1].Itype := INPUT_KEYBOARD;
  Input[i+1].ki.wVk := VK_RETURN;
  Input[i+1].ki.dwFlags := KEYEVENTF_KEYUP;
  SendInput(Length(Input), Input[0], SizeOf(TInput));
end;

procedure TForm3.EmpezarClick(Sender: TObject);
var
  i, Veces: Integer;
  RutaSonido: string;
begin
  Veces := StrToIntDef(numVeces.Text, 0);


  RutaSonido := ExtractFilePath(ParamStr(0)) + 'gaga.wav';

  if (Veces <= 0) or (mensaje.Text = '') then
  begin
    ShowMessage('faltan datos.');
    Exit;
  end;

  ShowMessage(' 5 seg abrir WhatsApp en el navegador');
  Sleep(5000);


  if FileExists(RutaSonido) then
    PlaySound(PChar(RutaSonido), 0, SND_FILENAME or SND_ASYNC)
  else

    Caption := 'No se encontró gaga.wav en: ' + ExtractFilePath(ParamStr(0));


  for i := 1 to Veces do
  begin
    EnviarTextoUnicode(mensaje.Text);
    Sleep(3000);
    Application.ProcessMessages;
  end;


  PlaySound(nil, 0, 0);
  ShowMessage('terminado');
end;

end.
