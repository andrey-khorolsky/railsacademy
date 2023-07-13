class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :text
      t.string :img

      t.timestamps
    end

    add_foreign_key :posts, :users, column: :user_id, primary_key: :id

    # execute "CREATE SEQUENCE posts_id_seq START 1"
    execute "ALTER TABLE posts ALTER COLUMN id SET DEFAULT NEXTVAL('posts_id_seq')"
  end
end
