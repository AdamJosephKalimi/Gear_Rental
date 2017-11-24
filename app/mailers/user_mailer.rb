class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user

    mail to: @user.email, subject: "Welcome to Gearz! You are now registered. Start adding and renting
    gear!", from: "Adam.@Gears.com"
  end
end
