class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update, :destroy]

  def index
    @gear = Gear.all
  end

  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new(gear_params)
    if @gear.save?
      redirect_to "pages#home" # needs to be changed when routes are added
    else
      render 'new'
    end
  end

  def show
  end


  def edit
  end

  def update
    if @gear.save?
      redirect_to "pages#home" # needs to be changed when routes are added
    else
      render 'edit'
    end
  end

  def available
    # need method for checking availability
  end

  def destroy
    @gear.destroy
    redirect_to "pages#home" # needs to be changed when routes are added
  end

  private

  def set_gear
    @gear = Gear.find(params[:id])
  end

  def gear_params
    params.require(:gear).permit(:name, :size, :description, :address, :category)
  end
end

