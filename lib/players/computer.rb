## DELETE THE COMMENTS AT THE BOTTOM
require 'pry'

module Players

  class Computer < Player

    @positions = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    def move(board)

      position ||= go_for_victory(board)
      position ||= prevent_defeat(board)
      position ||= check_middle(board)
      position ||= check_corners(board)

      position.to_s

    end # move

=begin
    0 | 1 | 2
  -------------
    3 | 4 | 5
  -------------
    6 | 7 | 8
=end

=begin
    1 | 2 | 3
  -------------
    4 | 5 | 6
  -------------
    7 | 8 | 9
=end

    ## What would I do as a human playing tic-tac-toe?
    ## I would first try to go in the middle
    ## If the middle still isn't taken during the second turn, I will try to go there
    ## If I get the middle, I will try to take (2, 4, 6, and 8)
    ## If the middle is taken, I will look for the corners (1, 3, 7, 9)
    ## If I have a X/O in:
    ## 1 and 3 && 2 open
    ## 1 and 7 && 4 open
    ## 3 and 9 && 6 open
    ## 7 and 9 && 8 open
    ## then put is there

    ## check if there is an X/O in:
    ## 1 and 2 && 3 open
    ## 1 and 4 && 7 open
    ## 1 and 5 && 9 open
    ## 2 and 5 && 8 open
    ## 2 and 3 && 1 open
    ## 3 and 5 && 7 open
    ## 3 and 6 && 9 open
    ## 4 and 5 && 6 open
    ## 4 and 7 && 1 open
    ## 5 and 6 && 4 open
    ## 5 and 7 && 3 open
    ## 5 and 8 && 2 open
    ## 6 and 9 && 3 open
    ## 7 and 8 && 9 open
    ## 8 and 9 && 7 open

    ### If these positions have my tokens in them, then put it in the third open position
    ### Otherwise, if these positions do not have my tokens in them, then put mine in the third position to block it
    ### In both scenarios, I need to determine which of these combination scenarios are present

    ## preventing opponent from winning
    ## I need to


    def detect_winning_move(board, token_to_test)

      Game::WIN_COMBINATIONS.each do |combination|
        if board.cells[combination[0]] == token_to_test && board.cells[combination[1]] == token_to_test
          if !board.taken?(combination[2] + 1)
            (combination[2] + 1)
          else
            nil
          end # if taken?
        elsif board.cells[combination[0]] == token_to_test && board.cells[combination[2]] == token_to_test
          if !board.taken?(combination[1] + 1)
            (combination[1] + 1)
          else
            nil
          end # if taken?
        elsif board.cells[combination[1]] == token_to_test && board.cells[combination[2]] == token_to_test
          if !board.taken?(combination[0] + 1)
            (combination[0] + 1)
          else
            nil
          end # if taken?
        end # outer if
      end # do |combination|
    end # detect_winning_move

=begin
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

=end


    def go_for_victory(board)
      position = detect_winning_move(board, self.token)
      if !index.nil?
        if board.valid_move?(position.to_s)
          position
        end # if valid_move?
      end # if index is nil
    end # go_for_victory


    def opponent_token
      if self.token == 'X'
        'O'
      else
        'X'
      end # if token == 'X' or 'O'
    end # opponent_token


    def prevent_defeat(board)
      position = detect_winning_move(board, opponent_token)
      if !index.nil?
        if board.valid_move?(position.to_s)
          position
        end # if valid_move?
      end # if index is nil
    end # prevent_defeat


    def check_middle(board)
      if board.valid_move?("5")
        "5"
      end # if middle_taken
    end # check_middle


    def check_corners(board)
      if board.taken?("1") && board.taken?("3") && board.valid_move?("2")
        "2"
      elsif board.taken?("1") && board.taken?("7") && board.valid_move?("4")
        "4"
      elsif board.taken?("3") && board.taken?("9") && board.valid_move?("6")
        "6"
      elsif board.taken?("3") && board.taken?("9") && board.valid_move?("8")
        "8"
      elsif board.valid_move?("1")
        "1"
      elsif board.valid_move?("3")
        "3"
      elsif board.valid_move?("7")
        "7"
      elsif board.valid_move?("9")
        "9"
      end # if
    end # check_corners

  end # class Computer
end # module Players

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
