require 'pry'

class TicTacToe_CLI


  def initialize
    intro_logo
    start
  end # initialize


  def intro_logo
    puts "   ____________     ____________     ____________   "
    puts "  |____    ____|   |____    ____|   |____    ____|  "
    puts "       |  |             |  |             |  |       "
    puts "       |  |             |  |             |  |       "
    puts "       |  |             |  |             |  |       "
    puts "       |  |             |  |             |  |       "
    puts "       |__|      o      |__|       o     |__|       "
  end # intro_logo


  def start

    puts "                                                    "
    puts "               WELCOME TO TIC-TAC-TOE!              "

    puts "Choose how many players will be playing the game (0, 1, or 2):"
    puts "Type 'exit' to EXIT"

    user_input = gets.strip.downcase

      case user_input
      when '0'
        zero_players
        play_again?
      when '1'
        one_player
        play_again?
      when '2'
        two_players
        play_again?
      when 'exit'
        abort("You Exited the Game")
      else
        puts "Invalid entry. The choices are 0, 1, 2, or exit!"
        start
      end # case start
  end # start


  def play_again?

    play_again = ''
    puts ""
    puts "Would you like to play again."
    puts "Type 'y' or 'yes' to play again."
    puts "OR"
    puts "Type 'n' or 'no' to exit"
    play_again = gets.strip.downcase

    case play_again
    when 'y', 'yes'
      start
    when 'n', 'no'
      abort("You Exited the Game")
    else
      puts "Invalid choice!"
      play_again?
    end # case play_again

  end # play_again method

  def go_first?

    puts "Do you want to go first and be X?"
    puts "Type 'y' or 'yes' for YES"
    puts "Type 'n' or 'no' for NO"
    input = gets.strip.downcase

    case input
    when 'y', 'yes'
      true
    when 'n', 'no'
      false
    else
      go_first?
    end

  end # go_first


  ## The computer plays itself
  def zero_players
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))

    puts "To have the computer play itself 100 times, type 'wargames'."
    puts "Type anything else to have it play itself only once"
    user_input = gets.strip

    if user_input.downcase == "wargames"
      100.times{game.play}
    else
      until game.over?
        game.play
      end # until over?
    end # if wargames
  end # zero_players


  ## The player's opponent is a computer
  def one_player

    if go_first? == true
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
      game.play

    else
      game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
      game.play
    end # inner if
  end # one_player


  ## Two human players vs. one another
  def two_players

    if go_first? == true
      game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
      game.play

    else
      game = Game.new(Players::Human.new("O"), Players::Human.new("X"))
      game.play
    end # inner if
  end # two_players

  end # class TicTacToe_CLI


=begin

  until user_input.downcase == 'exit' || user_input == '0' || user_input == '1' || user_input == '2'
    puts "Choose how many players will be playing the game (0, 1, or 2):"
    puts "Type 'exit' to EXIT"
    user_input = gets.strip

    if user_input == '0'
      zero_players

    elsif user_input == '1'
      one_player

    elsif user_input == '2'
      two_players

    elsif user_input.downcase == 'exit'
      abort("You Exited the Game.")
    end # outer-if
  end # until

end # start method


## The computer plays itself
def zero_players
  game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))

  puts "To have the computer play itself 100 times, type 'wargames'."
  puts "Otherwise it will play itself only once"
  user_input = gets.strip

  if user_input.downcase == "wargames"
    100.times{game.play}
  else
    game.play
  end # if wargames

end # zero_players


## The player's opponent is a computer
def one_player
  puts "Do you want to go first and be X (y/n  or  yes/no)?"
  user_answer = gets.strip

  if user_answer.downcase == 'y' || user_answer.downcase == 'yes'
    game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
    game.play

  elsif user_answer.downcase == 'n' || user_answer.downcase == 'no'
    game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
    game.play
  end # inner if
end # one_player


## Two human players vs. one another
def two_players
  puts "Do you want to go first and be X (y/n)?"
  user_answer = gets.strip

  if user_answer.downcase == 'y' || user_answer.downcase == 'yes'
    game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
    game.play

  elsif user_answer.downcase == 'n' || user_answer.downcase == 'no'
    game = Game.new(Players::Human.new("O"), Players::Human.new("X"))
    game.play
  end # inner if
end # two_players



PLAY AGAIN

until play_again.downcase == 'n' || play_again.downcase == 'no'
  puts "Would you like to play again?"
  play_again = gets.strip

  if play_again.downcase == 'y' || play_again.downcase == 'yes'
    start
  else
    abort("You Exited the Game.")
  end #
end # until

=end
