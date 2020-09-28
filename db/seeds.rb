User.delete_all
Chore.delete_all
ChoreAssign.delete_all

susan = User.create(name: "Susan")
bobby = User.create(name: "Bobby")

dishes = Chore.create(name: "Do the Dishes")
trash = Chore.create(name: "Take out the trash")


assign_1 = ChoreAssign.create()

assign_1.user = susan
assign_1.chore = dishes