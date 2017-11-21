class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :gear
  has_many :reviews

end
