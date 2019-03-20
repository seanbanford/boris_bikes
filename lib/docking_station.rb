require_relative 'bike'

class DockingStation

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bike available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'No capacity for bike' if @bikes.count >= 20
    @bikes << bike

  end

end
