class AddListToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :list_id, :integer
  end
end
