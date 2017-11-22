class BookingsController < ApplicationController
 before_action :set_booking, only: [:show, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @user=current_user
    @gear = Gear.find(params[:gear_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.gear = @gear
    if @booking.save?
      redirect_to :root
    else
      # This will send to gear page
      redirect_to :new
    end
  end

  def show

  end

  def destroy
    @booking.destroy
    redirect_to "pages#home"
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:gear_id, :start_date, :end_date)
  end
end
