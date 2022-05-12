require 'spec_helper'
require 'basket'
require 'book'

RSpec.describe Basket do
  context 'single book' do
    let(:book1) { Book.new('Book1', 'Book Series', 8) }
    let(:basket) { Basket.new() }

    it 'returns total price without discount' do
      basket.add_book(book1, 2)
      expect(basket.total_price).to eq(16)
    end
  end

  context 'multiple books' do
    let(:series) { 'Book Series' }
    let(:book_price) { 8 }
    let(:book1) { Book.new('Book1', series, book_price) }
    let(:book2) { Book.new('Book2', series, book_price) }
    let(:book3) { Book.new('Book3', series, book_price) }
    let(:book4) { Book.new('Book4', series, book_price) }
    let(:book5) { Book.new('Book5', series, book_price) }
    let(:basket) { Basket.new }

    it 'applies 5% discount' do
      basket.add_book(book1, 2)
      basket.add_book(book2, 1)
      expect(basket.total_price).to eq(23.2)
    end

    it 'applies 10% discount' do
      basket.add_book(book1, 2)
      basket.add_book(book2, 1)
      basket.add_book(book3, 1)
      expect(basket.total_price).to eq(29.6)
    end

    it 'applies 20% discount' do
      basket.add_book(book1, 2)
      basket.add_book(book2, 1)
      basket.add_book(book3, 1)
      basket.add_book(book4, 1)
      expect(basket.total_price).to eq(33.6)
    end

    it 'applies 25% discount' do
      basket.add_book(book1, 2)
      basket.add_book(book2, 1)
      basket.add_book(book3, 1)
      basket.add_book(book4, 1)
      basket.add_book(book5, 1)
      expect(basket.total_price).to eq(38)
    end
  end
end
