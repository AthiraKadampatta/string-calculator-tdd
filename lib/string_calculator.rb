class StringCalculator
  def self.add(number_string)
    delimiter, numbers = extract_delimiter_and_numbers(number_string)

    check_for_negatives(numbers, delimiter)
    number_array(numbers, delimiter).sum
  end

  private

  def self.extract_delimiter_and_numbers(number_string)
    delimiter_regex = %r{^//(\S+)\n(.+)$}

    match = number_string.match(delimiter_regex)

    return [/,|\n/, number_string] if match.nil?

    [match[1], match[2]]
  end

  def self.check_for_negatives(numbers, delimiter)
    num_arr = number_array(numbers, delimiter)
    num_arr.each do |num|
      if num < 0
        raise "negative numbers not allowed <#{extract_negatives(num_arr)}>"
        return
      end
    end
  end

  def self.extract_negatives(num_arr)
    num_arr.select { |n| n < 0 }.join(",")
  end

  def self.number_array(numbers, delimiter)
    numbers.split(delimiter).map(&:to_i)
  end
end