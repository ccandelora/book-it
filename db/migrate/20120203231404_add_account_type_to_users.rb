class AddAccountTypeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :account_type, :integer
    User.update_all ["account_type = ?", 0]
  end

  def self.down
    remove_column :users, :account_type
  end
end
