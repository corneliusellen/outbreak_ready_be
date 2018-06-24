require 'rails_helper'

describe 'Questionnnaire API' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_request).and_return(@user)
  end
  
  it "sends clinical questions including universal questions" do
    Intake.create(questionnaire_id: 1, tag_id: 16)

    get '/api/v1/questionnaires/1/clinicals'

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(9)
  end
end
