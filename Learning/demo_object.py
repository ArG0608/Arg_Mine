class computer:

    def __init__(self, ram, cpu):
        self.ram = ram
        self.cpu = cpu

    def config(self):
        print("Configuration :", self.cpu, self.ram)
#        print("i5,16gb,1TB")



comp1 = computer('i5', 16)
comp2 = computer('Rayzen', 8)

comp1.config()
comp2.config()