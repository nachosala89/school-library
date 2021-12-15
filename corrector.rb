class Corrector
  def correct_name(input)
    if (input =~ /^[A-Z]/).nil?
      input = input.chars
      input.first.upcase!
      input = input.join
    end
    input = input [0, 10] if input.length > 10
    input
  end
end
