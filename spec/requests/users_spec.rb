require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:users) { create_list(:user, 3)}
  let(:user_id) {users.first.id}

  # Test suite for GET /api/v1users
  describe 'GET /api/v1/users/:id' do
    before { get "/api/v1/users/#{user_id}"}
    context 'when a user exists' do
    it 'it returns the user' do
      result = JSON(response.body)
      expect(result.length).to eq(3)
      expect(result).not_to be_empty
    end
    it 'returns the status code 200' do
     expect(response).to have_http_status(200)
    end
   end
#    context 'when the user does not exist' do
    
#     let(:user_id) { 1045 }
#     it 'returns status code 404' do
#       expect(response).to have_http_status(404)
#     end
#     it 'returns an error message' do
#         result = JSON(response.body)
#       expect(result).to match(/Couldn't find User/)
#     end
#    end
  end
#   describe 'POST /api/v1/users' do
#     let(:user) { {username: 'RoseSumba', email: 'rose8@gmail.com', password: '123456'}}
#     context 'when the request is valid' do
#       before { post '/api/v1/users', params: user}
#       it 'creates a user' do
#         expect(json['username']).to eq('RoseSumba')
#       end

#       it 'returns status code 201' do
#         expect(response).to have_http_status(201)
#       end
#     end
#   end
#   describe 'PUT /api/v1/users/:id' do
#     let(:valid_attributes) { { username: 'HenrySumba' } }

#     context 'when the record exists' do
#       before { put "/api/v1/users/#{user_id}", params: valid_attributes }

#       it 'updates the record' do
#         result = JSON(response.body)
#         expect(result).to be_empty
#       end

#       it 'returns status code 204' do
#         expect(response).to have_http_status(204)
#       end
#     end
#   end


end