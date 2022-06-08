class Student:
    def __init__(self):
        pass

    def sum(self, a=None, b=None, c=None):
        s = 0

        if a != None and b != None and c != None:
            s = a + b + c
        elif a != None and b != None:
            s = a + b
        else:
            s = a
        return s


s1 = Student()
print(s1.sum(3,4))
