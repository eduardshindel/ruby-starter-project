class Terminal
  def self.say_hello
    puts 'Hello, user! The temperature converter greets you.'
  end

  def self.clear
    system 'clear'
  end

  def self.print_answer(from, to, t1, t2)
    puts "#{t1} #{from} = #{t2.round(2)} #{to}"
  end

  def self.write(str)
    puts str
  end

  def self.read
    gets.chomp
  end
end
