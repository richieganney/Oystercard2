require 'oystercard'

describe Oystercard do

  describe "#balance" do
    it "Set balance to 0 on initialize" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "Add money to the balance" do
      subject.top_up(20.00)
      expect(subject.balance).to eq 20.00
    end
  end
end
