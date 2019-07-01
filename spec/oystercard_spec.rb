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

  describe "#deduct" do
    it "it deducts a given amount from the current balance" do
      subject.top_up(20)
      subject.deduct(2)
      expect(subject.balance).to eq(18)
    end
  end

  describe "#touch_in" do
    it "returns the in use status of the oystercard" do
      expect(subject.touch_in).to eq true
    end
  end

  describe "#touch_out" do
    it "returns not in use status of the oystercard" do
      expect(subject.touch_out).to eq false
    end
  end

  describe "#in_journey?" do
    it "returns the oyestercard is in use" do
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end

    it "returns the oystercard is not in use" do
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
  end
end
