class Terminal
  def self.write(str)
    puts str
  end

  def self.read
    gets.chomp
  end

  def self.say_hello
    write 'Hello, user! The temperature converter greets you.'
  end

  def self.print_answer(from, to, temp1, temp2)
    write "#{temp1} #{from} = #{temp2.round(2)} #{to}"
  end

  def self.continiue?
    write 'Do you want to continue? (Y)'
    read == 'Y'
  end
end
