class Basket
  attr_accessor :books, :series_length

  DISCOUNTS = Hash[
    '1': 0,
    '2': 0.05,
    '3': 0.1,
    '4': 0.2,
    '5': 0.25
  ]

  def initialize(series_length = 5)
    @books = {}
    @series_length = series_length
  end

  def total_price
    temporal_basket = @books.dup
    result = 0
    while temporal_basket.length.positive?
      set_quantity = book_set_quantity(temporal_basket)
      new_set = book_set(temporal_basket, set_quantity)
      discount = discount_amount(new_set)
      result += set_price(new_set, set_quantity, discount)
    end
    result.round(1)
  end

  def add_book(book, amount)
    @books[book] = 0 if @books[book].nil?
    @books[book] += amount
  end

  private

  def book_set(basket, books_quantity)
    new_set = []
    basket.each do |book, amount|
      new_set << book
      basket[book] -= books_quantity
      if amount.zero?
        basket.delete(book)
        next
      end
    end
    new_set
  end

  def book_set_quantity(basket)
    lowest_amount = Float::INFINITY
    basket.each do |_, amount|
      lowest_amount = amount if amount < lowest_amount
    end
    lowest_amount
  end

  def discount_amount(book_set)
    set_length = book_set.length
    raise(StandardError, 'Invalid amount of books in the Series') unless set_length <= @series_length

    DISCOUNTS[:"#{set_length}"]
  end

  def set_price(book_set, set_quantity, discount)
    books_price = book_set.sum(&:price) * set_quantity
    books_price * (1 - discount)
  end
end
