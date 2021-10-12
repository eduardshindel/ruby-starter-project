class Temperature
  attr_accessor :from, :to, :t1, :t2

  def initialize
    @from = input_from!
    @to = input_to!
    @t1 = input_value!
  end

  def input_from!
    Terminal.write 'Please enter from which scale do you want to translate (F, K, C)?'
    input = Terminal.read
    until correct_scale? input
      Terminal.clear
      Terminal.write 'Please enter only F, K or C'
      input = Terminal.read
    end
    input
  end

  def input_to!
    Terminal.write 'Please enter which scale do you want to convert (F, K, C)?'
    input = Terminal.read
    until correct_scale?(input) && input != @from
      Terminal.clear
      Terminal.write 'Please enter only F, K or C'
      input = Terminal.read
    end
    input
  end

  def input_value!
    Terminal.write 'Enter the temperature'
    input = Terminal.read
    until float?(input)
      Terminal.clear
      Terminal.write 'Please enter the correct temperature'
      input = Terminal.read
    end
    input.to_f
  end

  def correct_scale?(suspect)
    %w[F K C].include? suspect
  end

  def float?(suspect)
    Float suspect
  rescue StandardError
    false
  end

  def convert!
    temp = TemperatureTransfer.new
    temp.t = @t1

    case @from
    when 'C'
      @t2 = temp.from_c_to_f!
    when 'F'
      @t2 = temp.from_f_to_c!
    when 'K'
      @t2 = temp.from_k_to_c!
    end
  end
end
