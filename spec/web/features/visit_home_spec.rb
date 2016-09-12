require 'features_helper'

describe 'Visit homepage' do
  it 'it successful' do
    visit '/'

    expect(page).to have_content 'Bookshelf'
  end
end
