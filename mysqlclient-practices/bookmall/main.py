from models import model_member


print("--회원 리스트--")
model_member.insert()
model_member.insert()
results = model_member.findall()
for result in results:
    print(result)


print("--카테고리 리스트--")

print("--상품 리스트--")

print("--카트 리스트--")

print("--주문 리스트--")

print("--주문도서 리스트--")