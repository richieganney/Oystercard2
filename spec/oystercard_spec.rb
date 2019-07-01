require 'oystercard'

describe Oystercard do

  describe "#balance" do
    it "Set balance to 0 on initialize" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "Add money to the balance" do
      subject.top_up(20)
      expect(subject.balance).to eq 20
    end
  end
  
  describe "#top_up" do
    it "raises an error if combined balance > 90.00" do
      card = Oystercard.new
      expect { card.top_up(95) }.to raise_error("amount exceeded, balance cannot be: 95. Balance limit is 90")
    end
  end

end
