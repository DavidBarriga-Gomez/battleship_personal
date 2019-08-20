require './lib/ship'
require './lib/cell'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_existence_cell
    assert_instance_of Cell, @cell
  end

  def test_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_ship
    assert_nil @cell.ship
  end

  def test_empty?
    assert @cell.empty?
  end

  def test_place_ship
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
    refute @cell.empty?
  end

  def test_ship_can_be_fired_upon
    @cell.place_ship(@cruiser)
    # assert_equal false, @cell.fired_upon?
    refute @cell.fired_upon?
    #check above line for understanding
    @cell.fire_upon
    assert_equal 2, @cell.ship.health
    assert @cell.fired_upon?
  end
end
