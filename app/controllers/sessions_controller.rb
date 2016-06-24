class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by_login(params[:session][:login])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash[:notice] = "Invalid email or password"
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
