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
        chore_1 = self.chores
        chore_2 = user.chores

        self.chores = chore_2
        user.chores = chore_1

    end
end
