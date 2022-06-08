class Car:
    ###Class Varibale which affects all the objects
    ###Class Namsespace
    wheels = 4

    def __init__(self):
        self.mil = 10
        self.com = "AUDI"


###Instance Namespace
###Theese are instant variables as its changes with the instance - like car-BMW or mil=20
###Instance Variable only affects to the particular object they have instaniated

c1 = Car()
c2 = Car()
###Chnaging the value of Instance variables

c1.mil = 20
c1.com = "BMW"

###Changing the value of Class Variables
Car.wheels = 2

print(c1.com, c1.mil, c1.wheels)
print(c2.com, c2.mil, c2.wheels)
