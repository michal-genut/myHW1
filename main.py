# 1.
def func1(num):
    x = num % 10
    temp = num // 10
    temp = x * 1000 + temp
    return temp


print(func1(1234))


# 2.
def func2(num):
    dig1 = num % 10
    dig2 = num % 100 // 10
    dig3 = num // 100
    newnum = dig1 * 100 + dig2 * 10 + dig3
    return newnum


print(func2(123))


# 3.
def func3(pupils_count):
    return pupils_count // 2 + pupils_count % 2


print(func3(51))


# 4.
def func4(side):
    return side ** 3


print(func4(4))


# 5.
def func5(hours, minutes, seconds):
    return seconds + minutes * 60 + hours * 60 * 60


print(func5(2, 30, 23))


# 6.
def func6(money):
    count = 0
    sum = money // 10
    count = sum
    money -= sum * 10
    sum = money // 5
    count += sum
    money -= sum * 5
    sum = money // 2
    count += sum
    money -= sum * 2
    sum = money // 1
    count += sum
    money -= sum * 2
    return count


print(func6(36))


# 7.
def func7(num, digit):
    digit = 10 ** (digit - 1)
    return int(num // digit % (digit / 10))


print(func7(5678, 3))
