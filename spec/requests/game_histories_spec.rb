require 'rails_helper'

describe "Game Histories API" do
  before do
    @user1 = User.create(id:1, email:'user1@example.com', password:'password1', username:'user1')
  end

  it "gets a list of Game Histories" do
    #Create a game history in the Test Database
    GameHistory.create(game_mode:'classic', correct_answers:2, total_questions: 10, user_id:@user1.id)

    get '/users/1/game_histories'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.length).to eq(1)
  end

  it "creates a list of game histories" do
    game_history_params = {
      game_history: {
        game_mode: 'classic',
        correct_answers: 8,
        total_questions: 10,
        user_id: @user1.id
      }
    }

    post '/users/1/game_histories', params: game_history_params

    expect(response).to be_success

    new_game_history = GameHistory.first

    expect(new_game_history.game_mode).to eq('classic')
  end

  it "shows a single game history"

  it "can destroy a single game history"

  it "doesn't create a game history without a game mode" do
    game_history_params = {
      game_history: {
        correct_answers: 8,
        total_questions: 10,
        user_id: @user1.id
      }
    }

    post '/users/1/game_histories', params: game_history_params

    expect(response.status).to eq(422)

    json = JSON.parse(response.body)

    expect(json['game_mode']).to include("can't be blank")
  end
end
