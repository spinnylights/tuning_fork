class CreateScratches < ActiveRecord::Migration[5.1]
  def change
    create_table :scratches do |t|
      t.string :name
      t.text :items
      t.references :task_group, foreign_key: true

      t.timestamps
    end
  end
end
