class Gear < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  # photo upload
  has_attachments :photos, maximum: 3

  # category
  validates :category, presence: true, inclusion: {in: ["mountain bike", "road bike", "windsurf sails", "windsurf board", "kite board", "skis"]}
  # name
  validates :name, presence: true

  # description
  validates :description, presence: true
  validates :description, length: { minimum: 5 }

  # size
  validates :size, presence: true

  # address
  validates :address, presence: true

  #geocode
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
