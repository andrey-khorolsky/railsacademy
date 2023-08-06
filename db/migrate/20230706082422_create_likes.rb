class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :likes, :posts, column: :post_id, primary_key: :id
    add_foreign_key :likes, :users, column: :user_id, primary_key: :id
  end
end
