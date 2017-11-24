class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update, :destroy, :available]

  def index
    @gears = Gear.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@gears) do |gears, marker|
      marker.lat gears.latitude
      marker.lng gears.longitude
    end
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
    @gears = Gear.where("name ILIKE :term OR category ILIKE :term", term: "%#{params[:term]}%").order('id DESC').where.not(latitude: nil, longitude: nil)
   # @gears = Gear..search(params[:term])
    @hash = Gmaps4rails.build_markers(@gears) do |gears, marker|
      marker.lat gears.latitude
      marker.lng gears.longitude
    end
  end

  def edit
  end

  def update
    if @gear.save
      redirect_to gear_path
      flash[:notice] = "Success"
    else
      render 'edit'
    end
  end

  def destroy
    @gear.destroy
    redirect_to gears_path
  end

  private

  def set_gear
    @gear = Gear.find(params[:id])
  end

  def gear_params
    params.require(:gear).permit(:name, :size, :description, :address, :category, :term, :price, photos: [])
  end
end
