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

  def check_floor
    if @passengers.map(&:floor).include?(current_floor)
      puts "Passenger(s) dropped off on floor #{current_floor}"
      @passengers = @passengers.reject { |p| p.floor == current_floor }
    elsif pickup?
      puts "Passengers(s) picked up from floor #{current_floor}"
      @elevator_requests = @elevator_requests.reject { |r| r.floor == current_floor }
    else
      return
    end
  end

  def pickup?
    @elevator_requests.map(&:floor).include?(current_floor) &&
      @elevator_requests.map(&:direction).include?(current_direction)
  end

  def passengers
    @passengers
  end

  def empty?
    @passengers.empty? && @elevator_requests.empty?
  end

  def proximity_to(floor)
    if floor == current_floor
      0
    elsif floor < current_floor
      (floor..current_floor).size
    else
      (current_floor..floor).size
    end  
  end
end
