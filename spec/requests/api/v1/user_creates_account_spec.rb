require 'rails_helper'

describe "Authentication API" do
  xit "creates user account with login info" do
    expect(User.count).to eq(0)

    params = {name: 'Ellen', email: 'ecorneli@iwu.edu', password: '123'}
    post '/api/v1/users', params: params

    result = JSON.parse(response.body)

    expect(User.count).to eq(1)
  end
end
