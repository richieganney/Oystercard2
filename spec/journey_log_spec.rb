require 'journey_log'

describe JourneyLog do
  subject(:instance_of_journey_log) { described_class.new }
    it { is_expected.to respond_to(:log_journey) }

    describe '#fare' do
      it 'calculates the correct fare according to number of zones crossed' do
        journey_log = double(:journey_log)
        journey_log = [{:entry_station_name=>"hammersmith", :entry_station_zone=>3, :exit_station_name=>"high biz", :exit_station_zone=>6}]
        expect(journey_log.fare).to eq 4      
      end
    end
end
