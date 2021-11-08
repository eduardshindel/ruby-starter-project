require_relative './temperature'
require_relative './temperature_transfer'
require_relative './terminal'

class Program
  def run
    Terminal.say_hello
    loop do
      temp = Temperature.new
      temp.input_from!
      temp.input_to!
      temp.input_value!
      temp.convert!
      Terminal.print_answer temp.from, temp.to, temp.t1, temp.t2
      break unless Terminal.continiue?
    end
  end
end
