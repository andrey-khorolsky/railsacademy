class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.integer :author_id
      t.integer :follower_id

      t.timestamps
    end

    add_foreign_key :followers, :users, column: :author_id, primary_key: :id
    add_foreign_key :followers, :users, column: :follower_id, primary_key: :id
  end
end
