require 'oystercard'

describe OysterCard do

  let(:station){double :station}

  describe '.balance' do
    it 'Should have a balance initialized to 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'Should add to the balance of your oyster card' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
  end

  describe '#top_up' do
    it 'Raises an error if balance exceeds 90' do
      expect { subject.top_up(100) }.to raise_error 'Top-Up Limit Reached!'
    end
  end

  describe '#touch_in' do
    it 'it confirms touch in on journey' do
      subject.top_up(20)
      expect(subject.touch_in(station)).to eq station
    end

    it 'checks there is enough balance for minimum fare' do
      expect{ subject.touch_in(station)}.to raise_error "Insufficent funds"
    end

    it 'stores the entry station' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe '#touch_out' do
    it 'confirms touch out to end journey' do
      expect(subject.touch_out(station)).to eq nil
    end

    it 'charges minimum fare for journey when touch out' do
      subject.top_up(10)
      expect{subject.touch_out(station)}.to change{subject.balance}.by(-OysterCard::MINIMUM_FARE)
    end
  end

  describe '#journey?' do
    it "confirms oystercard is in use" do
      subject.top_up(20)
      subject.touch_in(station)
      expect(subject.journey?).to eq true
    end
    it 'confirms oystercard is not in use' do
      subject.touch_out(station)
      expect(subject.journey?).to eq false
    end
  end
end
