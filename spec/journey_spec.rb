require 'journey'
require 'oystercard'
require 'station'

describe Journey do
  subject(:a_journey) { described_class.new('Cannon Street') }

  it 'should instantiate with an entry station' do
    expect(a_journey.journey['start']).to eq 'Cannon Street'
  end

  # it 'Should add touch out station to journey hash on touching out' do
  #   oyster.touch_out(station)
  #   expect(oyster.exit_station).to eq station
  # end
  #
  # it 'Should record the details of the journey on touching out' do
  #   oyster.touch_in(entry_station)
  #   oyster.touch_out(exit_station)
  #   expect(oyster.journey_history).to include('start' => entry_station, 'end' => exit_station)
  # end

  #   sam_oyster.touch_out("London Bridge")
  #   expect (sam_oyster.current_journey.journey).to eq { {'start' => 'Victoria', 'end' => 'London Bridge'} }
  # end
end
