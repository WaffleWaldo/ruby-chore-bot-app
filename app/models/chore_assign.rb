class ChoreAssign < ActiveRecord::Base
    belongs_to :users
    belongs_to :chores

    def self.assign_chore(user,chore)
        self.create(user_id: user.id, chore_id: chore.id)
    end
end