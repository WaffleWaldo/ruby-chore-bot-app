class ChoreAssign < ActiveRecord::Base
    belongs_to :user
    belongs_to :chore
    @@all_chores = []

    def self.construct_display
        display = []
        
    end
    def self.user_reset
        User.all.map {|user| user.chores.clear}
    end

    def self.create_chore_assignment(user,chore)
        new_assign = ChoreAssign.create
        new_assign.user = user
        new_assign.chore = chore
    end
    
    def self.randomize
        self.delete_all
        self.user_reset
        @@all_chores << Chore.all
        @@all_chores.flatten!

        until @@all_chores.length == 0 do
            User.all.each do |user|
                if user.chores.length < ((Chore.all.length/User.all.length.to_f).ceil)
                    random_chore = @@all_chores.sample
                    user.chores << random_chore
                    self.create_chore_assignment(user,random_chore)
                    @@all_chores.delete(random_chore)
                end
            end
        end 
    end
    
end