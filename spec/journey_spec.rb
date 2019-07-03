require 'journey'

describe Journey do

let(:oystercard) { double :oystercard }
let(:entry_station) { double :entry_station }
let(:exit_station) { double :exit_station }
#let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  describe '#touch_in' do
    it 'it confirms touch in on journey' do
      oystercard.top_up(20)
      expect(subject.touch_in(entry_station)).to eq entry_station
    end

    it 'checks there is enough balance for minimum fare' do
      expect{ subject.touch_in(entry_station)}.to raise_error "Insufficent funds"
    end
  end

end
