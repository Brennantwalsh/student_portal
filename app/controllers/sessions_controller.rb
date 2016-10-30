class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'You are logged in'
      redirect_to '/'
    else
      flash[:warning] = 'Incorrect email or Password'
      redirect_to '/lgoin'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You are logged out'
    redirect_to '/login' 
  end
end
