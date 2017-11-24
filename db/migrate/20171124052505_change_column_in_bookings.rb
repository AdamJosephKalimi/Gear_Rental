class ChangeColumnInBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :confirmed, :boolean, :default => nil
  end
end
