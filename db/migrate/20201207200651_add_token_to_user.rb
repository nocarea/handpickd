class AddTokenToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :token, :boolean, default: false
  end
end
