from models import model_member
from models import model_category
from models import model_book
# from models import model_member
# from models import model_member
# from models import model_member

def member_list():
    results = model_member.findall()
    for index, result in enumerate(results):
        print(f'{index + 1}: {result["name"]} / {result["phone"]} / {result["email"]} / {result["password"]}')

def member_add():
    name = input('name: ')
    phone = input('phone: ')
    email = input('email: ')
    password = input('password: ')
    model_member.insert(name, phone, email, password)

    print('--------------------')
    member_list()

def member_delete():
    name = input('name: ')
    model_member.deletebyname(name)
    member_list()

def category_list():
    results = model_category.findall()
    for index, result in enumerate(results):
        print(f'{index + 1}: {result["category"]}')

def category_add():
    category = input('category: ')
    model_category.insert(category)

    print('--------------------')
    category_list()

def category_delete():
    category = input('category: ')
    model_category.deletebycategory(category)
    category_list()

def book_list():
    results = model_book.findall()
    for index, result in enumerate(results):
        print(f'{index + 1}: {result["category"]} / {result["title"]} / {result["price"]}')

def book_add():
    category_no = input('category_no: ')
    title = input('title: ')
    price = input('price: ')
    model_book.insert(category_no, title, price)

    print('--------------------')
    book_list()

def book_delete():
    title = input('title: ')
    model_book.deletebytitle(title)
    book_list()


# print("--회원 리스트--")
# model_member.insert()
# model_member.insert()
# results = model_member.findall()
# for result in results:
#     print(result)




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