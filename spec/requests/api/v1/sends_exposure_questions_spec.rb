require 'rails_helper'

describe 'Questionnnaire API' do
  it "sends exposure questions" do
    Intake.create(questionnaire_id: 1, tag_id: 1)
    Intake.create(questionnaire_id: 1, tag_id: 16)
    Intake.create(questionnaire_id: 1, tag_id: 7)

    get '/api/v1/questionnaires/1/exposures'

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(52)
  end
end
