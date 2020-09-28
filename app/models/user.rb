class User < ActiveRecord::Base
    has_many :chore_assigns
    has_many :chores, through: :chore_assigns
end