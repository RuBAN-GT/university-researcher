class UserAttributes < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :realname, :string
  end
end
