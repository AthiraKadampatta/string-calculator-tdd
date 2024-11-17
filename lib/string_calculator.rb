class StringCalculator
  def self.add(number_string)
    delimiter, numbers = extract_delimiter_and_numbers(number_string)

    numbers_arr = number_array(numbers, delimiter)
    check_for_negatives(numbers_arr)
    
    if delimiter == '*'
      numbers_arr.inject(&:*)
    else
      numbers_arr.sum
    end
  end

  private

  def self.extract_delimiter_and_numbers(number_string)
    delimiter_regex = %r{^//(\S+)\n(.+)$}

    match = number_string.match(delimiter_regex)

    return [/,|\n/, number_string] if match.nil?

    [match[1], match[2]]
  end

  def self.check_for_negatives(num_arr)
    negatives = num_arr.select(&:negative?)
    unless negatives.empty?
      raise "negative numbers not allowed <#{negatives.join(",")}>"
    end
  end

  def self.number_array(numbers, delimiter)
    numbers.split(delimiter).map(&:to_i)
  end
end