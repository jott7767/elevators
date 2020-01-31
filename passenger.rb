# frozen_string_literal: true

class Passenger
  def initialize(floor_request)
    @floor_request = floor_request
  end

  def floor
    @floor_request.floor
  end
end
