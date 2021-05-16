require_relative "../cafe"
require_relative "../menu_item"
require_relative "../menu"
require_relative "../order"

# Test for the class MenuItem
describe MenuItem do
  it "should return the price of item" do
    name = "latte"
    price = 4.00
    menu_item = MenuItem.new(name, price)
    expect(menu_item.price).to eq(price)
  end
  it "should return the name of item" do
    name = "latte"
    price = 4.00
    menu_item = MenuItem.new(name, price)
    expect(menu_item.name).to eq(name)
  end
end
# Test for the class Menu
describe Menu do 
  it "should be able to get an item price" do
    name = "latte"
    price = 4.00
    menu = Menu.new
    menu.add_item(name, price)
    expect(menu.get_price(name)).to eq(price)
  end
  it "sould be able to add the item" do
    name = "latte"
    price = 4.00
    menu = Menu.new
    menu.add_item(name, price)
    expect(menu.get_items().length).to be(1)
  end
  it "should return the item name for valid item" do
    name = "latte"
    price = 4.00
    menu = Menu.new
    menu.add_item(name, price)
    expect(menu.validate_item(name)).to eq(name)
  end
  it "should return nil for an invalid item" do
    name = "latte"
    price = 4.00
    menu = Menu.new
    menu.add_item(name, price)
    expect(menu.validate_item(name)).to eq(name)
  end
end
# Test for class Order
describe Order do 
  it "should add an item to the order" do 
    order = Order.new
    name = "latte"
    quantity = 2 
    order.add_item(name, quantity)
    expect(order.get_items().length).to be(1)
  end
  it "should update the item quantity" do 
    order = Order.new
    name = "latte"
    quantity = 2 
    quantity_add = 3 
    order.add_item(name, quantity)
    order.add_item(name, quantity_add)
    expect(order.get_items()[name]).to be(quantity + quantity_add)
  end
end

# Test for the class Cafe 
describe Cafe do 
  it "should create a cafe with a name" do 
    name = "My cafe"
    menu_items = {}
    cafe = Cafe.new(name, menu_items)
    expect(cafe.name).to eq(name)
  end

  it "shoukd create a cafe with a menu" do 
    name = "My cafe"
    menu_items = {latte: 4.00, tea: 2.00}
    cafe = Cafe.new(name, menu_items)
    expect(cafe.menu.get_items.length).to be(2) 
  end

  it "should add item to order" do
    name = "My cafe"
    menu_items = {latte: 4.00, tea: 2.00}
    cafe = Cafe.new(name, menu_items)
    item = "latte"
    quantity = 1
    cafe.add_to_order(item, quantity)
    expect(cafe.get_order().get_items().length).to be(1)
  end
  it "should define a welcome method" do
    name = "My cafe"
    menu_items = {latte: 4.00, tea: 2.00}
    cafe = Cafe.new(name, menu_items)
    expect(cafe.welcome).to eq(nil)
    
  end
  it "should define a print menu method" do 
    name = "My cafe"
    menu_items = {latte: 4.00, tea: 2.00}
    cafe = Cafe.new(name, menu_items)
    expect(cafe.print_menu).to eq(nil)
  end
  it "should calculate order total" do 
    name = "My cafe"
    menu_items = {"latte" => 4.00, "tea" => 2.00}
    cafe = Cafe.new(name, menu_items)
    item = "latte"
    quantity = 1
    cafe.add_to_order(item, quantity)
    item = "latte"
    quantity = 2
    cafe.add_to_order(item, quantity)
    expect(cafe.order_total).to be(12.00)
  end
end