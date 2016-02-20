class ConvertDoneTypeTasks < ActiveRecord::Migration
  def change
    rename_column :tasks, :done, :done_old
    add_column :tasks, :done, :integer
  end
end
