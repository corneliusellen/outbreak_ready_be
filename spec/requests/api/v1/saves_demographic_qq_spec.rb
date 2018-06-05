require 'rails_helper'

describe 'Questionnnaire API' do
  it "saves demographic questionnaire questions" do
    headers = { "CONTENT-TYPE" => "application/json", "HTTP_DEMOGRAPHICS" => "[\"15\",\"16\",\"67\",\"65\"]" }

    patch '/api/v1/questionnaires/1', :headers => headers

    result = JSON.parse(response.body)
    expect(response).to be_success

  end
end
