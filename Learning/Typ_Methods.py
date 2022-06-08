class Student:
    school = 'HETC'

    def __init__(self, m1, m2, m3):  ###<- Self always defined objects
        self.m1 = m1
        self.m2 = m2
        self.m3 = m3

    def avg(self):  ###<- Instance method as it is always works with the objects like s1.avg()
        return self.m1 + self.m2 + self.m3 / 3

    ###Getters -> Accessor Method
    def get_m1(self):
        return s1.m1

    ###Setters -> Mutator Methof
    def set_m2(self, value):
        s2.m2 = value

    @classmethod  ### It is called Decorator
    def scl_info(cls):
        return cls.school

    ###Static Method
    @staticmethod
    def info_static():
        print("This is Static Method")


s1 = Student(50, 45, 33)
s2 = Student(44, 54, 88)

###Static Method
Student.info_static()
####Getter and Setter
s2.set_m2(10)
print(s2.m1, s2.m2, s2.m3)
print(s1.get_m1())

###Print Classmethod or Class Instance return value -
print(Student.scl_info())

#####Instance Variable Print from Instance Object
print(s1.m1, s1.m2, s1.m3)
print(s1.m1, s1.m2, s1.m3, s1.avg())
print(Student.school, s1.m1, s1.m2, s1.m3)
