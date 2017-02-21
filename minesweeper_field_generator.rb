class MinesweeperFieldGenerator
  def initialize(input)
    @input = input
  end

  def field_with_bombs
    @input.lines[1..-1].map { |l| l.strip.chars }
  end

  def field
    field = field_with_bombs.dup.map do |line|
      line.map do |ch|
        ch == '*' ? '*' : 0
      end
    end

    field.each_with_index do |line, i|
      line.each_with_index do |ch, j|
        next unless ch.to_s == '*'

        if i > 0
          if field[i - 1][j] != '*'
            field[i - 1][j] += 1
          end
        end

        if field[i + 1]
          if field[i + 1][j] != '*'
            field[i + 1][j] += 1
          end
        end

        if j > 0 && field[i][j - 1] != '*'
          field[i][j - 1] += 1 if field[i][j - 1]
        end

        if field[i][j + 1] != '*'
          field[i][j + 1] += 1 if field[i][j + 1]
        end
      end
    end

    field.map do |line|
      line.map(&:to_s)
    end
  end
end
