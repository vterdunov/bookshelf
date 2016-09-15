require 'features_helper'

describe 'List books' do
  before do
    BookRepository.clear

    BookRepository.create(Book.new(title: 'PoeAA', author: 'Martin Fowler'))
    BookRepository.create(Book.new(title: 'TDD', author: 'Kent Beck'))
  end

  it 'show a book element for each book' do
    visit '/books'

    expect(page).to have_css('.book', count: 2)
  end
end
