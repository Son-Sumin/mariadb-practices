from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor


def insert(orders_number, member_name_email, payment, delivery_address):
    try:
        db = conn()
        cursor = db.cursor()

        sql = 'insert into member values(null, %s, null, %s, %s, %s, null)'
        count = cursor.execute(sql, (orders_number, member_name_email, payment, delivery_address))

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

        sql = 'select orders_number, member_name_email, payment, delivery_address from orders order by no desc'
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results
    except OperationalError as e:
        print(f'에러: {e}')


def deletebyorders_num(orders_number):
    try:
        db = conn()
        cursor = db.cursor()

        sql = 'delete from orders where orders_number = %s'
        count = cursor.execute(sql, (orders_number,))

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