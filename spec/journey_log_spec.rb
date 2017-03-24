require 'journey_log'

describe JourneyLog do
  subject(:journey_log) {described_class.new}
  let(:journey) {double(:journey)}
  let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}

  describe "#initialize" do

    it 'should create an empty array' do
      expect(journey_log.journey_history).to eq []
    end
  end

  describe "#start" do
    it { is_expected.to respond_to(:start).with(1).argument }

    it 'should start a journey with an entry station' do
      expect(journey_log.journey).to receive(:start).with(entry_station)
      journey_log.start(entry_station)
    end

    it 'adds entry_station to journey_history' do
      journey_log.start(entry_station)
      expect(journey_log.journey_history).to include ({entry_station: entry_station})
    end
  end


    describe '#end' do
      before {journey_log.start(entry_station)}
      
      it 'should end a journey with an exit station' do
        expect(journey_log.journey).to receive(:end).with(exit_station)
        journey_log.end(exit_station)
      end

      it 'adds exit_station to journey_history' do
        journey_log.end(exit_station)
        expect(journey_log.journey_history.last[:exit_station]).to eq exit_station
      end
    end
end
