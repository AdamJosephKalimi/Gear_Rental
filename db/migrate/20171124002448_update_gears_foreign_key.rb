class UpdateGearsForeignKey < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :bookings, :gears
    add_foreign_key :bookings, :gears, on_delete: :cascade
    remove_foreign_key :reviews, :bookings
    add_foreign_key :reviews, :bookings, on_delete: :cascade
  end
end
