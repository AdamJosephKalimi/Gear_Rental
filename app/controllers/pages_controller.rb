class PagesController < ApplicationController

  def home
  end

  def dashboard
    @user = current_user
    @unconfirmed_bookings = @user.gears.map{|g|g.pending_bookings}.flatten
  end
end




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
