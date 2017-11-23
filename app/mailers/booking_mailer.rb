class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.pending.subject
  #
  def pending(user)
    @user = user

    mail to: @user.email, subject: "Thank you for your booking!", from: "no.reply@Gears.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.awaiting_confirmation.subject
  #
  def awaiting_confirmation(booking)
    @booking = booking
    @renter = booking.gear.user

    mail to: @renter.email, subject: "Confirmation Awaiting!", from: "no.reply@Gears.com"
  end
end
