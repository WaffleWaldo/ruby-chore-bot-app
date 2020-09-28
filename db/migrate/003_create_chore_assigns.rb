class CreateChoreAssigns < ActiveRecord::Migration[4.2]
    def change
        create_table :chore_assigns do |t|
            t.integer :user_id
            t.integer :chore_id
        end
    end
end