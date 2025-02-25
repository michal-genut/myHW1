# 1
def func1(num1, num2):
    if num1 > num2:
        return num1
    return num2


print(func1(10, 20))
#################### its my change!!

# 2
def func2(num1, num2, num3):
    x = func1(num1, num2)
    if x > num3:
        return x
    else:
        return num3


print(func2(2, 5, 1))


# 3
def func3(num):
    newnum = num % 10 * 100 + num // 10 % 10 * 10 + num // 100
    return abs(newnum - num)


def abs(n):
    if n < 0:
        return n * -1
    else:
        return n


print(func3(123))


# 4
def func4(num):
    x = num // 10 % 10 * 10 + num % 10
    if x < 50:
        return num - x
    return num + 100 - x


print(func4(453))


# 5
def days_in_month(month):
    if month == 2:
        return 28
    if month == 4 or month == 6 or month == 9 or month == 11:
        return 30
    else:
        return 31


print(days_in_month(5))


# 6
def tomorrow(date):
    days = days_in_month(date // 100 % 10)
    print(date // 10000)
    if date // 10000 == days:
        return 1 * 10000 + (date // 100 % 10 + 1) * 100 + date // 10 % 10 * 10 + date % 10
    return date + 10000


print(tomorrow(280224))

#7
def func7(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    return func7(n - 1) + func7(n - 2)

print(func7(9))
