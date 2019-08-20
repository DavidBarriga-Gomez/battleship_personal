require './lib/ship'
require './lib/cell'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class CellTest < Minitest::Test
  def setup
    @cell_1 = Cell.new("B4")
    @cruiser_1 = Ship.new("Cruiser", 3)
    @cell_2 = Cell.new("C3")
    @cruiser_2 = Ship.new("Cruiser", 3)
  end

  def test_existence_cell
    assert_instance_of Cell, @cell_1
  end

  def test_coordinate
    assert_equal "B4", @cell_1.coordinate
  end

  def test_ship
    assert_nil @cell_1.ship
  end

  def test_empty?
    assert @cell_1.empty?
  end

  def test_place_ship
    @cell_1.place_ship(@cruiser_1)
    assert_equal @cruiser_1, @cell_1.ship
    refute @cell_1.empty?
  end

  def test_ship_can_be_fired_upon
    @cell_1.place_ship(@cruiser_1)
    # assert_equal false, @cell_1.fired_upon?
    refute @cell_1.fired_upon?
    #check above line for understanding
    @cell_1.fire_upon
    assert_equal 2, @cell_1.ship.health
    assert @cell_1.fired_upon?
  end

  def test_render
    @cell_1.place_ship(@cruiser_1)
    assert_equal ".", @cell_1.render
    @cell_1.fire_upon
    assert_equal "M", @cell_1.render
    @cell_2.place_ship(@cruiser_2)
    assert_equal ".", @cell_2.render 


  end
end
