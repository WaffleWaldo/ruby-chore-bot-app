class ChoreAssign < ActiveRecord::Base
    belongs_to :users
    belongs_to :chores
end