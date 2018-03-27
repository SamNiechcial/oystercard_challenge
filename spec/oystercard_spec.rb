require 'oystercard'

describe Oystercard do
  subject(:a_oystercard) { described_class.new }

    it 'Should create an instance (passed no arguments) with a default balance of 0' do
      expect(a_oystercard.balance).to eq 0.00
    end

    describe '#top-up' do

      it 'Should allow the user to top up the value on the oyster card by £5' do
        a_oystercard.top_up(5.00)
        expect(a_oystercard.balance).to eq 5.00
      end

      it 'Should not allow the user to top up the value past the maximum of £90' do
        a_oystercard.top_up(70)
        error_message = "Cannot top up past maximum value of £#{Oystercard::MAXIMUM_BALANCE}"
        expect { a_oystercard.top_up(21) }.to raise_error error_message
      end
    end

    describe '#deduct' do

      it 'Should allow the system to deduct journey expenses from the card balance' do
        a_oystercard.top_up(5)
        a_oystercard.deduct(5)
        expect(a_oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
      end
    end

    describe '#touch_in' do

      it 'Should allow the user to touch in at the start of a journey' do
         a_oystercard.touch_in
         expect(a_oystercard.in_journey).to eq true
      end
    end

    describe '#touch_out' do

      it 'Should allow a user to touch out at the end of a journey' do
        a_oystercard.touch_in
        a_oystercard.touch_out
        expect(a_oystercard.in_journey).to eq false
      end
    end

  subject(:b_oystercard) { described_class.new(5.00) }

    it 'Should create an instance (passed starting balance of 5.00) with 5.00 balance' do
      expect(b_oystercard.balance).to eq 5.00
    end

end
