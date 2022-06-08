class Student:
    def __init__(self, m1, m2):
        self.m1 = m1
        self.m2 = m2

    def __add__(self, other):
        m1 = self.m1 + other.m1
        m2 = self.m2 + other.m2
        s4 = Student(m1, m2)
        return s4

    def __gt__(self, other):
        if self.m1 + self.m2 > other.m2 + other.m1:
            return True
        else:
            return False

    def __str__(self):
        return self.m1, self.m2
     #   return '{} {}'.format(self.m1, self.m2)


s1 = Student(89, 2)
s2 = Student(4, 5)

s3 = s1 + s2

print(s3.m1, s3.m2)
print(s1.__str__(),"<-S1----S2->",s2.__str__())
if s1 > s2:
    print("s1 wins", s1)
else:
    print("s2 wins", s2)
