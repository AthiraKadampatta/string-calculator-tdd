class StringCalculator
  def self.add(numbers)
    return numbers.to_i if numbers.length == 1

    numbers.split(/,|\n/).map(&:to_i).sum
  end
end