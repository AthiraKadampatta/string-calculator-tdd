require './lib/string_calculator.rb'

describe StringCalculator do
  describe 'add' do
    context 'for an empty string' do
      it 'returns 0' do
        expect(add('')).to eq 0
      end
    end
  end
end