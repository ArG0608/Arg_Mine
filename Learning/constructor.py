class person:
    def __init__(self):
        self.name = "Arnab"
        self.age = 24

    def age_update(self):  ###<- p2 is passed as self
        self.age = 26

    # Self is the Who is calling and Other is Whom to Compare with
    def compare(self, other_age):
        if self.age == other_age.age:
            return True
        else:
            return False


p1 = person()
p2 = person()

# Changable name in the object in p1 subject
# p1.name = "Aikyo"

# Update the age in the object based on the concept self will pass p1 obejct-
# p2.age_update()

##Using Compare Funcion to Check for the same age-

if p1.compare(p2):
    print("They are Same")
else:
    print("They are not same")

print(p1.name, p1.age)
print(p2.name, p2.age)
