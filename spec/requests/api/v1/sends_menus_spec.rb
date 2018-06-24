require 'rails_helper'

describe 'Search API' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_request).and_return(@user)
  end
  
  it 'Sends menus for specified restaurant' do
    headers = { 'CONTENT-TYPE' => 'application/json', 'HTTP_VENUE_ID' => '4dc2d699d22dd7df9ab25063' }
    get "/api/v1/search/menus", headers: headers

    result = JSON.parse(response.body)

    expect(result.count).to eq(3)
    expect(result.first["name"]).to eq("Happy Hour")
    expect(result.first["foods"]).to be_an(Array)
  end
end
