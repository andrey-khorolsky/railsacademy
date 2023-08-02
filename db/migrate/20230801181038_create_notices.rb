class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.integer :author_id
      
      t.timestamps
    end

    add_foreign_key :notices, :users, column: :author_id, primary_key: :id


    add_reference :notices, :notice_types, foreign_key: true, index: false
    add_reference :notices, :users, foreign_key: true, index: false
    add_reference :notices, :posts, foreign_key: true, index: false
    add_reference :notices, :comments, foreign_key: true, index: false

  end
end
