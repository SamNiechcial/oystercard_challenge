require 'station'

describe Station do
  subject(:bank) { described_class.new('Bank', 1) }

  it 'Should have a name attribute' do
    expect(bank.name).to eq 'Bank'
  end

  it 'Should have a zone attribue' do
    expect(bank.zone).to eq 1
  end
end
