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
      best_empty(floor)
    else
      best_busy(floor, direction)
    end
  end

  def best_empty(floor)
    empty = elevators.map(&:empty)
    closest(empty, floor)
  end

  def closest(els, floor)
    elevator  = els.first
    best      = elevator.proximity_to(floor)
    @elevators.map do |el|
      elevator = el if el.proximity_to(floor) < best
    end
    elevator
  end

  def best_busy(floor, direction)
    same_dir = @elevators.select { |el| el.current_direction == direction }
    closest(same_dir, floor)
  end

  def all_busy?
    !@elevators.map(&:empty).any?
  end

  def floor_request(floor)
    els = elevators.map(&:picked_up).select{ |x| x.current_floor != floor }
    els.first.passengers << Passenger.new(floor)
  end
end
