class Chore < ActiveRecord::Base
    has_many :chore_assigns
    has_many :users, through: :chore_assigns

    def self.names
        self.all.map {|chore| chore.name}
    end

    def self.chore_status
        self.all.map do |chore|
            if chore.status == false
                "incomplete"
            else
                "complete"
            end
        end
    end

    def complete
        self.status = true
        self.save
    end
end