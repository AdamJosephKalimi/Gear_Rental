class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update, :destroy]

  def index
    @gears = Gear.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@gears) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new(gear_params)
    if @gear.save?
      redirect_to "gears#index"
    else
      render 'new'
    end
  end

  def show
    @gear_coordinates = {lat: @gear.latitude, lng: @gear.longitude }
  end

  def search
    # need search functionality
    @gears = Gear.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@gears) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end


  def edit
  end

  def update
    if @gear.save?
      redirect_to "gears#index" #
    else
      render 'edit'
    end
  end

  def available
    # need method for checking availability
  end

  def destroy
    @gear.destroy
    redirect_to "gears#index"
  end

  private

  def set_gear
    @gear = Gear.find(params[:id])
  end

  def gear_params
    params.require(:gear).permit(:name, :size, :description, :address, :category)
  end
end

