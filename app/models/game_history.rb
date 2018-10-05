class GameHistory < ApplicationRecord
  belongs_to :user

  validates :game_mode, presence: true
end
