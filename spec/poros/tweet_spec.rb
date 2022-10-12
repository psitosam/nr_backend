require 'rails_helper'

RSpec.describe Tweet do 
  it 'can be initialized with JSON from the Twitter api' do 
    response = File.read('spec/fixtures/healthcare_query.json')
    response_body = JSON.parse(response, symbolize_names: true)
    
    
    t = response_body[:data][0]
    binding.pry
    Tweet.create!(t)
    
  end 
end 