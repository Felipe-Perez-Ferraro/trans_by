class CreateOperations < ActiveRecord::Migration[7.1]
  def change
    create_table :operations do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.float :amount
      t.datetime :created_at, null: false
    end
  end
end
