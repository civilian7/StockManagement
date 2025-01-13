# KRX 시리즈 일별시세정보
KRX 시리즈 지수의 시세정보를 제공.

## 입력항목
<table>
<tr>
  <th width=60px>번호</th>
  <th width=150px>항목명</th>
  <th width=150px>입력값</th>
  <th width=400px>비고</th>
</tr>
<tr>
  <td align=center>1</td>
  <td>basDd</td>
  <td>조회일자</td>
  <td>YYYYMMDD  ex) 20250102</td>
</tr>
</table>

## 출력항목

|번호|항목명|출력명|Data Type|비고|
|--|--|--|--|--|
|1|기준일자|BAS_DD|string()||
|2|계열구분|IDX_CLSS|string()||
|3|지수명|IDX_NM|string()||
|4|종가|CLSPRC_IDX|string()||
|5|대비|CMPPREVDD_IDX|string()||
|6|등락률|FLUC_RT|string()||
|7|시가|OPNPRC_IDX|string()||
|8|고가|HGPRC_IDX|string()||
|9|저가|LWPRC_IDX|string()||
|10|거래량|ACC_TRDVOL|string()||
|11|거래대금|ACC_TRDVAL|string()||
|12|상장시가총액|MKTCAP|string()||

## 요청

```python
import requests

url = "http://data-dbg.krx.co.kr/svc/sample/apis/idx/krx_dd_trd?basDd=20250102" 

headers = {
    "auth_key": "74D1B99DFBF345BBA3FB4476510A4BED4C78D13A"  # 테스트용 API키
}

response = requests.get(url, headers=headers)

# 응답 상태 코드 확인
if response.status_code == 200:
    # 성공적으로 응답을 받았을 경우
    data = response.json()  # JSON 응답을 파싱합니다.
    print(data)
else:
    # 오류 발생 시
    print(f"Error: {response.status_code}")
```

```pascal
program krx_dd_trd;

uses
  System.SysUtils,
  System.Classes,
  System.Net.HttpClient;

{$APPTYPE CONSOLE}

begin
  var LHttpClient := THttpClient.Create;
  try
    // API 키를 헤더에 넣는다
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
```

## 응답
```JSON
{
    "OutBlock_1": [{
        "BAS_DD": "20200414",
        "IDX_CLSS": "KRX",
        "IDX_NM": "KRX 300",
        "CLSPRC_IDX": "1137.98",
        "CMPPREVDD_IDX": "19.34",
        "FLUC_RT": "1.73",
        "OPNPRC_IDX": "1131.89",
        "HGPRC_IDX": "1142.77",
        "LWPRC_IDX": "1124.74",
        "ACC_TRDVOL": "337526678",
        "ACC_TRDVAL": "9398617470879",
        "MKTCAP": "1184884176524815"
    }, {
        "BAS_DD": "20200414",
        "IDX_CLSS": "KRX",
        "IDX_NM": "KRX 100",
        "CLSPRC_IDX": "3995.35",
        "CMPPREVDD_IDX": "65.86",
        "FLUC_RT": "1.68",
        "OPNPRC_IDX": "3976.80",
        "HGPRC_IDX": "4013.17",
        "LWPRC_IDX": "3950.53",
        "ACC_TRDVOL": "71367374",
        "ACC_TRDVAL": "3778785066889",
        "MKTCAP": "942869008383975"
    }]
}
```
