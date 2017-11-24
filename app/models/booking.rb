class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :gear
  has_many :reviews

  validates :start_date, presence: true
  validates :end_date, presence: true

  def check_availability
    gear_bookings = self.gear.bookings
    bookings = gear_bookings.select{|b| b.start_date <= self.start_date && b.end_date >= self.start_date }
    bookings += gear_bookings.select{|b| b.start_date <= self.end_date && b.end_date >= self.end_date }
    return bookings.empty?
  end

  def valid_date
    now = Date.today
    if end_date <= start_date && start_date < now
      false
    else
      true
    end
  end
end
