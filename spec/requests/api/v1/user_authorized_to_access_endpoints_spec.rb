require 'rails_helper'

describe "Authentication API" do
  it "user can access authorized endpoints " do
    params = {email: "ecorneli@iwu.edu", password: "12345"}
    post '/api/v1/authenticate', params: params
    token = JSON.parse(response.body)["auth_token"]

    headers = {"Authorization": token}
    get '/api/v1/tags', headers: headers

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result[0]).to have_key("tags")
  end
end
