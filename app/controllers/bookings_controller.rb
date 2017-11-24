class BookingsController < ApplicationController
 before_action :set_booking, only: [:show, :update, :destroy]

  def new
    @booking = Booking.new
    @gear = Gear.find(params[:gear_id])
  end

  def create
    @user=current_user
    @gear = Gear.find(params[:gear_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.gear = @gear
    if @booking.save
      # -1 to renter saying "awaiting confirmation"
      BookingMailer.pending(@user).deliver_now

      # -2 to lender saying "confirmation pending"
      BookingMailer.awaiting_confirmation(@booking).deliver_now

      redirect_to dashboard_path
      flash[:notice] = "Great Success! You've booked some gear!"
    else
      # This will send to gear page
      redirect_to :new
    end
  end

  def show

  end

  def destroy
    @booking.destroy
    redirect_to gear_booking_path
  end

  def update
    @booking.update(booking_params)
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:gear_id, :start_date, :end_date, :confirmed)
  end
end
