# frozen_string_literal: true

class FloorRequest
  def initialize(floor, direction)
    @floor = floor
  end

  attr_reader :floor

end
