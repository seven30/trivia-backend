class CreateGameHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :game_histories do |t|
      t.string :game_mode
      t.integer :correct_answers
      t.integer :total_questions

      t.timestamps
    end
  end
end
