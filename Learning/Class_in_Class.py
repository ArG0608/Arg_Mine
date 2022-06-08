class Student:  ##### <-- Outer Class
    def __init__(self, name, roll):
        self.name = name
        self.roll = roll
        self.lap = self.Laptop()  ####<---Instaniated of Laptop Class

    def show(self):
        print(self.name, self.roll, self.lap.show())

    class Laptop:
        def __init__(self):
            self.name = "arg"
            self.cpu = "i5"
            self.brand = "%s%sHP" % (self.name,self.cpu)

            self.ram = "8GB"

        def show(self):
            print(self.brand)

l1 = Student.Laptop()
s1 = Student("Arnab", 3)
s2 = Student("Aikyo", 6)


# print(s1.name, s1.roll)
s1.show()
