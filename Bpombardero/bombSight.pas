unit bombSight;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls,Winapi.MMSystem; 

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
  q, n: Integer;
begin
  n := Length(Texto);
  SetLength(Input, n * 2 + 2);
  for q := 0 to n - 1 do
  begin
    Input[q*2].Itype := INPUT_KEYBOARD;
    Input[q*2].ki.wScan := Ord(Texto[i+1]);
    Input[q*2].ki.dwFlags := KEYEVENTF_UNICODE;
    Input[q*2+1].Itype := INPUT_KEYBOARD;
    Input[q*2+1].ki.wScan := Ord(Texto[i+1]);
    Input[q*2+1].ki.dwFlags := KEYEVENTF_UNICODE or KEYEVENTF_KEYUP;
  end;
  q :=n* 2;
  Input[q].Itype := INPUT_KEYBOARD;
  Input[q].ki.wVk := VK_RETURN;
  Input[q+1].Itype := INPUT_KEYBOARD;
  Input[q+1].ki.wVk := VK_RETURN;
  Input[q+1].ki.dwFlags := KEYEVENTF_KEYUP;
  SendInput(Length(Input), Input[0], SizeOf(TInput));
end;

procedure TForm3.EmpezarClick(Sender: TObject);
var
  q, Veces: Integer;
  RutaSonido: string;
begin
  Veces := StrToIntDef(numVeces.Text, 0);
  RutaSonido := ExtractFilePath(ParamStr(0)) + 'gaga.wav';
  if (Veces <= 0) or (mensaje.Text = '') then
  begin
    ShowMessage('faltan datos.');
    Exit;
  end;
  ShowMessage(' 5 seg abrir WhatsApp ');
  Sleep(5000);
  for q:= 1 to Veces do
  begin
    EnviarTextoUnicode(mensaje.Text);
    Sleep(3000);
    Application.ProcessMessages;
  end;
  PlaySound(nil, 0, 0);
  ShowMessage('terminado');
end;

end.
