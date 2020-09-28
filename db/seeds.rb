User.delete_all
Chore.delete_all
ChoreAssign.delete_all

susan = User.create(name: "Susan")
bobby = User.create(name: "Bobby")

dishes = Chore.create(name: "Do the Dishes")
trash = Chore.create(name: "Take out the trash")


assign_1 = ChoreAssign.assign_chore(susan, dishes)
assign_2 = ChoreAssign.assign_chore(bobby, trash)

assign_1.users = susan