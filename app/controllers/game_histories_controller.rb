class GameHistoriesController < ApplicationController
  def index
    game_histories = GameHistory.all
    render json: game_histories
  end

  def create
    #Create a new game history
    game_history = GameHistory.create(game_history_params)

    #respond with our new game history
    render :json game_history
  end

  def show
    id = params[:id]
    game_history = GameHistory.find_by_id "#{id}"
    render :json game_history
  end

  def update
    id = params[:id]
    game_history = GameHistory.update(id, game_history_params)
    render :json game_history
  end

  def destroy
    id = params[:id]
    GameHistory.find(id).destroy
  end

  # Handle strong params, so we are secure
  def game_history_params
    params.require(:game_history).permit(:game_mode, :correct_answers, :total_questions, :user_id)
  end
end
