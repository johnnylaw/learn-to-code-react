class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :username, null: false
      t.string :name, null: false, default: ''
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
