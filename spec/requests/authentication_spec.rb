require 'rails_helper'

RSpec.describe 'Authentication API', type: :request do
    let!(:headers) { {"Content-Type" => "application/json"} }
    let(:valid_credentials) do
        {
            first_name: user.first_name,
            email: user.email,
            password: user.password
        }
    end

    describe 'POST /signup' do
        context "when signup is successfully" do
        let(:user) { build(:user) }
        before { post '/signup', params: valid_credentials.to_json, headers: headers }

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end

            it 'returns token' do
                expect(json['first_name']).not_to be_empty
                expect(json['auth_token']).not_to be_nil
                expect(json['message']).to match(/Account created successfully/)
                expect(json.size).to eq(3)
            end
        end
    end

    # describe 'POST /authenticate' do
    #     context "when authenticate is successfully" do
    #       let(:user) { create(:user) }

          

    #       before { post '/authenticate', params: valid_credentials.to_json, headers: headers }
    
    #       it 'returns token' do
    #         expect(json['auth_token']).not_to be_nil
    #         expect(json.size).to eq(1)
    #       end
    
    #       it 'returns status code 200' do
    #         expect(response).to have_http_status(200)
    #       end
    #     end
    
    #     context "when authenticate is failed" do
    #       let(:user) { build(:user, email: "janedoe@mail.co") }
          
    #       before { post '/authenticate', params: valid_credentials.to_json, headers: headers }
    
    #       it 'returns authentication is failed' do
    #         expect(json['error']).to match("user_authentication" => ["invalid credentials"])
    #         expect(json.size).to eq(1)
    #       end
    
    #       it 'returns status code 401' do
    #         expect(response).to have_http_status(401)
    #       end
    #     end
    #   end
end