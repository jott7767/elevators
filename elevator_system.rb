# frozen_string_literal: true
require_relative 'elevator'
require_relative 'elevator_request'

class ElevatorSystem
  def initialize(num_elevators, floors)
    @elevators = []
    num_elevators.times { @elevators.push(Elevator.new(floors)) }
  end

  def elevators
    @elevators
  end

  def elevator_request(floor, direction)
    pick_best_elevator(floor,_direction).elevator_requests << ElevatorRequest.new(floor, direction)
  end

  def time_passed
    @elevators.each(&:move)
  end

  def pick_best_elevator(floor, direction)
    if all_busy?
      closest_empty(floor_direction)
    else
      closest_busy(floor, direction)
    end
  end

  def closest_empty(floor, direction)
    best_elevator = nil
    @elevators.map(&:empty).map do |el|

      best_elevator = el
    end
  end

  def closest_busy

  end

  def all_busy?
    !@elevators.map(&:empty).any?
  end

end
