require 'docking_station.rb'

describe DockingStation do
  let(:bike) { double :bike }

  it { is_expected.to respond_to(:release_bike) }

  # describe '#dock' do
  #   it 'Maximum stock of 20 bikes'
  # end


  describe '#dock' do
    it 'No capacity for bike' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock double(:bike) }
      expect { subject.dock Bike.new }.to raise_error 'No capacity for bike'
    end
  end

  it 'returns docked bikes' do
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  it 'docks something' do
    bike = double(:bike)
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'allows capacity to be set' do
    new_capacity = 30
    ds = DockingStation.new(new_capacity)
    expect(ds.capacity).to eq new_capacity
  end

  it 'defaults to DEFAULT_CAPACITY' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do
    it 'releases working bike' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "it doesn't release broken bikes" do
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'Bike Broken'
    end

    it 'checks for an empty docking station' do
      expect { subject.release_bike }.to raise_error 'No bike available'
    end
  end
end
