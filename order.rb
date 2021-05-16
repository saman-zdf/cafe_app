class Order 

  def initialize
    @order_items = Hash.new(0)
  end

  def add_item(name, quantity)
    @order_items[name] += quantity
  end

  def get_items
    return @order_items
  end
  def display
    if @order_items == {}
      puts "your order is empty!"
    puts "thank you for coming!"
    else @order_items != {}
      @order_items.each do |k, v|
        puts "your order is #{v} #{k}"
        puts "thank you for coming!"
        end
      end
  end
end