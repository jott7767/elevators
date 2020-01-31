# frozen_string_literal: true

class Passenger
  def initialize(floor)
    @floor = floor
  end

  attr_reader :floor
end
