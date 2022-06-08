class A:
    def F1(self):
        print("Feature 1 is working")

    def F2(self):
        print("Feature 2 is working")


class B(A):
    def F3(self):
        print("Feature 3 is working")

    def F4(self):
        print("Feature 4 is working")


class C(B):
    def F5(self):
        print("Feature 5 is working -> MUltileven Inheritance")


class D:
    def F6(self):
        print("Feature 6  is working -> Multiple Inheritance")


###Multiple Inheritance -->
class E(C, D):
    pass


b1 = B()
b1.F1()  ####<- Single Inheritance of A get through B
c1 = C()
c1.F1()
c1.F3()  ###<- Multi Level Inheritance

e1=E();
e1.F6() ###<-Multiple Inheritance
e1.F5()