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
    @current_player = current_player

    puts "lets add two numbers together!"
    puts "#{@current_player.name}, choose two numbers!"
    puts "number 1:"
    num1 = gets.chomp.to_i
    puts "number 2:"
    num2 = gets.chomp.to_i
    @num_sum = num1 + num2
    puts "#{@current_player.name} asks: What is #{num1} + #{num2}"
  end

  def check_answer?(answer)
    if answer == @num_sum 
      true
    else
      false
    end
  end
end

class MathGame
  
  def initialize
    @player_1 = ""
    @player_2 = ""
    @current_player = ""
  end

  #initial game setup and preamble
  def start
    puts "\n\nLet's play a game of 'Math Game'"
    puts "PLAYER 1: enter your game name..."
    @player_1 = Player.new(gets.chomp)

    puts "PLAYER 2: enter your game name..."
    @player_2 = Player.new(gets.chomp)

    @current_player = @player_1

    puts "\n\nGet your calculators ready! \n----- #{@player_1.name} vs. #{@player_2.name} -----"
    puts "\n----- GAME START -----\n\n"

    game_loop
  end  
  
  #runs the main game loop until a player loses all their lives
  def game_loop
    loop do
      play_turn
      break unless @player_1.alive? &&@player_2.alive? #ends when player lives == 0
    end
  end

  #the logic for one full turn
  def play_turn
    puts "----- NEW TURN -----"
    question = Question.new #creates a new question object
    question.generate_question(@current_player) #question called with current player

    print "Answer: "
    answer = gets.chomp.to_i

    if question.check_answer?(answer)
      puts "CORRECT"
    else
      puts "INCORRECT"
      other_player.lose_life
    end

    puts @player_1.player_status
    puts @player_2.player_status + "\n\n"

    if !@player_1.alive? || !@player_2.alive? #runs checks winner if player lives == 0
      check_winner
    else
      switch_player #if both players are alive, switches players
    end
end

  #ternary logic for switching players
  def switch_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  #needed this to fix which character lost a life when a wrong answer was given
  def other_player
   @current_player == @player_1 ? @player_2 : @player_1
  end
  
  #i guess i don't really need this if all it does is print one line
  def next_turn
    puts "----- NEW TURN -----"
  end
  
  #simple, if a player dies, logical statements are exicuted to announce winner and run end_game
  def check_winner
    if !@player_1.alive?
      puts "#{@player_2.name} wins with #{@player_2.lives} lives left!"
      end_game
    elsif !@player_2.alive?
      puts "#{@player_1.name} wins with #{@player_1.lives} lives left!"
      end_game
    else
      next_turn #fail safe against poor logic
    end
  end

  def end_game
    puts "----- GAME OVER ----- \nGood bye"
  end
end


