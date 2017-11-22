class Review < ApplicationRecord

  # belongs_to :user
  # belongs_to :gear
  belongs_to :booking

  # validation

  # booking_id

  # user_content
  validates :user_content, length: { minimum: 5 }

  # gear_content
  validates :gear_content, length: { minimum: 5 }
end
