# name = input('name?')
# message = f'안녕하세요 {name}님'
# print(message)

# 제어문; 조건문(if), 반복문(for)

while True:
    cmd = input('(l)ist, (a)dd, (d)elete, (q)uit > ')

    if cmd == 'q':
        break
    elif cmd == 'l':
        print('list 처리')
    elif cmd == 'a':
        print('add 처리')
    elif cmd == 'd':
        print('delete 처리')
    else:
        print('알 수 없는 명령입니다.')

print(cmd)
