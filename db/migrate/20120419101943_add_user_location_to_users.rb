class AddUserLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_location, :string
  end
end
