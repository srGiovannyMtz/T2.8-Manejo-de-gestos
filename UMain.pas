unit UMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.Objects, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation,
  FMX.Gestures, FMX.Edit;

type
  TfrmMain = class(TForm)
    GestureManager1: TGestureManager;
    pnlMain: TPanel;
    memLog: TMemo;
    Circle1: TCircle;
    ImageControl1: TImage;
    Button1: TButton;
    Panel1: TPanel;
    EditMin: TEdit;
    EditMax: TEdit;
    Label1: TLabel;
    procedure pnlMainGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  cont: Integer = 0;

implementation

{$R *.fmx}



procedure TfrmMain.Button1Click(Sender: TObject);
begin
memLog.Lines.Clear;
end;

procedure TfrmMain.pnlMainGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
  var
  S : String;
begin

if GestureToIdent(EventInfo.GestureID, S)then  Handled := True;
memLog.Lines.Add(Format('GestureID=%d,<%s>', [EventInfo.GestureID, S])) ;

  case EventInfo.GestureID of

    1: // 1 es el id del gesto de sgiLeft
      cont := cont - 1; // decrementamos el contador

    2: // 2 es el id del gesto de sgiRight
      cont := cont + 1; // incrementamos el contador

    33: // 33 es el id del gesto de sgiChevronLeft

      if EditMin.Text = '' then

      // en dado caso que el usuario no asigne un valor en el edit text se agregara el valor 0
      begin
        cont := 0;
      end
      else
        // asignamos el valor del EditMin
        cont := StrToInt(EditMin.Text);

    34: // 34 es el id del gesto de sgiChevronRight
      if EditMax.Text = '' then

      // en dado caso que el usuario no asigne un valor en el edit text se agregara el valor 0
      begin
        cont := 0;
      end
      else
        // asignamos el valor del EditMin
        cont := StrToInt(EditMax.Text);

  end;

  Label1.Text := Integer.ToString(cont);

end;

end.
