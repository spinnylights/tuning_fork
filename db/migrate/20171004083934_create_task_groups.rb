class CreateTaskGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :task_groups do |t|
      t.string :name
      t.references :day, foreign_key: true

      t.timestamps
    end
  end
end
