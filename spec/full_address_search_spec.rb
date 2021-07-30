require 'spec_helper.rb'
require_relative '../lib/search_by_full_address.rb'

describe 'Full address search' do
  it 'is searchable by street name as is' do
    expect(search_by_full_address('main st').size).to eq 1
  end

  it 'is searchable by street name with synonyms' do
    expect(search_by_full_address('west loraine').size).to eq 1
  end

  it 'is searchable by full name' do
    expect(search_by_full_address('helena wiskey').size).to eq 2
  end

  it 'is not depend on apostrophe' do
    expect(search_by_full_address('wiskey 50 joes place').size).to eq 2
  end
end
