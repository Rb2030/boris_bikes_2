require_relative 'bike'

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes  = []
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  def release_bike
    fail 'No bikes available' if empty?
    bikes.pop
  end

  private

  def full?
    true if bikes.count >= capacity
  end

  def empty?
    true if bikes.empty?
  end
end
