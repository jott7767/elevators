# frozen_string_literal: true
require_relative 'elevator'

class ElevatorSystem
  def initialize(num_elevators, floors)
    @elevators = []
    num_elevators.times { @elevators.push(Elevator.new(floors)) }
  end

  def elevators
    @elevators
  end

  def elevator_request(floor, direction)

  end

  def time_passed
    @elevators.each(&:move)
  end

end
