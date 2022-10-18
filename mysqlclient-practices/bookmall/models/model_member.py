from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor


def insert(name, phone, email, password):
    print('member 가져오기')
    try:
        db = conn()
        cursor = db.cursor()

        sql = 'insert into member values(null, %s, %d, %s, %s)'
        count = cursor.execute(sql, (name, phone, email, password))

        db.commit()
        cursor.close()
        db.close()

        print(f"실행결과: {'성공' if count == 1 else '실패'}")
    except OperationalError as e:
        print(f'에러: {e}')

def findall():
    print("member list 가져오기")
    try:
        db = conn()
        cursor = db.cursor(DictCursor)

        sql = 'select name, phone, email, password from member order by no desc'
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results
    except OperationalError as e:
        print(f'에러: {e}')


def deletebyname(name):
    try:
        db = conn()
        cursor = db.cursor()

        sql = 'delete from member where name = %s'
        count = cursor.execute(sql, (name,))

        db.commit()
        cursor.close()
        db.close()

        return count == 1
    except OperationalError as e:
        print(f'에러: {e}')


def conn():
    db = connect(user='bookmall',
                 password='bookmall',
                 host='127.0.0.1',
                 port=3306,
                 db='bookmall',
                 charset='utf8')
    return db