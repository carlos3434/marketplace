require 'rails_helper'

RSpec.describe 'Items', type: :request do
  # initialize test data
  let!(:items) { create_list(:item, 10) }
  let(:item_id) { items.first.id }
  let(:user) { FactoryBot.create(:user, username: 'acushla', password: 'password', email:'items@gmail.com') }

  describe 'GET /items' do
    before { get '/api/v1/items', headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }

    it 'returns items' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /items/:id' do
    before { get "/api/v1/items/#{item_id}", headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }

    context 'when item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item item' do
        expect(json['id']).to eq(item_id)
      end
    end

    context 'when item does not exist' do
      let(:item_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Item with 'id'=0")
      end
    end
  end

  describe 'POST /items/:id' do
    let!(:history) { create(:category) }
    # let!(:user1) { create(:user) }
    let(:valid_attributes) do
      { name:'item 1', price: '555', brand:'acme', warantine_time:'124', strength:'124',flavor:'test',size:'123',
        category_id: history.id }
    end

    context 'when request attributes are valid' do
      before { post '/api/v1/items', params: valid_attributes, headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post '/api/v1/items', params: {}, headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to include("can't be blank")
      end
    end
  end

  describe 'PUT /items/:id' do
    let(:valid_attributes) { { name: 'item 2' } }

    before { put "/api/v1/items/#{item_id}", params: valid_attributes, headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_item = Item.find(item_id)
        expect(updated_item.name).to match(/item 2/)
      end
    end

    context 'when the item does not exist' do
      let(:item_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Item with 'id'=0")
      end
    end
  end

  describe 'DELETE /items/:id' do
    before { delete "/api/v1/items/#{item_id}", headers: { 'Authorization' => AuthenticationTokenService.call(user.id) } }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
