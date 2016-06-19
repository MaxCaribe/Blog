class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(login: params[:session][:login])
    if user && user.authenticate(params[:session][:password])
      redirect_to user
    else
      flash[:error] = 'Invalid login or password'
      render 'new'
    end

  end

  def destroy

  end
end
