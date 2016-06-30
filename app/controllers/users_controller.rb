class UsersController < ApplicationController

  # GET /users/new
  def new
    if current_user
      redirect_to root_path
    end
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    if(user_params)
      @user = User.new(user_params)
      if @user.save
        redirect_to signin_path
      end
      render 'new'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login,:first_name,:last_name,:password, :password_confirmation)
    end
end
