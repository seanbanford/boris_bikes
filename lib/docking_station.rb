require_relative 'bike'

class DockingStation

attr_reader :bikes
attr_reader :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bike available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'No capacity for bike' if full?
    @bikes << bike

  end

  private

  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty?
  end

end
