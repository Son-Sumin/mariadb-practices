# name = input('name?')
# message = f'안녕하세요 {name}님'
# print(message)

# 제어문; 조건문(if), 반복문(for)
import model

def run_list():
    results = model.findall()
    for index, result in enumerate(results):
        print(f'{index + 1}: {result["first_name"]} {result["last_name"]}:{result["email"]}')

def run_add():
    firstname = input('first name: ')
    lastname = input('last name: ')
    email = input('email: ')
    # if firstname == '':
    #     print(f'입력 필수 항목입니다')

    model.insert(firstname, lastname, email)

    print('--------------------')
    run_list()


def run_delete():
    email = input('email: ')
    model.deletebyemail(email)
    run_list()


def main():
    while True:
        cmd = input('(l)ist, (a)dd, (d)elete, (q)uit > ')

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

if __name__ == '__main__':
    main()



# app.py ; controller, view
# model.py ; model
# model이 emaillist라는 DB에서 CRUD하도록 app이 control하여 결과를 보여줌