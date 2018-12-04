unit TCopyableData;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.Layouts , FMX.Edit , FMX.StdCtrls, FMX.Clipboard,  FMX.Platform , FMX.Objects;

type
  TCopyableEdit = class(TEdit)
  private
    { Private declarations }
    procedure copy(Sender : TObject);
  protected
    { Protected declarations }
  public
    { Public declarations }
    button : TButton;
    image : Timage;



    constructor Create(AOwner: TComponent); override;
  published
  end;

procedure Register;

implementation

uses misc , languages;

procedure Register;
begin
  RegisterComponents('Samples', [TCopyableEdit]);
end;
procedure TCopyableEdit.copy(Sender : TObject);
var
  svc: IFMXExtendedClipboardService;
begin

  if TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, svc)
  then
  begin

      svc.setClipboard( Self.Text );
      popupWindow.Create(Self.Text +
        ' ' + dictionary('CopiedToClipboard'));

  end;

end;

constructor TCopyableEdit.Create(AOwner: TComponent);
begin
  Inherited;

  button := TButton.Create( self );
  button.Parent := self;
  button.Visible := true;
  Button.Text := 'CP'; // change to Image
  Button.Align := TAlignLayout.MostRight;
  Button.Width := 32;
  Button.OnClick := copy;
  self.Padding.Right := -Button.Width;

end;

end.
