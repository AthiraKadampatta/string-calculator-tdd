class StringCalculator
  def self.add(number_string)
    delimiter, numbers = extract_delimiter_and_numbers(number_string)
    return numbers.to_i if numbers.length == 1

    numbers.split(delimiter).map(&:to_i).sum
  end

  private

  def self.extract_delimiter_and_numbers(number_string)
    delimiter_regex = %r{^//(\S+)\n(.+)$}

    match = number_string.match(delimiter_regex)

    return [/,|\n/, number_string] if match.nil?

    [match[1], match[2]]
  end
end