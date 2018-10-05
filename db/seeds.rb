# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email:'user1@example.com', password:'password1', username:'user1')

user2 = User.create(email:'user2@example.com', password:'password2', username:'user2')

GameHistory.create(game_mode:'classic', correct_answers:9, total_questions: 10, user_id:user1.id)

GameHistory.create(game_mode:'classic', correct_answers:2, total_questions: 10, user_id:user2.id)

GameHistory.create(game_mode:'classic', correct_answers:8, total_questions: 10, user_id:user2.id)
