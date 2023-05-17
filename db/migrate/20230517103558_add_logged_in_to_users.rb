class AddLoggedInToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :logged_in, :boolean, default: false
  end
end
