class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # t.int auto_increment :id
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end

    # execute "CREATE SEQUENCE _token_number_seq"


  end
end
