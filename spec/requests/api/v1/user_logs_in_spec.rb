require 'rails_helper'

describe "Authentication API" do
  it "user logs in and is sent unique JSON web token" do
    User.create!(name: "Ellen", email: "ecorneli@iwu.edu", password: "123", password_confirmation: "123")

    params = {email: "ecorneli@iwu.edu", password: "123"}
    post '/api/v1/authenticate', params: params

    result = JSON.parse(response.body)

    expect(response).to be_success
    expect(result).to have_key("auth_token")
  end

  it "visitor attempts to login with wrong password and sent error" do
    User.create!(name: "Ellen", email: "ecorneli@iwu.edu", password: "123", password_confirmation: "123")

    params = {email: "ecorneli@iwu.edu", password: "321"}

    post '/api/v1/authenticate', params: params

    result = JSON.parse(response.body)

    expect(response).to_not be_success
    expect(result).to have_key("error")
    expect(result["error"]["user_authentication"][0]).to eq("invalid credentials")
  end
end
