require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2, :position

=begin
    0 | 1 | 2
  -------------
    3 | 4 | 5
  -------------
    6 | 7 | 8
=end


  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [2, 5, 8],
    [1, 4, 7],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end # initialize


  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end # if_board.turn_count
  end # current_player


  ## Checks to see if the game is over
  def over?
    if won? || draw?
      true
    end # over?
  end # over?




  def won?

    WIN_COMBINATIONS.detect do |combination|
      if combination.all? {|index| board.cells[index] == player_1.token}
        combination
      elsif combination.all? {|index| board.cells[index] == player_2.token}
        combination
      else
        false
      end # if combination.all?
    end # WIN_COMBINATIONS.any?
  end # won?



  def draw?
    true if board.full? && !won?
  end # draw?


  def winner
    ## returns the first player token of the winning combination
    board.cells[winning_combination.first] if winning_combination = won?
  end # winner


  ## recursively call this function until it received a valid entry
  def turn
    player = current_player
    puts "Player #{player.token}'s turn!'"
    puts "\n"
    user_input = current_player.move(board)

    if !board.valid_move?(user_input)
      puts "Invalid Move!"
      board.display
      turn
    else
      board.update(user_input, player)
      board.display
    end # if valid_move?

  end # turn


  def play

    until over?
      turn
    end # until

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end # if
  end # play

end # class Game
