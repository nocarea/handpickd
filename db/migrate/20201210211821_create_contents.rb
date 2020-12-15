class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :category
      t.string :url

      t.references :users
      t.timestamps
    end
  end
end
