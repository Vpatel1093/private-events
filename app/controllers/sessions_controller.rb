class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: params[:session][:id])
    if user
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:danger] = "Invalid user"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil
    redirect_to login_path
  end
end
