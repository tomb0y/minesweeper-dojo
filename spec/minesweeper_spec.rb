require_relative '../minesweeper_field_generator'

RSpec.describe MinesweeperFieldGenerator do
  let(:subject) { MinesweeperFieldGenerator.new(input) }

  describe '#field_with_bombs' do
    context 'with a small field' do
      let(:input) do
        <<~INPUT
          2 2
          *.
          ..
        INPUT
      end

      it 'parses the input into a 2 dimensional array' do
        expect(subject.field_with_bombs).to eq([['*', '.'],
                                                ['.', '.']])
      end
    end

    context 'with a bigger field' do
      let(:input) do
        <<~INPUT
          4 4
          *...
          ....
          .*..
          ....
        INPUT
      end

      it 'parses the input into a 2 dimensional array' do
        expect(subject.field_with_bombs).to eq([['*', '.', '.', '.'],
                                                ['.', '.', '.', '.'],
                                                ['.', '*', '.', '.'],
                                                ['.', '.', '.', '.']])
      end
    end
  end

  context '1x1 field' do
    context 'with a bomb' do
      let(:input) do
        <<~INPUT
          1 1
          *
        INPUT
      end

      it 'generates the correct field' do
        expect(subject.field).to eq([['*']])
      end
    end

    context 'without a bomb' do
      let(:input) do
        <<~INPUT
          1 1
          .
        INPUT
      end

      it 'generates the correct field' do
        expect(subject.field).to eq([['0']])
      end
    end
  end

  context '2x2 field' do
    context 'with diagonal bombs' do
      let(:input) do
        <<~INPUT
          2 2
          .*
          *.
        INPUT
      end

      it 'generates the correct field' do
        expect(subject.field).to eq([['2', '*'],
                                     ['*', '2']])
      end
    end

    context 'with one bomb' do
      let(:input) do
        <<~INPUT
          2 2
          *.
          ..
        INPUT
      end

      it 'generates the correct field' do
        expect(subject.field).to eq([['*', '1'],
                                     ['1', '1']])
      end
    end
  end
end
