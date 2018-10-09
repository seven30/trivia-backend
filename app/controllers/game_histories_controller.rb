class GameHistoriesController < ApplicationController
  before_action :get_user

  def index
    game_histories = User.find(get_user.id).game_histories
    render json: {username: get_user.username, history: game_histories}
  end

  def create
    game_history = GameHistory.create(game_history_params)

    if game_history.valid?
      render json: game_history
    else
      render json: game_history.errors, status: :unprocessable_entity
    end
  end

  def show
    id = params[:id]
    game_history = GameHistory.find_by_user_id(get_user)

    render json: {username: get_user.username, history: game_history}
  end

  # def update
  #   id = params[:id]
  #   game_history = GameHistory.find_by_user_id(get_user).update(id, game_history_params)
  #   render json: game_history
  # end

  def destroy
    id = params[:id]
    game_history = GameHistory.find_by_user_id(get_user)
    game_history.destroy
  end

  private
  # Handle strong params, so we are secure
  def game_history_params
    params.require(:game_history).permit(:game_mode, :correct_answers, :total_questions, :user_id)
  end

  def get_user
    user = User.find(params[:user_id])
  end
end
