require 'spec_helper.rb'
require 'yaml'
require_relative '../lib/search_by_full_address.rb'

customers = YAML.load(File.read('./lib/customers.yaml'))

describe 'Full address search' do
  customers.map do |customer|
    customer.fetch('test_cases', []).map do |test_case|
      it "is searchable by #{test_case}" do
        result_uuids = search_by_full_address(test_case).map { |x| x['_id'] }
        expect(result_uuids).to include customer.fetch('uuid')
      end
    end
  end
end
