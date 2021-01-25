require_relative '../french_ssn'

describe '#french_ssn_info' do
  it 'should return an error message for an invalid SSN' do
    expected = 'The number is invalid'
    actual = french_ssn_info('123')
    expect(actual).to eq(expected)
  end

  it 'should return the correct message for a valid SSN' do
    expected = 'a male, born in December, \'84 in Seine-Maritime.'
    actual = french_ssn_info('1 84 12 76 451 089 46')
    expect(actual).to eq(expected)
  end
end
