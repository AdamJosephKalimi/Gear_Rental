class PagesController < ApplicationController

  def home
  end

  def dashboard
    @user = current_user
  end
end


# bookings = current_user.gears.map{|g| g.bookings}.flatten

# bookings.each do |booking|

# if booking.active.nil, show this message
# "User has reuqested to borrow you #{gear_id}"

# 2 simple form with
# simple_form_for(@booking)
# f.hidden_field :active, value: "true"
# f.submit <confirm>

# 2 simple form with
# simple_form_for(@booking)
# f.hidden_field :active, value: "false"
# f.submit <deny>

# else
# next
# end

# end
