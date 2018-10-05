class UsersController < ApplicationController
  def index
    user = User.all
    render json: user
  end

  def show
    id = params[:id]
    user = User.find_by_id(user_params)

    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
