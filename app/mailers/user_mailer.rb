class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail to: @user.email, subject: "Welcome to my site #{@user.email}", from: "Adam.@Gears.com"
  end

#   def create_gear(gear)
#     @gear = gear
#     mail to: @gear.user.email, subject: "Thank you for adding your gear!" from: "Adam.@Gears.com"
#   end
# end

# create gears mailer gears_create


# trigger send the email through the controller for gears
# app/controllers/gears_controller.rb
# class RestaurantsController < ApplicationController
#   def create
#     @gear = current_user.restaurants.build(gear_params)

#     if @gear.save
#       GearMailer.creation_confirmation(@gear).deliver_now
#       redirect_to gear_path(@gear)
#     else
#       render :new
#     end
#   end
end
