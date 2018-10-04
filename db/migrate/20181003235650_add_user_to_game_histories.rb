class AddUserToGameHistories < ActiveRecord::Migration[5.2]
  def change
    add_reference :game_histories, :user, foreign_key: true
  end
end
