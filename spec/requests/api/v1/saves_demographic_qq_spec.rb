require 'rails_helper'

describe 'Questionnnaire API' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_request).and_return(@user)
  end
  
  it "saves demographic questionnaire questions" do
    headers = { "CONTENT-TYPE" => "application/json", "HTTP_QUESTIONS" => "[\"15\",\"16\",\"67\",\"65\"]" }

    put '/api/v1/questionnaires/1', :headers => headers

    expect(response).to be_success
    expect(Questionnaire.find(1).questions.count).to eq(4)
  end
end
