class Chore < ActiveRecord::Base
    has_many :chore_assigns
    has_many :users, through: :chore_assigns

    def self.names
        self.all.map {|chore| chore.name}
    end
end