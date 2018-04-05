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


  def index(position)
    cells[position.to_i - 1]
  end # position


  def full?
    true if cells.all?{|pos| pos == "X" || pos == "O"}
  end # full?


  def turn_count
    count = 0
    cells.each {|pos| count += 1 if pos == "X" || pos == "O"}
    count
  end # turn_count


  def taken?(position)
    if position(position) == "X" || position(position) == "O"
      true
    else
      false
    end # if
  end # taken?


  def valid_move?(position)
    index = position.to_i - 1
    true if (0 <= index && index <= 8) && taken?(position) == false
  end # valid_move?


  def update(position, player)
    if valid_move?(position) == true
      cells[position.to_i - 1] = player.token
    end # if - valid_move?
  end # update

end # class Board
