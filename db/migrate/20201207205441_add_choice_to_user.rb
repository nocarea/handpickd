class AddChoiceToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :choice, :string
  end
end
