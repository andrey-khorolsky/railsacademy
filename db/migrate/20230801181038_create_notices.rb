class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.integer :author_id
      t.integer :notice_type_id

      t.timestamps
    end

    add_foreign_key :notices, :users, column: :author_id, primary_key: :id
    add_foreign_key :notices, :notice_types, column: :notice_type_id, primary_key: :id

    add_reference :notices, :users, foreign_key: true, index: false
    add_reference :notices, :posts, foreign_key: true, index: false
    add_reference :notices, :comments, foreign_key: true, index: false
  end
end
