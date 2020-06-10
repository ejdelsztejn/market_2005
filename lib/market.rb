class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    vendors.select { |vendor| vendor.inventory.include?(item) }
  end

  def sorted_item_list
    names = []
    vendors.each do |vendor|
      vendor.inventory.each do |item, _|
        names << item.name
      end
    end

    names.sort.uniq
  end

  def total_inventory
    market_inventory = Hash.new(0)
    vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        if market_inventory.include?(item) == false
          market_inventory[item] = {quantity: 0, vendors: []}
          market_inventory[item][:quantity] += amount
          market_inventory[item][:vendors] << vendor
        else
          market_inventory[item][:quantity] += amount
          market_inventory[item][:vendors] << vendor unless market_inventory[item][:vendors].include?(vendor)
        end
      end
    end
    market_inventory
  end

  def overstocked_items
    items = []
    total_inventory.select do |item, values|
      items << item if values[:quantity] > 50 && values[:vendors].size > 1
    end
    items
  end
end
