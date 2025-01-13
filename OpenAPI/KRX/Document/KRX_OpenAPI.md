# KRX OpenAPI 사용설명서

### 서비스 소개

한국거래소 정보데이터시스템의 OPENAPI 서비스는 한국거래소가 정보데이터시스템을 통해 제공하는 다양한 통계정보를 웹 또는 모바일앱 개발에 활용할 수 있도록 인터페이스를 제공하는 서비스입니다. 본 문서는 KRX 홈페이지에 게시된 정보를 보다 읽기 쉽게 정리하고, 파이썬 및 델파이 예제 코드를 작성하였습니다.

### 서비스 목록

|구분|API명|설명|
|--|--|--|
|지수|[KRX 시리즈 일별시세정보](#krx-시리즈-일별시세정보)|KRX 시리즈 지수의 시세정보 제공|
||KOSPI 시리즈 일별시세정보|KOSPI 시리즈 지수의 시세정보 제공|
||KOSDAQ 시리즈 일별시세정보|KOSDAQ 시리즈 지수의 시세정보 제공|
||KOSDAQ 시리즈 일별시세정보|KOSDAQ 시리즈 지수의 시세정보 제공|
||채권지수 시세정보|채권지수의 시세정보 제공|
||파생상품지수 시세정보|파생상품지수의 시세정보를 제공|
|주식|유가증권 일별매매정보|유가증권시장에 상장되어 있는 주권의 매매정보 제공|
||코스닥 일별매매정보|코스닥시장에 상장되어 있는 주권의 매매정보 제공|
||코넥스 일별매매정보|코넥스시장에 상장되어 있는 주권의 매매정보 제공|
||신주인수권증권 일별매매정보|유가증권/코스닥시장에 상장되어 있는 신주인수권증권의 매매정보 제공|
||신주인수권증서 일별매매정보|유가증권/코스닥시장에 상장되어 있는 신주인수권증서의 매매정보 제공|
||유가증권 종목기본정보|유가증권 종목기본정보|
||코스닥 종목기본정보|코스닥 종목기본정보|
||코넥스 종목기본정보|코넥스 종목기본정보|
|증권상품|ETF 일별매매정보|ETF(상장지수펀드)의 매매정보 제공|
||ETN 일별매매정보|ETN(상장지수증권)의 매매정보 제공|
||ELW 일별매매정보|ELW(주식위런트증권)의 매매정보 제공|
|채권|국채전문유통시장|일별매매정보	국채전문유통시장에 상장되어있는 채권의 매매정보 제공|
||일반채권시장 일별매매정보|일반채권시장에 상장되어있는 채권의 매매정보 제공|
||소액채권시장 일별매매정보|소액채권시장에 상장되어있는 채권의 매매정보 제공|
|파생상품|선물 일별매매정보 (주식선물外)|파생상품시장의 선물 중 주식선물을 제외한 선물의 매매정보 제공|
||주식선물(유가) 일별매매정보|파생상품시장의 주식선물 중 기초자산이 유가증권시장에 속하는 주식선물의 거래정보 제공|
||주식선물(코스닥)일별매매정보|파생상품시장의 주식선물 중 기초자산이 코스닥시장에 속하는 주식선물의 거래정보 제공|
||옵션 일별매매정보 (주식옵션外)|파생상품시장의 옵션 중 주식옵션을 제외한 옵션의 매매정보 제공|
||주식옵션(유가) 일별매매정보|파생상품시장의 주식옵션 중 기초자산이 유가증권시장에 속하는 주식옵션의 거래정보 제공|
||주식옵션(코스닥) 일별매매정보|파생상품시장의 주식옵션 중 기초자산이 코스닥시장에 속하는 주식옵션의 거래정보 제공|
|일반상품|석유시장 일별매매정보|KRX 석유시장의 매매정보 제공|
||금시장 일별매매정보|KRX 금시장 매매정보 제공|
||배출권 시장 일별매매정보|KRX 탄소배출권 시장의 매매정보 제공|
|ESG|사회책임투자채권 정보|사회책임투자채권 정보를 제공 (‘19년 데이터부터 제공)|

## 지수

### KRX 시리즈 일별시세정보
KRX 시리즈 지수의 시세정보를 제공.

#### 입력항목
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

#### 출력항목

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

#### 요청

```python
import requests

url = "http://data-dbg.krx.co.kr/svc/sample/apis/idx/krx_dd_trd?basDd=20250102" 

headers = {
    "auth_key": "74D1B99DFBF345BBA3FB4476510A4BED4C78D13A"  # 테스트용 APU키
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

{APPTYPE CONSOLE}
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
  finally
    LHttpClient.Free;
  end;
end.
```
#### 응답
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
