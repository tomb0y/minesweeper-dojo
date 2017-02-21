require_relative '../minesweeper_field_generator'

RSpec.describe MinesweeperFieldGenerator do
  context 'on a 1x1 field' do
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

    context 'with a bomb' do
      let(:input) do
        <<~INPUT
          1 1
          *
        INPUT
      end

      it 'generates one field' do
        expect(subject.fields.length).to eq(1)
      end

      it 'generates the correct field' do
        expect(subject.fields).to eq([['*']])
      end
    end

    context 'without a bomb' do
      let(:input) do
        <<~INPUT
          1 1
          .
        INPUT
      end

      it 'generates one field' do
        expect(subject.fields.length).to eq(1)
      end

      it 'generates the correct field' do
        expect(subject.fields).to eq([['0']])
      end
    end
  end
end
