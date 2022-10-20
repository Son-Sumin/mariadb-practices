from MySQLdb import connect, OperationalError
# 해당 글자에서 alt + enter

try:
    # 연결
    # mysql charset='utf8'이니 주의할 것, 원래는 'utf-8'
    db = connect(user='webdb',
                 password='webdb',
                 host='127.0.0.1',
                 port=3306,
                 db='webdb',
                 charset='utf8')
    print('연결 성공')

#에러 처리
except OperationalError as e:
    print(f'에러: {e}')


# OperationalError에서 alt+enter 누르면 나오는 것에서 확인 가능