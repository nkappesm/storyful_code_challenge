require 'spec_helper'
require 'book'

RSpec.describe Book do
  context 'with correct parameters' do
    let(:book) { described_class.new('Book', 'Series', 8) }

    it 'responds to name' do
      expect(book).to respond_to(:name)
    end

    it 'responds to series' do
      expect(book).to respond_to(:series)
    end

    it 'responds to price' do
      expect(book).to respond_to(:price)
    end
  end

  context 'with incorrect parameters' do
    it 'raises ArgumentError' do
      expect { described_class.new('Book') }.to raise_error(ArgumentError)
    end
  end
end
