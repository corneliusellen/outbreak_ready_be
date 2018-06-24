require 'rails_helper'

describe 'Intake API' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_request).and_return(@user)
  end
  
  it "sends categories with tags" do
    get '/api/v1/tags'

    result = JSON.parse(response.body)

    expect(result.first["name"]).to eq('Etiology')
    expect(result.first["tags"].count).to eq(6)
    expect(result[1]["name"]).to eq('Transmission')
    expect(result[1]["tags"].count).to eq(6)
    expect(result.last["name"]).to eq('Setting')
    expect(result.last["tags"].count).to eq(12)
  end
end
