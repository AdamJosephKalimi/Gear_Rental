class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validations
  # Don't need validations for email or password
  # devise.rb takes care of those.

  has_many :reviews, through: :bookings
  has_many :bookings
  has_many :gears

  # username
  validates :username, presence: true
  # validates :username, length: { minimum: 6 }
  validates :username, uniqueness: true

  # phone_number
  validates :phone_number, presence: true
  validates :phone_number, length: { minimum: 6 }

end
