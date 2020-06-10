class Vendor
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def check_stock(item)
    inventory[item]
  end

  def potential_revenue
    inventory.keys.map { |item| item.price * inventory[item] }.sum
  end
end
