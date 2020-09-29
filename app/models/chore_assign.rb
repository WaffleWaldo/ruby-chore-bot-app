class ChoreAssign < ActiveRecord::Base
    belongs_to :user
    belongs_to :chore

    @@all_chores = []
    def self.randomize
        self.delete_all
        @@all_chores << Chore.all
        @@all_chores.flatten!

        User.all.each do |user|
            user.chores.clear
            random_chore = @@all_chores.sample

            user.chores << random_chore
            new_assign = ChoreAssign.create
            new_assign.user = user
            new_assign.chore = random_chore

            @@all_chores.delete(random_chore)
        end 
    end
end