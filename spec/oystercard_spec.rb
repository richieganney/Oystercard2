require 'oystercard'

describe OysterCard do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  describe '.journeys' do
    it "starts with an empty list" do
      expect(subject.journeys).to be_empty
    end
  end

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
      expect(subject.touch_in(entry_station)).to eq entry_station
    end

    it 'checks there is enough balance for minimum fare' do
      expect{ subject.touch_in(entry_station)}.to raise_error "Insufficent funds"
    end
  end

  describe '#touch_out' do
    it 'confirms touch out to end journey' do
      allow(entry_station).to receive(:name) {"Victoria"}
      allow(entry_station).to receive(:zone) {1}
      allow(exit_station).to receive(:name) {"Victoria"}
      allow(exit_station).to receive(:zone) {1}
      expect(subject.touch_out(entry_station, exit_station)).to eq nil
    end

    it 'charges minimum fare for journey when touch out' do
      subject.top_up(10)
      allow(entry_station).to receive(:name) {"Victoria"}
      allow(entry_station).to receive(:zone) {1}
      allow(exit_station).to receive(:name) {"Victoria"}
      allow(exit_station).to receive(:zone) {1}
      expect{subject.touch_out(entry_station, exit_station)}.to change{subject.balance}.by(-OysterCard::MINIMUM_FARE)
    end

    it "stores the journey's entry and exits stations" do
      allow(entry_station).to receive(:name) {"Victoria"}
      allow(entry_station).to receive(:zone) {1}
      allow(exit_station).to receive(:name) {"Aldgate"}
      allow(exit_station).to receive(:zone) {2}
      subject.top_up(20)
      subject.touch_in(entry_station)
      subject.touch_out(entry_station, exit_station)
      expect(subject.journeys).to eq [{:entry_station_name=>"Victoria", :entry_station_zone=>1, :exit_station_name=>"Aldgate", :exit_station_zone=>2}]
    end
  end

  describe '#journey?' do
    it "confirms oystercard is in use" do
      subject.top_up(20)
      subject.touch_in(exit_station)
      expect(subject.journey?).to eq true
    end
    it 'confirms oystercard is not in use' do
      allow(entry_station).to receive(:name) {"Victoria"}
      allow(entry_station).to receive(:zone) {1}
      allow(exit_station).to receive(:name) {"Aldgate"}
      allow(exit_station).to receive(:zone) {2}
      subject.touch_out(entry_station, exit_station)
      expect(subject.journey?).to eq false
    end
  end
end
