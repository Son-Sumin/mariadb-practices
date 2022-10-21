from models import model_member
from models import model_category
from models import model_book
from models import model_cart
from models import model_orders
# from models import model_member

def member_list():
    results = model_member.findall()
    for index, result in enumerate(results):
        print(f'{index + 1}: {result["name"]} / {result["phone"]} / {result["email"]} / {result["password"]}')


def category_list():
    results = model_category.findall()
    for index, result in enumerate(results):
        print(f'{index + 1}: {result["category"]}')


def book_list():
    results = model_book.findall()
    for index, result in enumerate(results):
        print(f'{index + 1}: {result["category"]} / {result["title"]} / {result["price"]}원')

#
def cart_list():
    results = model_cart.findall()
    for index, result in enumerate(results):
        print(f'{index + 1}: {result["title"]} / {result["amount"]}권 / {result["price"]}원')

def orders_list():
    results = model_orders.findall()
    for index, result in enumerate(results):
        print(f'{index + 1}: {result["orders_number"]} / {result["name"]}/ {result["email"]} / 결제금액: {result["payment"]}원/ {result["delivery_address"]}')

#
#
# def orders_book_list():
#     results = model_______.findall()
#     for index, result in enumerate(results):
#         print(f'{index + 1}: {result["book_no"]} / {result["title"]} / {result["amount"]}')


print("--회원 리스트--")
model_member.insert('짱구', '01022225555', 'zzang@gmail.com', '5555')
model_member.insert('맹구', '01033336666', 'mang@gmail.com', '6666')
member_list()

print("\n--카테고리 리스트--")
model_category.insert('Novel')
model_category.insert('Essay')
model_category.insert('IT')
category_list()

print("\n--상품리스트--")
model_book.insert('1', '짱구의 운수좋은날', '20000')
model_book.insert('2', '맹구의 여행', '25000')
model_book.insert('3', '철수의 python 입문', '22000')
book_list()

print("\n--카트 리스트--")
model_cart.insert('1', '1', '1')
model_cart.insert('2', '2', '1')
cart_list()

print("\n--주문 리스트--")
model_orders.insert('2210230005', '1', '20000', '서울특별시 서초구 서초대로74길 33')
orders_list()


print("\n--주문 도서 리스트--")