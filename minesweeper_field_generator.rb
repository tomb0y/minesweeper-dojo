class MinesweeperFieldGenerator
  def initialize(input)
    @input = input
  end

  def field_with_bombs
    @input.lines[1..-1].map { |l| l.strip.chars }
  end

  def fields
    field_with_bombs.map do |line|
      line.map do |ch|
        ch == '.' ? '0' : ch
      end
    end
  end
end
