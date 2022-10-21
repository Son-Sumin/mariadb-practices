from MySQLdb import connect
from MySQLdb._exceptions import OperationalError
from MySQLdb.cursors import DictCursor


def insert(category_no, title, price):
    try:
        db = conn()

        cursor = db.cursor()

        sql = 'insert into book values(null, %s, %s, %s)'
        count = cursor.execute(sql,(category_no, title, price))

        db.commit()
        cursor.close()
        db.close()

        return count == 1
    except OperationalError as e:
        print(f'에러: {e}')


def findall():
    try:
        db = conn()

        cursor = db.cursor(DictCursor)

        sql = 'select b.category, a.title, a.price from book a, category b where a.category_no = b.no'
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results
    except OperationalError as e:
        print(f'에러: {e}')


def deletebytitle(title):
    try:
        db = conn()

        cursor = db.cursor()

        sql = 'delete from book where title = %s'
        count = cursor.execute(sql,(title,))

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

