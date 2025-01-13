import requests

url = "http://data-dbg.krx.co.kr/svc/sample/apis/idx/krx_dd_trd?basDd=20250102" 

headers = {
    "auth_key": "74D1B99DFBF345BBA3FB4476510A4BED4C78D13A"  # 테스트용 APU키
}

response = requests.get(url, headers=headers)

# 응답 상태 코드 확인
if response.status_code == 200:
    # 성공적으로 응답을 받았을 경우. JSON 으로 파싱합니다.
    data = response.json()  
    print(data)
else:
    # 오류 발생 시
    print(f"Error: {response.status_code}")