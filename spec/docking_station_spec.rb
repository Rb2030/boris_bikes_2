require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it { is_expected.to respond_to(:dock).with(1).argument }
  it {is_expected.to respond_to(:bike) }

  describe '#release_bike' do

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(bike).to be_working
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when empty' do
      expect { subject.release_bike }. to raise_error 'No bikes available'
    end
  end

  describe 'working?' do
    it 'releases working bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(bike).to be_working
      subject.release_bike
      # bike = subject.release_bike
    end
  end

  describe '#dock' do

    it 'returns docked bikes' do
        bike = Bike.new
        subject.dock(bike)
        expect(bike).to be_working
        expect(subject.dock(bike).last).to eq bike
    end

    it 'raises an error when the docking station is full' do
        20.times { subject.dock Bike.new }
        expect { subject.dock Bike.new }. to raise_error 'Docking station full'
    end
  end
end
