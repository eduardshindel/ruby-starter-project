require './lib/program'

RSpec.describe Temperature do
  temp = Temperature.new
  describe 'Creating' do
    it 'Initialize from' do
      test = 'C'
      temp.from = 'C'
      temp.from == test
    end

    it 'Initialize to' do
      test = 'F'
      temp.to = 'F'
      temp.to == test
    end

    it 'Initialize t1' do
      test = 0.0
      temp.t1 = 0.0
      temp.t1 == test
    end

    it 'Initialize t2' do
      test = 23.2
      temp.t2 = 23.2
      temp.t2 == test
    end
  end

  describe '#correct_scale?' do
    context 'Correct scale (C)' do
      subject { Temperature.new.correct_scale?('C') }
      it { is_expected.to eq true }
    end

    context 'Incorrect scale (D)' do
      subject { Temperature.new.correct_scale?('D') }
      it { is_expected.to eq false }
    end
  end

  describe '#number?' do
    context 'Correct value (30)' do
      subject { Temperature.new.number?('30') }
      it { is_expected.to eq true }
    end

    context 'Incorrect value (30o5)' do
      subject { Temperature.new.number?('30o5') }
      it { is_expected.to eq false }
    end
  end

  describe '#convert!' do
    it 'Check' do
      test = 32.0
      temp.from = 'C'
      temp.to = 'F'
      temp.t1 = 0.0
      expect(temp.convert!).to eq test
    end
  end

  describe '#input_from!' do
    it 'Correct from (F)' do
      allow(Terminal).to receive(:gets).and_return("F\n")
      expect(temp.input_from!).to eq 'F'
    end
  end

  describe '#input_to!' do
    it 'Correct to (F)' do
      allow(Terminal).to receive(:gets).and_return("C\n")
      expect(temp.input_to!).to eq 'C'
    end
  end

  describe '#input_value!' do
    it 'Correct value (150)' do
      allow(Terminal).to receive(:gets).and_return("150\n")
      expect(temp.input_value!).to eq 150
    end
  end
end
