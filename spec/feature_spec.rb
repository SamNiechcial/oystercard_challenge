require 'journey'
require 'oystercard'
require 'station'

describe "A group of featuretests" do
    let(:sam_oyster) { Oystercard.new(5) }

    it 'should create a journey hash with a start station on touching in' do
      sam_oyster.touch_in("Victoria")
      expect(sam_oyster.current_journey.journey).to eq({'start' => 'Victoria', 'end' => nil })
    end

    it 'Should record the details of the journey on touching out' do
      sam_oyster.touch_in("Victoria")
      sam_oyster.touch_out("Brixton")
      expect(sam_oyster.journey_history[0].journey['end']).to eq 'Brixton'
    end
end
