class CreateChores < ActiveRecord::Migration[4.2]
    def change
      create_table :chores do |t|
        t.string :name 
      end
    end
  end