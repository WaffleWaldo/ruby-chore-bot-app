class User < ActiveRecord::Base
    has_many :chore_assigns
    has_many :chores, through: :chore_assigns

    def add_chore(chore)
        self.chores << chore
    end
        
    def chore_names
        self.chores.map {|chore| chore.name}
    end

    def complete
        self.status = true
        self.save
    end

    def switch(user)
        chore_1_id = self.chores.ids
        chore_2_id = user.chores.ids

        chore_1 = Chore.all.where(id: chore_2_id[0])
        self.chores = chore_1

        chore_2 = Chore.all.where(id: chore_1_id[0])
        user.chores = chore_2

        self.save
        user.save
    end
end
