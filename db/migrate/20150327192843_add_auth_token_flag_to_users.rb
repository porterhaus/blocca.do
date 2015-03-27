class AddAuthTokenFlasToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auth_token_flag, :boolean
  end
end
