class UserController < ApplicationController
  # def show
  # end

  # def new
  # end

  # create a user profile when first signing up
  def create
    @user = User.new(user_params)
    if @user.save?
      redirect_to "pages#home"
    else
      render 'new' # This is the sign up page
    end
  end

  # edit user profile
  def edit
  end

  # update - patch the new information to the database
  def update
  end


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # the params here are the 3 things the user submit
    params.require(:user).permit(:email, :username, :phone_number)
  end
  # No destroy - they can close their account but we keep it
  # def destroy
  # end

end

# pages we need
# create user page - on initial sign up
# show page - where you can see all of the people's gear
user edit page





