require 'oystercard'

describe Oystercard do

  describe "#balance" do
    it "Set balance to 0 on initialize" do
      expect(subject.balance).to eq 0
    end
  end
end
