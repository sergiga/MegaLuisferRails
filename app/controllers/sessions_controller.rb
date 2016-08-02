class SessionsController < ApplicationController
  before_action :check_authenticate, only: :new

  def create  # Log in action
    user =  User.find_by(username: params[:session][:username]) ||
            User.find_by(email: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      # Log the user in the home page
      log_in user
      redirect_to home_path
    else
      # Show errors highlighting the fields
      flash.now[:danger] =  'El nombre de usuario y la contraseña que ingresaste
                            no coinciden con nuestros registros. Por favor,
                            revisa e inténtalo de nuevo.'
      render 'new'
    end
  end

  def destroy # Log out action
    log_out
    redirect_to root_url
  end

  private
    def check_authenticate
      redirect_to home_path if logged_in?
    end
end
