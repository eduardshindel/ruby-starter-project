class Temperature
  attr_accessor :from, :to, :t1, :t2

  def input_from!
    loop do
      Terminal.write 'Please enter from which scale do you want to convert (F, K, C)?'
      @input = Terminal.read
      break if correct_scale? @input
    end
    @from = @input
  end

  def input_to!
    loop do
      Terminal.write 'Please enter to which scale do you want to convert (F, K, C)?'
      @input = Terminal.read
      break if correct_scale?(@input) && @input != @from
    end
    @to = @input
  end

  def input_value!
    loop do
      Terminal.write 'Enter the temperature'
      @input = Terminal.read
      break if number? @input
    end
    @t1 = @input.to_f
  end

  def correct_scale?(suspect)
    %w[F K C].include? suspect
  end

  def number?(suspect)
    Float suspect
    true
  rescue StandardError
    false
  end

  def convert!
    temp = TemperatureTransfer.new
    temp.t = @t1
    temp.method = @from + @to
    @t2 = temp.choose_method
  end
end
