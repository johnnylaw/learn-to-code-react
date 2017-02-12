class AddCreatedAtToTodos < ActiveRecord::Migration[5.0]
  def change
    change_table :todos do |t|
      t.datetime :completed_at, null: true
    end
  end
end
