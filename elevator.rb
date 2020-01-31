# frozen_string_literal: true

class Elevator
  def initialize(floors)
    @floors = floors
    @passengers = []
    @current_direction = nil
    @current_floor = rand(1..floors)
    @elevator_requests = []
  end

  attr_reader :floors
  attr_accessor :current_floor, :current_direction

  def move
    current_direction = nil if empty?
    return unless current_direction
    case current_direction
    when "up"
      current_floor += 1
    when "down"
      current_floor -= 1
    else
      return
    end
    check_floor
  end

  def passengers
    @passengers
  end

  def empty?
    @passengers.empty? && @elevator_requests.empty?
  end
end
