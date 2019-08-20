require 'pry'

class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fire_upon = false
  end

  def empty?
    @ship.nil?
  end

    #version 2
  #   if @ship == nil
  #     true
  #   else
  #     false
  #   end
  # end

  #version 3
  # def empty?
  #   @ship == nil ? true : false
  # end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    if @ship.health == @ship.length
      false
    else true
    end
  end

  def fire_upon
    if (@fire_upon = true) && (@ship != nil)
      @ship.hit
    end
  end

  def render
    if fired_upon? == false
      "."
    elsif fired_upon? == true && @fire_upon
      "M"
    # elsif
    end

  end

end
