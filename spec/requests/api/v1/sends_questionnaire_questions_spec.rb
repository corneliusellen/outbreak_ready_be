require 'rails_helper'

describe 'Questionnnaire API' do
  it "sends questionnaire questions questions" do
    QuestionnaireQuestion.create(questionnaire_id: 1, question_id: 1)
    QuestionnaireQuestion.create(questionnaire_id: 1, question_id: 2)
    QuestionnaireQuestion.create(questionnaire_id: 1, question_id: 3)
    get '/api/v1/questionnaires/1/questions'

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result.count).to eq(3)
    expect(result.first).to have_key("id")
    expect(result.first).to have_key("text")
    expect(result.first).to have_key("answers")
    expect(result.first).to have_key("section_id")
  end
end
