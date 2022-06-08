class pycharm:
    def execution(self):
     print("Runing..")


class MyEditor:
    def execution(self):
     print("Compiling")
     print("Running")


class Laptop:
    def code(self, ide):
        ide.execution()


#ide = pycharm()  ###<- Definining ide object of type pycharm

## For Duck Typing the Method name inside the class should be the same
##The Passinf object can change but it will only change the object of differnt classes ->ide Like Below
ide=MyEditor()
##The Value of ide changes but as the method called inside the Laptop - execution is same in the both Class it is returning the exact value  we want
lap1 = Laptop()

lap1.code(ide)

#######
