require 'docking_station'

describe DockingStation do
   it { is_expected.to respond_to :release_bike }
   it { is_expected.to respond_to(:dock).with(1).argument }
   it { is_expected.to respond_to (:bikes) }

  describe '#release_bike' do

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
      expect(bike).to be_working
    end

    it 'raises an error when empty' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe 'working?' do
    it 'releases working bikes' do
      bike = Bike.new
      subject.dock(bike)
      subject.release_bike
      expect(bike).to be_working
      # bike = subject.release_bike
    end
  end

  describe '#dock' do

    it 'returns docked bikes' do
        bike = Bike.new
        subject.dock(bike)
        expect(bike).to be_working
        expect(subject.bikes.last).to eq bike
    end

    it 'raises an error when the docking station is full' do
        DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
        expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

    # it 'raises an error when full' do
    #   subject.capacity.times { subject.dock Bike.new }
    #   expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    # end


  # it 'has a default capacity' do
  #     expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  #   end
  # end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock Bike.new }
      expect{ docking_station.dock Bike.new }.to raise_error 'Docking station full'
    end

end
