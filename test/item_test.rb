require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < MiniTest::Test
  def test_it_exists
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    assert_instance_of Item, item1
  end

  def test_it_has_attributes
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    assert_equal "Peach", item1.name
    assert_equal 0.75, item1.price
  end
end
