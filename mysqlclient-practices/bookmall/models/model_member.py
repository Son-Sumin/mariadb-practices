from MySQLdb import connect, OperationalError
def insert(name, phone, email, password):
    print('member 추가')

    try:
        db = connect(user='bookmall',
                     password='bookmall',
                     host='127.0.0.1',
                     port=3306,
                     db='bookmall',
                     charset='utf8')

        cursor = db.cursor()

        sql = 'insert into member values("복진이", "손수민", "dog", "m", "2022-07-05", null)'
        count = cursor.execute(sql)

        db.commit()

        cursor.close()
        db.close()

        print(f"실행결과: {'성공' if count == 1 else '실패'}")

    except OperationalError as e:
        print(f'에러: {e}')


def findall():
    print('memberlist 가져오기')