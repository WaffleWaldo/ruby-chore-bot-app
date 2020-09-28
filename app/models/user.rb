class User < ActiveRecord::Base
    has_many :chore_assigns
    has_many :chores, through: :chore_assigns

    def chore
        Chore.all.select do |chore|
            #for (i = 0, i < self.chore_assign.length, i += 1) 
                chore.id == self.chore_assigns[i].chore_id
        end
    end
        
    #     self.chore_assigns.each do |assign|
    #         # Chore.find(assign.chore_id)
    #         counter = assign.chore_id
    #         Chore.all[counter].name
    #     end
    # end        
        # ChoreAssign.all.each do |assigns| 
        #     if assigns.user_id == self.id
        #         Chore.all
        #     end
        # end
end
