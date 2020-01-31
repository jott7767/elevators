# frozen_string_literal: true

class FloorRequest
  def initialize(floor, direction)
    @floor = floor
    @direction = direction
  end

  attr_reader :floor, :direction

end
