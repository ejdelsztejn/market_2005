require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'

class VendorTest < MiniTest::Test
  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
  end

  def test_it_has_attributes
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal "Rocky Mountain Fresh", vendor.name
    assert_equal ({}), vendor.inventory
  end

  def test_it_can_check_stock
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal 0, vendor.check_stock(item1)
  end

  def test_it_can_stock_an_item
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})
    vendor = Vendor.new("Rocky Mountain Fresh")

    vendor.stock(item1, 30)

    assert_equal 30, vendor.check_stock(item1)
    assert_equal ({item1 => 30}), vendor.inventory

    vendor.stock(item2, 12)

    assert_equal ({item1 => 30, item2 => 12}), vendor.inventory
  end
end
