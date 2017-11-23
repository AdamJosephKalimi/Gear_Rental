class BookingMailerPreview < ActionMailer::Preview
  def pending
    user = User.first
    BookingMailer.pending(user)
  end

  def awaiting_confirmation
    booking = Booking.first
    BookingMailer.awaiting_confirmation(booking)
  end
end
