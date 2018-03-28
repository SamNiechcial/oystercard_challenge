require 'journey'
require 'oystercard'
require 'station'

describe Journey do
  subject(:journey) { described_class.new('Cannon Street') }


  it 'should instantiate with an entry station' do
    expect(journey.entry_station).to eq 'Cannon Street'  
  end

end
