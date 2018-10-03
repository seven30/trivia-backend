require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe "Users", type: :request do
  describe "GET /users/sign_in" do
    let!(:user){ User.create(email: 'jill@jiller.com', password: 'secret') }
    it "logs in a user" do
      payload = {
        user: {
          email: 'jill@jiller.com',
          password: 'secret'
        }
      }

      post user_session_path, params: payload
      expect(response).to have_http_status(201)
      expect(response.headers["Authorization"]).to_not be_blank
    end
  end
end
