class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:current_user_id] = user.id
      redirect_to admin_root_path
    else
      @user = User.new(email: params[:user][:email])
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to home_path
  end
end
