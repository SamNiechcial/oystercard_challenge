require 'journey'
require 'oystercard'
require 'station'

describe Journey do
  subject(:journey) { described_class.new('Cannon Street') }

  it 'should instantiate with an entry station' do
    expect(journey.entry_station).to eq 'Cannon Street'
  end

  it 'should create a complete journey on touching in and out' do
    sam_oyster = Oystercard.new(5)
    sam_oyster.touch_in("Victoria")
    p sam_oyster.current_journey
    p sam_oyster.current_journey.journey
    p expect sam_oyster
    expect(sam_oyster.current_journey.journey).to eq({'start' => 'Victoria', 'end' => nil })
  end

  #   sam_oyster.touch_out("London Bridge")
  #   expect (sam_oyster.current_journey.journey).to eq { {'start' => 'Victoria', 'end' => 'London Bridge'} }
  # end
end
