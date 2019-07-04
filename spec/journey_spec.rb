require 'journey'

describe Journey do

  describe "#start_journey" do
    it "commences a journey" do
      expect(subject.start_journey).to eq true
    end
  end

  describe "#end_journey" do
    it "ends a journey" do
      expect(subject.end_journey).to eq false
    end
  end

  describe "#journey_complete?" do
    it "returns whether or not a journey is complete" do
      subject.end_journey
      expect(subject.journey_complete?).to eq true
    end
  end

  describe "#fare" do
    it "gives the mimmum fare" do
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end
  end

  describe "#penalty_fare" do
    it "calculates the penalty given if user touches in or out twice in a row" do
      expect(subject.penalty_fare).to eq Journey::PENALTY_FARE 
    end
  end
end
