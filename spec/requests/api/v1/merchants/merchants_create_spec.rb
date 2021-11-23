require 'rails_helper'

RSpec.describe 'can create merchant' do
  it 'creates merchant' do
    post '/api/v1/merchants', params: { name: 'Last code bender inc'}

    data =  JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(201)
    expect(data[:data][:attributes][:name]).to eq('Last code bender inc')
  end

  it 'should throw errors' do
    post '/api/v1/merchants', params: { name: nil}

    error =  JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(error[:data][:attributes][:message]).to eq('Validation failed: Name can\'t be blank')
  end
end