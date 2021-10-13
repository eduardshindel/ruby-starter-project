require_relative './temperature'
require_relative './temperature_transfer'
require_relative './terminal'

class Program
  def run
    Terminal.say_hello
    loop do
      temp = Temperature.new
      temp.convert!
      Terminal.print_answer temp.from, temp.to, temp.t1, temp.t2
      break unless Terminal.continiue?

      Terminal.clear
    end
    Terminal.clear
  end
end
