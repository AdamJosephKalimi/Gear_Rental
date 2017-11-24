class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

# after_create :deliver_welcome_email

def deliver_welcome_email
  UserMailer.welcome(self).deliver_now

end

 # Validations ==========================================
  has_many :reviews, through: :bookings
  has_many :bookings
  has_many :gears
  # username
  validates :username, presence: true
  # # validates :username, length: { minimum: 6 }
  # validates :username, uniqueness: true
  # # phone_number
  validates :phone_number, presence: true
  validates :phone_number, length: { minimum: 6 }
  # validations
  # Don't need validations for email or password
  # devise.rb takes care of those.
 # ======================================================


 # OmniAuth =============================================
 def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
# TEMPORARY FIX: this way can log in via facebook
    user_params[:username] = auth.info.email
    user_params[:phone_number] = "please enter a valid phone number"
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end
    return user
  end
 # ======================================================

end
