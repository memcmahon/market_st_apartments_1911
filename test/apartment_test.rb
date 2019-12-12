require './test/test_helper'
require './lib/renter'
require './lib/apartment'

class ApartmentTest < Minitest::Test
  def setup
    @renter1 = Renter.new("Jessie")
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 2, bedrooms: 1})
  end

  def test_it_exists
    assert_instance_of Apartment, @unit1
  end

  def test_it_has_attributes
    assert_equal "A1", @unit1.number
    assert_equal 1200, @unit1.monthly_rent
    assert_equal 1, @unit1.bedrooms
    assert_equal 2, @unit1.bathrooms
  end

  def test_it_starts_with_no_renter
    assert_nil @unit1.renter
  end

  def test_it_can_add_renter
    @unit1.add_renter(@renter1)

    assert_equal @renter1, @unit1.renter
  end
end
