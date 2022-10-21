from MySQLdb import connect, OperationalError
from MySQLdb.cursors import DictCursor

def insert(name, phone, email, password):
    try:
        db = conn()
        cursor = db.cursor()

        sql = 'insert into member values(null, %s, %s, %s, %s)'
        count = cursor.execute(sql, (name, phone, email, password))

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

        sql = 'select name, phone, email, password from member'
        cursor.execute(sql)

        results = cursor.fetchall()

        cursor.close()
        db.close()

        return results
    except OperationalError as e:
        print(f'에러: {e}')