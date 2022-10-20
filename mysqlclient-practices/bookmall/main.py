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
    # if firstname == '':
    #     print(f'입력 필수 항목입니다')

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
    # if firstname == '':
    #     print(f'입력 필수 항목입니다')

    model_category.insert(category)

    print('--------------------')
    category_list()

def category_delete():
    category = input('category: ')
    model_category.deletebycategory(category)
    category_list()


# print("--회원 리스트--")
# model_member.insert('짱구', '01022225555', 'zzang@gmail.com', '5555')
# model_member.insert('맹구', '01033336666', 'mang@gmail.com', '6666')
# results = model_member.findall()
# for result in results:
#     print(result)
#
# print("\n--카테고리 리스트--")
# model_category.insert('Novel')
# model_category.insert('Essay')
# model_category.insert('IT')
# results = model_category.findall()
# for result in results:
#     print(result)


print("\n--상품리스트--")
model_book.insert('짱구의 일기', '20000')
model_book.insert('맹구의 일기', '25000')
model_book.insert('철수의 일기', '22000')
results = model_book.findall()
for result in results:
    print(result)


print("\n--카트 리스트--")


print("\n--주문 리스트--")


print("\n--주문 도서 리스트--")