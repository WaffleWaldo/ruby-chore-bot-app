User.delete_all
Chore.delete_all
ChoreAssign.delete_all

susan = User.create(name: "Susan")
bobby = User.create(name: "Bobby")
rocky = User.create(name:"Rocky")
frank = User.create(name:"Frank")


dishes = Chore.create(name: "Do the Dishes")
trash = Chore.create(name: "Take out the trash")
sweep = Chore.create(name: "Sweep the floors")
bathroom = Chore.create(name: "Clean the bathroom")


