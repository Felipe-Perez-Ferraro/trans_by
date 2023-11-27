class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.datetime :created_at, null: false
    end

    add_reference :groups, :user, foreign_key: true
  end
end
