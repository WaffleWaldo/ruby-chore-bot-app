class AddUserToChoreAssigns < ActiveRecord::Migration[4.2]
  def change
    add_column :chore_assigns, :user_id, :integer
  end
end