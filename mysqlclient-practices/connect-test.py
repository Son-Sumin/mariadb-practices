from MySQLdb import connect, OperationalError

try:
    # 연결
    # mysql charset='utf8'이니 주의할 것, 원래는 'utf-8'
    db = connect(user='webdb',
                 password='webdb',
                 host='127.0.0.1',
                 port=3306,
                 db='webdb',
                 charset='utf8')
    print('success')

except OperationalError as e:
    print('error!!!!!!!!!!!!!')

print('end!!!!!')

# cursor 생성
# cursor = db.cursor()