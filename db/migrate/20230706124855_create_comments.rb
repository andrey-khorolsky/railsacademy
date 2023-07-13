class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :text

      t.timestamps
    end

    add_foreign_key :comments, :users, column: :user_id, primary_key: :id
    add_foreign_key :comments, :posts, column: :post_id, primary_key: :id


    # execute "CREATE SEQUENCE comments_id_seq START 1"
    execute "ALTER TABLE comments ALTER COLUMN id SET DEFAULT NEXTVAL('comments_id_seq')"
  end
end
