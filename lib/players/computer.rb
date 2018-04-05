## DELETE THE COMMENTS AT THE BOTTOM
require 'pry'

module Players

  class Computer < Player


    def move(board)
    #1. Make winning move
    location = make_winning_move(board)

    #2. Block winning move
    location = block_winning_move(board) if location.nil?

    #3. Center
    location = choose_center(board) if location.nil?

    #4. Opposite corner
    location = choose_opposite_corner(board) if location.nil?

    #5. Empty corner
    location = choose_empty_corner(board) if location.nil?

    #6. Random move
    location = make_random_move(board) if location.nil?

    location.to_s
    end

    def make_winning_move(board)
    detect_winning_move(board, self.token)
    end

    def block_winning_move(board)
    self.token == "X" ? opponent_token = "O" : opponent_token = "X"
    detect_winning_move(board, opponent_token)
    end

    def detect_winning_move(board, token_to_test)
    winning_combo = []
    i = 0

    #if two of the three spaces for the winning combo matches, then you're one away from winning
    Game::WIN_COMBINATIONS.each do |combo|
      if winning_combo.empty?
        i += 1 if board.cells[combo[0]] == token_to_test
        i += 1 if board.cells[combo[1]] == token_to_test
        i += 1 if board.cells[combo[2]] == token_to_test
        if i == 2 && combo.any? { |combo_num| !board.taken?(combo_num + 1) } #make sure there's one space open, not O-O-X or X-X-O
          winning_combo = combo
        else
          i = 0
        end
      end
    end

    if !winning_combo.empty?
      final = winning_combo.detect { |combo_num| !board.taken?(combo_num + 1) } #+1 to adjust for user input offset
      final + 1 #to adjust for user input offset
    else
      nil
    end
    end

    def choose_center(board)
    5 if !board.taken?(5)
    end

    def choose_opposite_corner(board)
    if board.taken?(1) && !board.taken?(9)
      9
    elsif board.taken?(3) && !board.taken?(7)
      7
    elsif board.taken?(7) && !board.taken?(3)
      3
    elsif board.taken?(9) && !board.taken?(1)
      1
    end
    end

    def choose_empty_corner(board)
    [1,3,7,9].shuffle.detect { |corner| !board.taken?(corner) }
    end

    def make_random_move(board)
    [*1..9].shuffle.detect{ |num| !board.taken?(num) } # * splat operator expands range into array , so it becomes [1,2,3, etc..]
    end

  end # class Computer
end # module Players

=end

=begin
    def check_all(board)
      if board.taken?("1") && board.taken?("2") && board.valid_move?("3")
        "3"
      elsif board.taken?("1") && board.taken?("4") && board.valid_move?("7")
        "7"
      elsif board.taken?("1") && board.taken?("5") && board.valid_move?("9")
        "9"
      elsif board.taken?("2") && board.taken?("5") && board.valid_move?("8")
        "8"
      elsif board.taken?("2") && board.taken?("3") && board.valid_move?("1")
          "1" ##
      elsif board.taken?("3") && board.taken?("5") && board.valid_move?("7")
        "7" ##
      elsif board.taken?("3") && board.taken?("6") && board.valid_move?("9")
        "9"
      elsif board.taken?("4") && board.taken?("5") && board.valid_move?("6")
        "6"
      elsif board.taken?("4") && board.taken?("7") && board.valid_move?("1")
        "1"
      elsif board.taken?("5") && board.taken?("6") && board.valid_move?("4")
        "4"
      elsif board.taken?("5") && board.taken?("7") && board.valid_move?("3")
        "3"
      elsif board.taken?("5") && board.taken?("8") && board.valid_move?("2")
        "2"
      elsif board.taken?("6") && board.taken?("9") && board.valid_move?("3")
        "3"
      elsif board.taken?("7") && board.taken?("8") && board.valid_move?("9")
        "9"
      elsif board.taken?("8") && board.taken?("9") && board.valid_move?("7")
        "7"
      end # if checking all
    end # check_all

=end







## FOLLOW THE TRACKS DOWN TO DELETE
##
##
##
##
##
##
##
##
##
##
##
##
##
##
##
##
##
##
##
##
##
##
##
##
##
##
#######################
## DELETE
#######################

=begin
    def move(board)
    #1. Make winning move
    location = make_winning_move(board)

    #2. Block winning move
    location = block_winning_move(board) if location.nil?

    #3. Center
    location = choose_center(board) if location.nil?

    #4. Opposite corner
    location = choose_opposite_corner(board) if location.nil?

    #5. Empty corner
    location = choose_empty_corner(board) if location.nil?

    #6. Random move
    location = make_random_move(board) if location.nil?

    location.to_s
    end

  def make_winning_move(board)
    detect_winning_move(board, self.token)
  end

  def block_winning_move(board)
    self.token == "X" ? opponent_token = "O" : opponent_token = "X"
    detect_winning_move(board, opponent_token)
  end

  def detect_winning_move(board, token_to_test)
    winning_combo = []
    i = 0

    #if two of the three spaces for the winning combo matches, then you're one away from winning
    Game::WIN_COMBINATIONS.each do |combo|
      if winning_combo.empty?
        i += 1 if board.cells[combo[0]] == token_to_test
        i += 1 if board.cells[combo[1]] == token_to_test
        i += 1 if board.cells[combo[2]] == token_to_test
        if i == 2 && combo.any? { |combo_num| !board.taken?(combo_num + 1) } #make sure there's one space open, not O-O-X or X-X-O
          winning_combo = combo
        else
          i = 0
        end
      end
    end

    if !winning_combo.empty?
      final = winning_combo.detect { |combo_num| !board.taken?(combo_num + 1) } #+1 to adjust for user input offset
      final + 1 #to adjust for user input offset
    else
      nil
    end
  end

  def choose_center(board)
    5 if !board.taken?(5)
  end

  def choose_opposite_corner(board)
    if board.taken?(1) && !board.taken?(9)
      9
    elsif board.taken?(3) && !board.taken?(7)
      7
    elsif board.taken?(7) && !board.taken?(3)
      3
    elsif board.taken?(9) && !board.taken?(1)
      1
    end
  end

  def choose_empty_corner(board)
    [1,3,7,9].shuffle.detect { |corner| !board.taken?(corner) }
  end

  def make_random_move(board)
    [*1..9].shuffle.detect{ |num| !board.taken?(num) } # * splat operator expands range into array , so it becomes [1,2,3, etc..]
  end
=end
