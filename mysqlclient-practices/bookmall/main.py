from models import model_member

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
    email = input('name: ')
    model_member.deletebyname(name)
    member_list()


print("--회원 리스트--")
model_member.insert('짱구', '01022225555', 'zzang@gmail.com', '5555')
model_member.insert('맹구', '01033336666', 'mang@gmail.com', '6666')
results = model_member.findall()
for result in results:
    print(result)

print("--카테고리 리스트--")


print("--상품리스트--")


print("--카트 리스트--")


print("--주문 리스트--")


print("--주문 도서 리스트--")