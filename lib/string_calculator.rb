class StringCalculator
  def self.add(number_string)
    delimiter, numbers = extract_delimiter_and_numbers(number_string)

    numbers_arr = number_array(numbers, delimiter)
    check_for_negatives(numbers_arr)
    
    calculate_result(numbers_arr, delimiter)
  end

  private

  DELIMITER_REGEX = %r{^//(\S+)\n(.+)$}
  DEFAULT_DELIMITER = /,|\n/

  def self.extract_delimiter_and_numbers(number_string)
    match = number_string.match(DELIMITER_REGEX)

    return [DEFAULT_DELIMITER, number_string] if match.nil?

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

  def self.calculate_result(numbers_arr, delimiter)
    if delimiter == '*'
      numbers_arr.inject(&:*)
    else
      numbers_arr.sum
    end
  end
end