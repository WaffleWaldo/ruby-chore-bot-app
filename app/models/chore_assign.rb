class ChoreAssign < ActiveRecord::Base
    belongs_to :user
    belongs_to :chore
    @@all_chores = []

    
    def self.chore_assignment_array
        rows = []
        ChoreAssign.all.each do |assign|
            row = []
            if assign.user_id != nil
                row << User.find(assign.user_id).name
                row << Chore.find(assign.chore_id).name
                if Chore.find(assign.chore_id).status == true
                    row << "Complete".colorize(:green)
                else
                    row << "Incomplete".colorize(:red)
                end
                
                rows << row
            end
        end
        rows
    end
    
    
    def self.construct_display
        table = TTY::Table.new(["Name","Chore","Status"], ChoreAssign.chore_assignment_array)
        puts table.render(:ascii)
    end
    def self.user_reset
        User.all.each do |user| 
            user.chores.clear
            user.save
        end
    end
    def self.chore_reset
        Chore.all.each do |chore|
            chore.status = false
            chore.save
        end
    end

    ##Helper method for .randomize
    def self.create_chore_assignment(user,chore)
        new_assign = ChoreAssign.create
        user.chore_assigns << new_assign
        chore.chore_assigns << new_assign
    end
    
    def self.randomize
        self.delete_all
        self.user_reset
        self.chore_reset
        @@all_chores << Chore.all
        @@all_chores.flatten!

        until @@all_chores.length == 0 do
            User.all.each do |user|
                if user.chores.length < ((Chore.all.length/User.all.length.to_f).ceil) && @@all_chores.sample != nil
                    random_chore = @@all_chores.sample
                    self.create_chore_assignment(user,random_chore)
                    @@all_chores.delete(random_chore)
                end
            end
        end
    end 
end