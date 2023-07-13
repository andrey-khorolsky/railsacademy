class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.integer :author_id
      t.integer :follower_id

      t.timestamps
    end

    add_foreign_key :followers, :users, column: :author_id, primary_key: :id
    add_foreign_key :followers, :users, column: :follower_id, primary_key: :id

    # execute "CREATE SEQUENCE followers_id_seq START 1"
    execute "ALTER TABLE followers ALTER COLUMN id SET DEFAULT NEXTVAL('followers_id_seq')"
  end
end
