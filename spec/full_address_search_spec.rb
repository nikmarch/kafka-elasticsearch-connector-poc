require 'spec_helper.rb'
require_relative '../lib/search_by_full_address.rb'

describe 'Full address search' do
  it 'find by street name' do
    expect(search_by_full_address('main st').size).to eq 1
  end

  it 'find by street name with synonyms' do
    expect(search_by_full_address('west loraine').size).to eq 1
  end

  it 'find by full name' do
    puts search_by_full_address('helena wiskey')
    expect(search_by_full_address('helena wiskey').size).to eq 2
  end
end
