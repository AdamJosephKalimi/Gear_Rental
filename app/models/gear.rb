class Gear < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  # validations

  # category
  validates :category, presence: true

  # name
  validates :name, presence: true

  # description
  validates :description, presence: true
  validates :description, length: { minimum: 5 }

  # size
  validates :size, presence: true

  # address
  validates :address, presence: true

end
