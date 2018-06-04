require 'rails_helper'

describe 'Questionnnaire API' do
  it "creates intake for questionnaire" do
    headers = { "CONTENT-TYPE" => "application/json", "HTTP_TAGS" => "[\"2\",\"17\",\"9\"]" }
    post '/api/v1/questionnaires/1/intakes', :headers => headers

    expect(response).to be_success
    expect(Intake.count).to eq(3)
  end
end
