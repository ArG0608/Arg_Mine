class Phone:
    def show(self):
        print('NOKIA')
class MyPhone(Phone):
    pass
    ## In this case as show is not defined in the MyPhone class that is why it is getting from the super class
    ##If the Method Show is present in the MyPhone then It will override the Phone class's Show metheod with the MyPhone Show method
    def show(self):
        print('Realme')
p= MyPhone()
p.show()