require 'bike'

describe Bike do
  it {is_expected.to respond_to(:working?)}

  it 'can be reported broken' do
    expect(subject.report_broken).to eq true
  end

end
