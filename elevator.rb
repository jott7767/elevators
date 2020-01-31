# frozen_string_literal: true

class Elevator
  def initialize(floors)
    @floors = floors
    @passengers = []
    @current_direction = nil
    @current_floor = rand(1..floors)
  end

  attr_reader :floors
  attr_accessor :current_floor, :current_direction

  def passengers

  end

  def busy?

  end
end
