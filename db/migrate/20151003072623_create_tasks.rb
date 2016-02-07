class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :start
      t.datetime :finish
      t.text :detail
      t.boolean :done

      t.timestamps null: false
    end
  end
end
