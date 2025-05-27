require_relative 'math_game'

game = MathGame.new
game.start

#player 
  #attributes
    #name
    #lives
  #methods
    #lose_life
    #alive?^^^
    #initialize

#question 
  #attributes
    #num1
    #num2
    #answer
  #methods
   #generate_question
   #check_answer?

#math_game
  #attributes
    #players
    #current_player
  #methods
    #start
    #next_turn
    #check_winner
    #switch_player
    #game_over?

# 1. Player 1 gets a question
# 2. They answer
# 3. If correct: output “Correct!”
# 4. If wrong: output “Very WRONG!”, lose 1 life
# 5. Check if either player is out of lives
# 6. Switch players
# 7. Repeat