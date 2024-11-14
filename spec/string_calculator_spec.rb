require './lib/string_calculator.rb'

describe StringCalculator do
  describe '.add' do
    context 'for an empty string' do
      it 'returns 0' do
        expect(StringCalculator.add('')).to eq 0
      end
    end

    context 'for a string with a single digit' do
      it 'returns the digit as it is' do
        expect(StringCalculator.add('1')).to eq 1
      end
    end

    context 'for a string with two numbers separated by comma' do
      it 'returns the sum of the two numbers' do
        expect(StringCalculator.add('1,5')).to eq 6
      end
    end
  end
end