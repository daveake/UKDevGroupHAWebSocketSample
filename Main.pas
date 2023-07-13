unit Main;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.StdCtrls, WEBLib.StdCtrls,
  Vcl.Controls, WEBLib.ExtCtrls, WEBLib.WebSocketClient, WEBLib.ComCtrls,
  WEBLib.JSON, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWidgetGauge;

type
  TForm1 = class(TWebForm)
    WebSocketClient1: TWebSocketClient;
    WebPanel1: TWebPanel;
    WebButton1: TWebButton;
    WebButton2: TWebButton;
    WebButton3: TWebButton;
    WebPageControl1: TWebPageControl;
    WebPageControl1Sheet1: TWebTabSheet;
    WebPageControl1Sheet2: TWebTabSheet;
    WebMemo1: TWebMemo;
    WebMemo2: TWebMemo;
    WebPageControl1Sheet3: TWebTabSheet;
    WebMemo3: TWebMemo;
    WebButton4: TWebButton;
    WebPageControl1Sheet4: TWebTabSheet;
    TMSFNCWidgetGauge1: TTMSFNCWidgetGauge;
    TMSFNCWidgetGauge2: TTMSFNCWidgetGauge;
    procedure WebButton1Click(Sender: TObject);
    procedure WebSocketClient1Connect(Sender: TObject);
    procedure WebSocketClient1Disconnect(Sender: TObject);
//    procedure WebSocketClient1DataReceived(Sender: TObject; Origin: string;
//      SocketData: TJSObjectRecord);
    procedure WebButton2Click(Sender: TObject);
    procedure WebButton3Click(Sender: TObject);
    procedure WebSocketClient1DataReceived(Sender: TObject; Origin: string;
      SocketData: TJSObjectRecord);
    procedure WebButton4Click(Sender: TObject);
  private
    { Private declarations }
    Indentifier: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.WebButton1Click(Sender: TObject);
begin
    WebSocketClient1.HostName := '192.168.1.22';
    WebSocketClient1.Port := 8123;
    WebSocketClient1.PathName := '/api/websocket';
    WebSocketClient1.Connect;
end;

procedure TForm1.WebButton2Click(Sender: TObject);
begin
    Inc(Indentifier);
    WebSocketClient1.Send('{"id":'+IntToStr(Indentifier)+',"type": "get_config"}');
end;

procedure TForm1.WebButton3Click(Sender: TObject);
begin
    Inc(Indentifier);
    WebSocketClient1.Send('{"id":'+IntToStr(Indentifier)+',"type": "get_states"}');
end;

procedure TForm1.WebButton4Click(Sender: TObject);
begin
    Inc(Indentifier);
    WebSocketClient1.Send('{"id":'+IntToStr(Indentifier)+',"type": "subscribe_events", "event_type":"state_changed"}');
end;

procedure TForm1.WebSocketClient1Connect(Sender: TObject);
begin
    WebMemo1.Lines.Add('Web Socket Connected');
end;




procedure TForm1.WebSocketClient1DataReceived(Sender: TObject;
  Origin: string; SocketData: TJSObjectRecord);
var
    ResponseType: String;
    i: Integer;
    JA: TJSONArray;
    JS: TJSON;
    JO: TJSONObject;
begin
    JS := TJSON.Create;

    JO := TJSONObject(JS.Parse(SocketData.jsobject.toString));

    ResponseType := JO.GetJSONValue('type');

//    asm
//        var hadata = JSON.parse(SocketData.jsobject);
//        ResponseType = hadata.type;
//        Response = hadata.result;
//        console.log(hadata);
//    end;

    if ResponseType = 'auth_required' then begin
        WebMemo1.Lines.Add('Authenticating ...');
        WebSocketClient1.Send('{"type": "auth","access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI0YmI2OGM5YTNiMzM0ZDk2OGM4NDZiMjVhNjdlZjkxMSIsImlhdCI6MTYxMzA2MDQwNywiZXhwIjoxOTI4NDIwNDA3fQ.mB20qFoSjwLPul2O04_wundkrmJcrZVCgpZefgd4PYY"}');
    end else if ResponseType = 'auth_ok' then begin
        WebMemo1.Lines.Add('Authenticated!');
    end else if ResponseType = 'auth_invalid' then begin
        WebMemo1.Lines.Add('Failed to authenticate');
    end else if ResponseType = 'result' then begin
        WebMemo1.Lines.Add('Got a result');
        WebMemo2.Text := SocketData.jsobject.toString;

        if not IsNull(JO.GetValue('result')) then begin
            JA := TJSONArray(JO);

            WebMemo3.Lines.Add('There are ' + IntToStr(JA.Count) + ' items in the array');

            JA := TJSONArray(JO.GetValue('result'));

            WebMemo3.Lines.Add('There are ' + IntToStr(JA.Count) + ' items in the array');
            for i := 0 to JA.Count - 1 do begin
                JO := TJSONObject(JA.Items[i]);
                WebMemo3.Lines.Add(IntToStr(i));
                WebMemo3.Lines.Add(JO.ToString);
             end;        end;
    end else if ResponseType = 'event' then begin
        WebMemo1.Lines.Add('Got an event');

        if not IsNull(JO.GetValue('event')) then begin
            JO := TJSONObject(JO.GetValue('event'));
            if not IsNull(JO.GetValue('data')) then begin
                JO := TJSONObject(JO.GetValue('data'));
                if not IsNull(JO.GetValue('new_state')) then begin
                    JO := TJSONObject(JO.GetValue('new_state'));
                    if not IsNull(JO.GetValue('entity_id')) then begin
                        if JO.GetJSONValue('entity_id') = 'sensor.tasmota3_energy_power' then begin
                            WebMemo2.Text := SocketData.jsobject.toString;
                            WebMemo3.Lines.Add('Current PC power = ' + JO.GetJSONValue('state') + 'W');
                            TMSFNCWidgetGauge1.Value := StrToFloat(JO.GetJSONValue('state'))
                        end else if JO.GetJSONValue('entity_id') = 'sensor.tasmota1_energy_power' then begin
                            WebMemo3.Lines.Add('Current UPS power = ' + JO.GetJSONValue('state') + 'W');
                            TMSFNCWidgetGauge2.Value := StrToFloat(JO.GetJSONValue('state'))
                        end;
                    end;
                end;
            end;
//            JA := TJSONArray(JO);
//
//            WebMemo3.Lines.Add('There are ' + IntToStr(JA.Count) + ' items in the array');
//
//            JA := TJSONArray(JO.GetValue('result'));
//
//            WebMemo3.Lines.Add('There are ' + IntToStr(JA.Count) + ' items in the array');
//            for i := 0 to JA.Count - 1 do begin
//                JO := TJSONObject(JA.Items[i]);
//                WebMemo3.Lines.Add(IntToStr(i));
//                WebMemo3.Lines.Add(JO.ToString);
//             end;        end;
    end else begin
        WebMemo1.Lines.Add('ResponseType = ' + ResponseType);
    end;
end;

procedure TForm1.WebSocketClient1Disconnect(Sender: TObject);
begin
    WebMemo1.Lines.Add('Web Socket Disconnected');
end;

(*
{"id": 1, "type": "event", "event": {"event_type": "state_changed", "data": {"entity_id": "sensor.house_total_energy", "old_state": {"entity_id": "sensor.house_total_energy", "state": "427.212", "attributes": {"state_class": "total_increasing", "unit_of_measurement": "kWh", "friendly_name": "House - Total Energy", "icon": "mdi:circle-slice-3", "device_class": "energy"}, "last_changed": "2023-07-12T14:41:27.823370+00:00", "last_updated": "2023-07-12T14:41:27.823370+00:00", "context": {"id": "4a9b7dde239816b59d62607b98e8fa42", "parent_id": null, "user_id": null}}, "new_state": {"entity_id": "sensor.house_total_energy", "state": "427.213", "attributes": {"state_class": "total_increasing", "unit_of_measurement": "kWh", "friendly_name": "House - Total Energy", "icon": "mdi:circle-slice-3", "device_class": "energy"}, "last_changed": "2023-07-12T14:41:33.868919+00:00", "last_updated": "2023-07-12T14:41:33.868919+00:00", "context": {"id": "675ce33cc8779e91874f8e0d3a7deda9", "parent_id": null, "user_id": null}}}, "o
rigin": "LOCAL", "time_fired": "2023-07-12T14:41:33.868919+00:00", "context": {"id": "675ce33cc8779e91874f8e0d3a7deda9", "parent_id": null, "user_id": null}}}
*)

end.