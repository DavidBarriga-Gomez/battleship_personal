require './lib/ship'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ShipTest < Minitest::Test
  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_ships_existence
    assert_instance_of Ship, @cruiser
  end

  def test_ship_attributes
    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
  end

  def test_health
      assert_equal 3, @cruiser.health
  end

  def test_hit_and_sunk?
    refute @cruiser.sunk?
    @cruiser.hit
    assert_equal 2, @cruiser.health
    @cruiser.hit
    assert_equal 1, @cruiser.health
    @cruiser.hit
    assert_equal 0, @cruiser.health
    assert @cruiser.sunk?
  end

end
