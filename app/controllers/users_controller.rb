class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    debugger
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end
  
  private
    def user_params
      params.require(:user).permit( :name, :username, :email, :password,
                                    :password_confirmation)
    end
end
