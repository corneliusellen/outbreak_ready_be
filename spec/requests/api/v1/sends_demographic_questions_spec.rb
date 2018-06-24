require 'rails_helper'

describe 'Questionnnaire API' do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_request).and_return(@user)
  end
  
  it "sends demographic questions" do
    Intake.create(questionnaire_id: 1, tag_id: 1)
    Intake.create(questionnaire_id: 1, tag_id: 16)
    Intake.create(questionnaire_id: 1, tag_id: 7)

    get '/api/v1/questionnaires/1/demographics'

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(7)
  end
end
