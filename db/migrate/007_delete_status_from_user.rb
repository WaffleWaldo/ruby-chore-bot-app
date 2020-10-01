class DeleteStatusFromUser < ActiveRecord::Migration[4.2]
    def change
        remove_column :users, :status
    end
end