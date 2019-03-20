require 'docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  # describe '#dock' do
  #   it 'Maximum stock of 20 bikes'
  # end


  describe '#dock' do
    it 'No capacity for bike' do
      20.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'No capacity for bike'
    end
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  describe '#release_bike' do
    it 'releases working bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'checks for an empty docking station' do
      expect { subject.release_bike }.to raise_error 'No bike available'
    end
  end
end
