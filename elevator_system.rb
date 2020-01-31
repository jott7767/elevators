# frozen_string_literal: true
require_relative 'elevator'

class ElevatorSystem
  def initialize(num_elevators, floors)
    @elevators = [] << num_elevators.times { Elevator.new(floors) }
    @floors = floors
  end

  def elevators
    @elevators
  end

end
