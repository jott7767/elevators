# frozen_string_literal: true

class ElevatorRequest
  def initialize(floor, direction)
    @floor = floor
    @direction = direction
  end
  attr_reader :floor, :direction
end
