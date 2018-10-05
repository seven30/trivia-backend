require 'rails_helper'

RSpec.describe GameHistory, type: :model do
  before do
    @user1 = User.create(id:1, email:'user1@example.com', password:'password1', username:'user1')
  end

  it "should validate game mode" do
    game_history = GameHistory.create

    expect(game_history.errors[:game_mode]).to_not be_empty
  end
end
