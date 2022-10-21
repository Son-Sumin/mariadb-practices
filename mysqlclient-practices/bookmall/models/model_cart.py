from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor
def insert(member_no, book_no, amount):
    try:
        db = conn()
        cursor = db.cursor()

        sql = 'insert into cart values(null, %s, %s, %s)'
        count = cursor.execute(sql, (member_no, book_no, amount))

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

        sql = 'select b.title, a.amount, b. price from cart a, book b where b.no = a.book_no'
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results
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