class MinesweeperFieldGenerator
  def initialize(input)
    @input = input

    @field = field_with_bombs.dup.map do |line|
      line.map do |ch|
        ch == '*' ? '*' : 0
      end
    end
  end

  def field_with_bombs
    @input.lines[1..-1].map { |l| l.strip.chars }
  end

  def field
    @field.each_with_index do |line, i|
      line.each_with_index do |ch, j|
        next unless ch.to_s == '*'

        increase_bomb_num_for_neighbors(i, j)
      end
    end

    @field.map do |line|
      line.map(&:to_s)
    end
  end

  private

  def increase_bomb_num_for_neighbors(i, j)
    increase_bomb_num_for_upper_center_neighbor(i, j)
    increase_bomb_num_for_lower_center_neighbor(i, j)
    increase_bomb_num_for_right_neighbor(i, j)
    increase_bomb_num_for_left_neighbor(i, j)
  end

  def increase_bomb_num_for_upper_center_neighbor(i, j)
    if i > 0
      if @field[i - 1][j] != '*'
        @field[i - 1][j] += 1
      end
    end
  end

  def increase_bomb_num_for_lower_center_neighbor(i, j)
    if @field[i + 1]
      if @field[i + 1][j] != '*'
        @field[i + 1][j] += 1
      end
    end
  end

  def increase_bomb_num_for_right_neighbor(i, j)
    if @field[i][j + 1] != '*'
      @field[i][j + 1] += 1 if @field[i][j + 1]
    end
  end

  def increase_bomb_num_for_left_neighbor(i, j)
    if j > 0 && @field[i][j - 1] != '*'
      @field[i][j - 1] += 1 if @field[i][j - 1]
    end
  end
end
