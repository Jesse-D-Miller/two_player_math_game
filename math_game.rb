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

class Player
  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose_life
    @lives -= 1
  end

  def alive?
    @lives > 0
  end

  def player_status
    "#{@name} has #{@lives}/3 lives left."
  end
end

class Question

  def generate_question(current_player)
    #validate inputs
    puts "lets add two numbers together!"
    puts "#{current_player} choose two numbers!"
    puts "number 1:"
    num1 = gets.chomp.to_i
    puts "number 2:"
    num2 = gets.chomp.to_i
    @num_sum = num1 + num2
    return question = "#{current_player}: What is #{num1} + #{num2}"
  end

  def check_answer?(answer)
    if answer == num_sum 
      "CORRECT"
      return true
    else
      "Very WRONG!"
      return false
  end
end

class Math_game
  @player_1 = Player.new(gets.chomp)
  @player_2 = Player.new(gets.chomp)
  
  def initialize
    @player_1 = "player_1"
    @player_2 = "player_2"
    @current_player = @player_1
  end

  def start
    puts "lets play a game of 'Math Game'"
    puts "PLAYER 1: enter your game name..."
    @player_1 = gets.chomp
    puts "PLAYER 2: enter your game name..."
    @player_2 = gets.chomp
    puts "Get your calculators ready! \n #{@player_1} vs. #{@player_2}"
  end  

  def switch_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end
  
  def next_turn
    puts "----- NEW TURN -----"
  end
  
  def check_winner
    if !@player_1.alive?
      puts "#{@player_2.name} wins with #{@player_2.lives} lives left!"
      end_game
    elsif !@player_2.alive?
      puts "#{@player_1.name} wins with #{@player_1.lives} lives left!"
      end_game
    else
      next_turn
    end
  end

  def end_game
    puts "----- GAME OVER ----- \n Good bye"
  end
end


