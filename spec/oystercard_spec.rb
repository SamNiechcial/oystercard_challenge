require 'oystercard'

describe Oystercard do
  subject(:a_oystercard) { described_class.new }
  let(:station) { double :station }

  it 'Should create an instance with a default balance of 0' do
    expect(a_oystercard.balance).to eq 0.00
  end

  describe '#top-up' do
    it 'Should allow the user to top up the value on the oyster card by £5' do
      a_oystercard.top_up(5.00)
      expect(a_oystercard.balance).to eq 5.00
    end

    it 'Should not allow the user to top up the value past the max of £90' do
      a_oystercard.top_up(70)
      error_message = "Cannot top up past £#{Oystercard::MAXIMUM_BALANCE}"
      expect { a_oystercard.top_up(21) }.to raise_error error_message
    end
  end

  describe '#touch_in' do
    it 'Should raise an error if touching in with less than minimum fare' do
      error_message = "You need £#{Oystercard::MINIMUM_FARE} to begin journey"
      expect { a_oystercard.touch_in(station) }.to raise_error error_message
    end
  end
end

describe Oystercard do
  describe 'A group of tests that require a card to have a balance of £5 do'
  subject(:oyster) { described_class.new(5.00) }
  let(:station) { double :station }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  it 'Should create an instance (passed £5.00) with balance of £5.00' do
    expect(oyster.balance).to eq 5.00
  end

  describe '#deduct' do
    it 'Should deduct the minimum fare for the journey on touching out' do
      oyster.touch_in(station)
      expect { oyster.touch_out(station) }.to change { oyster.balance }.by(-Oystercard::MINIMUM_FARE)
    end
  end

  describe '#touch_in' do
    it 'Should allow the user to touch in at the start of a journey' do
      oyster.touch_in(station)
      expect(oyster.in_journey?).to eq true
    end

    it 'Should accept and remember touch in station' do
      oyster.touch_in(station)
      expect(oyster.entry_station).to eq station
    end
  end

  describe '#touch_out' do
    it 'Should allow a user to touch out at the end of a journey' do
      oyster.touch_in(entry_station)
      oyster.touch_out(exit_station)
      expect(oyster.in_journey?).to eq false
    end

    it 'Should accept and remember touch out station' do
      oyster.touch_out(station)
      expect(oyster.exit_station).to eq station
    end

    it 'Should record the details of the journey on touching out' do
      oyster.touch_in(entry_station)
      oyster.touch_out(exit_station)
      expect(oyster.journey_history).to include('start' => entry_station, 'end' => exit_station)
    end
  end
end
