class MenuItem
  attr_reader :price, :name
  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    return "#{@name}" +" "*(10 - @name.length)+"...  $#{@price}"
  end

end