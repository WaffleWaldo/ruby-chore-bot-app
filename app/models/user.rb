class User < ActiveRecord::Base
    has_many :chore_assigns
    has_many :chores, through: :chore_assigns

    def add_chore(chore)
        self.chores << chore
    end
        

    def chore_names
        self.chores.map {|chore| chore.name}
    end
    
end
