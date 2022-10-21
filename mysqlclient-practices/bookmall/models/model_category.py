from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor


def insert(category):
    try:
        db = conn()
        cursor = db.cursor()

        sql = 'insert into category values(null, %s)'
        count = cursor.execute(sql, (category,))

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

        sql = 'select category from category order by no'
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results
    except OperationalError as e:
        print(f'에러: {e}')


def deletebycategory(category):
    try:
        db = conn()
        cursor = db.cursor()

        sql = 'delete from category where category = %s'
        count = cursor.execute(sql, (category,))

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