class Board

  attr_accessor :cells


  def initialize
    self.cells ||= Array.new(9, " ")
  end # initialize


  def display

    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "

  end # board


  def reset!
    self.cells = Array.new(9, " ")
  end # reset!


  def position(user_input)
    cells[user_input.to_i - 1]
  end # position


  def full?
    true if cells.all?{|pos| pos == "X" || pos == "O"}
  end # full?


  def turn_count
    count = 0
    cells.each {|pos| count += 1 if pos == "X" || pos == "O"}
    count
  end # turn_count


  def taken?(user_input)
    position(user_input) == "X" || position(user_input) == "O" ? true : false
  end # taken?


  def valid_move?(user_input)
    index = user_input.to_i - 1
    true if (0 <= index && index <= 8) && taken?(user_input) == false
  end # valid_move?


  def update(user_input, player)
    if valid_move?(user_input) == true
      cells[user_input.to_i - 1] = player.token
    end # if - valid_move?
  end # update

end # class Board
