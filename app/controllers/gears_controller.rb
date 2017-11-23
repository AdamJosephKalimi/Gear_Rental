class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update, :destroy]


  def index
    @gears = Gear.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@gears) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end

    search_gear
  end

  def new
    @gear = Gear.new
    @user = current_user
    @category = ["mountain bike", "road bike", "windsurf sails", "windsurf board", "kite board", "skis"]
  end

  def create
    @user = current_user
    @gear = Gear.new(gear_params)
    @gear.user = @user

    if @gear.save
      redirect_to dashboard_path
      flash[:notice] = "Success"
    else
      render 'new'
    end
  end

  def show
    @gear_coordinates = {lat: @gear.latitude, lng: @gear.longitude }
  end

  def search
    search_gear

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

  def search_gear
    @gears = Gear.search(params[:term])
  end

  def set_gear
    @gear = Gear.find(params[:id])
  end

  def gear_params
    params.require(:gear).permit(:name, :size, :description, :address, :category, :term, photos: [], :price)
  end
end
