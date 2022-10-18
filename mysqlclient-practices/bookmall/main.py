from models import model_member

def run_list():
    results = model_member.findall()
    for index, result in enumerate(results):
        print(f'{index + 1}: {result["name"]} {result["phone"]} {result["email"]} {result["password"]}')

def run_add():
    name = input('name: ')
    phone = input('phone: ')
    email = input('email: ')
    password = input('password: ')
    # if firstname == '':
    #     print(f'입력 필수 항목입니다')

    model_member.insert(name, phone, email, password)

    print('--------------------')
    run_list()


def run_delete():
    email = input('name: ')
    model_member.deletebyname(name)
    run_list()


def bookmall():
    while True:
        cmd = input('###BOOKMALL### \n (1)회원, (2)카테고리, (3)상품, (4)카트 , (5)주문, (6) 주문도서> ')

        if cmd == '1':
            print("--회원 리스트--")
            cmd1 = input('(l)ist, (a)dd, (d)elete, (q)uit > ')
            if cmd == 'q':
                break
            elif cmd == 'l':
                run_list()
            elif cmd == 'a':
                run_add()
            elif cmd == 'd':
                run_delete()
            else:
                print('알 수 없는 명령입니다.')
        elif cmd == 'l':
            run_list()
        elif cmd == 'a':
            run_add()
        elif cmd == 'd':
            run_delete()
        else:
            print('알 수 없는 명령입니다.')

if __name__ == '__main__':
    bookmall()


# print("--회원 리스트--")
# model_member.insert()
# model_member.insert()
# results = model_member.findall()
# for result in results:
#     print(result)
#
#
# print("--카테고리 리스트--")
#
# print("--상품 리스트--")
#
# print("--카트 리스트--")
#
# print("--주문 리스트--")
#
# print("--주문도서 리스트--")