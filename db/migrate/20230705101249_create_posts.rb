class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :text
      # t.attachment :img, default: nil

      t.timestamps
    end

    add_foreign_key :posts, :users
  end
end
