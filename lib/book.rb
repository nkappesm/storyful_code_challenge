class Book
  attr_accessor :name, :series, :price

  def initialize(name, series, price)
    @name = name
    @series = series
    @price = price
  end
end
