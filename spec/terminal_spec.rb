require './lib/terminal'

RSpec.describe Terminal do
  describe '#write' do
    it 'write "hello"' do
      expect do
        Terminal.write 'hello'
      end.to output('hello
').to_stdout
    end
  end

  describe '#read' do
    it 'print "hello"' do
      allow(Terminal).to receive(:gets).and_return("Hello\n")
      expect(Terminal.read).to eq 'Hello'
    end
  end

  describe '#say_hello' do
    it 'Terminal.say_hello' do
      expect do
        Terminal.say_hello
      end.to output('Hello, user! The temperature converter greets you.
').to_stdout
    end
  end

  describe '#print_answer' do
    it 'print "0C = 32F"' do
      expect do
        Terminal.print_answer 'C', 'F', 0, 32
      end.to output('0 C = 32 F
').to_stdout
    end
  end

  describe 'continiue?' do
    it 'Enter "Y"' do
      allow(Terminal).to receive(:gets).and_return("Y\n")
      expect(Terminal.continiue?).to eq true
    end

    it 'Enter not "Y"' do
      allow(Terminal).to receive(:gets).and_return("N\n")
      expect(Terminal.continiue?).to eq false
    end
  end
end
