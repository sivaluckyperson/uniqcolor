class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string

    add_column :users, :user_color, :string

  end
end
