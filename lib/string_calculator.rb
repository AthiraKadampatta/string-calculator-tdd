class StringCalculator
  def self.add(numbers)
    return numbers.to_i if numbers.length == 1

    numbers.split(',').map(&:to_i).sum
  end
end