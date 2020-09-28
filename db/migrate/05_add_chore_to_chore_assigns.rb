class AddChoreToChoreAssigns < ActiveRecord::Migration[4.2]
  def change
    add_column :chore_assigns, :chore_id, :integer
  end
end