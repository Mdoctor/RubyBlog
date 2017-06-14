class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, null: false,:string
  end
end
