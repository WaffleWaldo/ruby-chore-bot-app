 class AddStatusToChores < ActiveRecord::Migration[4.2]
    def change
        add_column :chores, :status, :boolean
    end
end