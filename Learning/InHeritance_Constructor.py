class A:
    def __init__(self):
        print("In Init A")

    def F1(self):
        print("Feature 1 is working")

    def F2(self):
        print("Feature 2 is working")


class B:
    # class B(A): ##<- For calling single constructor from B to A
    def __init__(self):
        ##        super().__init__() <---- To call the Init method in the Class A
        print("In Init B")

    def F3(self):
        print("Feature 3 is working")

    def F4(self):
        print("Feature 4 is working")


class C(A, B):
    def __init__(self):
        super().__init__()  ##< It will only call one of the Super Class A or B
        print("In Init C")  ##< It will only call the init method in C as first look into C then other -A or B

##Method Resolution Order -->
## The Order is always Left to Right
##a=C() in this case it will check for the Left one which is C itself then , C(A,B) it will call the method/init from A
##For Same feature as well present in the both class A and B it will Print A 's Method

    def feat(self):
        super().F1()  ##<--  Calling Super calss from Child
        super(C, self).F4()
c1 = C()
c1.feat()