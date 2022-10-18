from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor

def findall():
    try:
        db = connect(user='webdb',
                     password='webdb',
                     host='127.0.0.1',
                     port=3306,
                     db='webdb',
                     charset='utf8')

        cursor = db.cursor(DictCursor)

        sql = 'select first_name, last_name, email from emaillist order by no desc'
        count = cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results
    except OperationalError as e:  # OperationalError에서 alt+enter 누르면 나오는 것에서 확인 가능
        print(f'에러: {e}')


def insert(firstname, lastname, email):
    try:
        db = connect(user='webdb',
                     password='webdb',
                     host='127.0.0.1',
                     port=3306,
                     db='webdb',
                     charset='utf8')

        cursor = db.cursor()

        sql = f"insert into emaillist values(null, '{firstname}', '{lastname}', '{email}')"
        count = cursor.execute(sql)

        db.commit()

        cursor.close()
        db.close()

        return count == 1
    except OperationalError as e:  # OperationalError에서 alt+enter 누르면 나오는 것에서 확인 가능
        print(f'에러: {e}')


def deletebyemail():
    print('delete 처리')