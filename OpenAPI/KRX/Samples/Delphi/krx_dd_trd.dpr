program krx_dd_trd;

uses
  System.SysUtils,
  System.Classes,
  System.Net.HttpClient;

{$APPTYPE CONSOLE}

begin
  var LHttpClient := THttpClient.Create;
  try
    LHttpClient.CustomHeaders['AUTH_KEY'] := '74D1B99DFBF345BBA3FB4476510A4BED4C78D13A';
    var LUrl := 'http://data-dbg.krx.co.kr/svc/sample/apis/idx/krx_dd_trd?basDd=20250102';
    var LResponse := LHttpClient.Get(LUrl);
    if LResponse.StatusCode = 200 then
      WriteLn(LResponse.ContentAsString(TEncoding.UTF8))
    else
      WriteLn(LResponse.StatusText);

    ReadLn;
  finally
    LHttpClient.Free;
  end;
end.
