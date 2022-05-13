class Basket

  def initialize()
    @books = {}
  end

  def total_price
    temporal_basket = @books.dup
    result = 0
    while temporal_basket.length > 0
      new_set = book_set(temporal_basket)
      discount = discount_amount(new_set)
      result += set_price(new_set, discount)
    end
    result
  end

  def add_book(book, amount)
    @books[book] = 0 if @books[book].nil?
    @books[book] += amount
  end

  private

  def book_set(basket)
    new_set = []
    basket.each do |book, amount|
      new_set << book
      if amount == 1
        basket.delete(book)
        next
      end
      basket[book] -= 1
    end
    new_set
  end

  def discount_amount(book_set)
    case book_set.length
    when 1
      0.0
    when 2
      0.05
    when 3
      0.1
    when 4
      0.2
    when 5
      0.25
    else
      raise(StandardError, 'Invalid amount of books in the Series')
    end
  end

  def set_price(book_set, discount)
    books_price = book_set.sum(&:price)
    books_price * (1 - discount)
  end
end
