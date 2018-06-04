require 'rails_helper'

describe 'Questionnnaire API' do
  it "creates a blank questionnaire" do
    post '/api/v1/questionnaires'

    expect(response).to be_success
    expect(Questionnaire.count).to eq(2)
  end
end
