class Tile
  attr_accessor :given, :val

  def initialize(val, given)
    @val = val
    if val == "0"
      @given = false
    else
      @given = true
    end
  end

  def to_s
    @val.to_s
  end

end

class Board

  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def self.from_file
    sudoku_array = []
    File.open("puzzles/sudoku1-almost.txt") do |f|
      f.each_line do |line|
        sudoku_array << line.chomp.split("").to_a
      end
    end

    size = sudoku_array.length
    tile_array = Array.new(size) {Array.new(size)}
    tile_array.length.times do |row|
      i = 0
      while i < size
        given = nil
        if sudoku_array[row][i] == "0"
          given = false
        else
          given = true
        end
        temp_tile = Tile.new(sudoku_array[row][i], given)
        tile_array[row][i] = temp_tile
        i += 1
      end
    end

    return Board.new(tile_array)
  end

  def update(row, col, value)
    @grid[row][column] = value
  end


    def render
      @grid.each_with_index do |row, index1|
        row_string = ""
        @grid.each_with_index do |card, index2|
          if @grid[index1][index2].given == true
            row_string += (@grid[index1][index2].val + " ")
          else
            row_string += "0 "
          end
        end
        puts row_string
      end
      puts " "
    end

    def solved?
      # row check
      @grid.each do |row|
        return false if row_solved(row) == false
      end

      # column check
      col = []
      c = 0
      i = 0
      while c < @grid.count
        while i < @grid.count
          col << @grid[i][c]
          i+=1
        end
        return false if col_solved(col) == false
        c += 1
      end

      # 3x3 check
      temp_array = []
      @grid.each do |row|
        temp_array = row.each_slice(3)
      end
      true
    end

    def row_solved(row)
        row.sort == (1..9).to_a
    end

    def col_solved(col)
      col.sort == (1..9).to_a
    end

end

class Game
  def initialize

  end

end


a = Board.from_file
a.render

# File.open("/puzzles/sudoku1-almost.txt")
# File.open("~/puzzles/sudoku1-almost.txt")
# File.open("../puzzles/sudoku1-almost.txt")
# File.open("./puzzles/sudoku1-almost.txt")
# File.open("puzzles/sudoku1-almost.txt")
