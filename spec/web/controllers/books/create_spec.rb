require 'spec_helper'
require_relative '../../../../apps/web/controllers/books/create'

describe Web::Controllers::Books::Create do
  let(:action) { described_class.new }
  let(:params) { Hash[book: { title: 'Confident Ruby', author: 'Avdi Grimm' }] }

  before { BookRepository.clear }

  it 'creates a new book' do
    action.call(params)

    # expect(action.book.id).not_to eq 0
    # expect(action.title).to eq params[:book][:title]
  end

  it 'redirects the user to the books listing' do
    response = action.call(params)

    expect(response[0]).to eq 302
    expect(response[1]['Location']).to eq '/books'
  end
end
