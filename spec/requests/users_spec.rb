require 'rails_helper'

describe "Users API" do
  before do
    @user3 = User.create(email:"user3@example.com", password:"password3", username:"user3")
    @user4 = User.create(email:"user4@example.com", password:"password4", username:"user4")
  end
  it "gets a list of users" do
    get '/users'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.length).to eq(2)
  end

  it "shows a specific user" do
    get "/users/#{@user3.id}"

    json = JSON.parse(response.body)
    
    expect(response).to be_success

    expect(json["username"]).to eq("user3")
  end
end
