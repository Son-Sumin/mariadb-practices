from MySQLdb import connect, OperationalError

try:
    # 1. 연결
    # mysql charset='utf8'이니 주의할 것, 원래는 'utf-8'
    db = connect(user='webdb',
                 password='webdb',
                 host='127.0.0.1',
                 port=3306,
                 db='webdb',
                 charset='utf8')

    # 2. cursor 생성
    cursor = db.cursor()

    # 3. sql(delete문) 실행
    sql = 'delete from pet where name = "복진이"'
    count = cursor.execute(sql)

    # 4. commit
    db.commit()

    # 5. 자원 정리
    cursor.close()
    db.close()

    # 결과 확인
    print(f'실행결과: {"성공" if count >=1 else "실패"}')

#에러 처리
except OperationalError as e:     # OperationalError에서 alt+enter 누르면 나오는 것에서 확인 가능
    print(f'에러: {e}')