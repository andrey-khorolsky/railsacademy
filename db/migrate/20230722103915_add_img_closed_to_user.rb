class AddImgClosedToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :img, :string, default: '/uploads/user.jpg'
    add_column :users, :closed, :boolean, default: false
    add_column :users, :description, :string
    add_column :users, :realname, :string
  end
end
