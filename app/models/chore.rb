class Chore < ActiveRecord::Base
    has_many :chore_assigns
    has_many :users, through: :chore_assigns
end