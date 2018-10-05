class UsersController < ApplicationController
  def index
    user = User.all
    render json: user
  end

  def show
    id = params[:id]
    user = User.find(id)

    render json: user
  end
end
