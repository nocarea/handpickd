class AddTicketToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ticket, :date, default: Time.now.to_date
  end
end
