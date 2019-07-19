require 'rails_helper'

RSpec.describe 'Posts API', type: :request do 
  let!(:posts) { create_list(:post, 10) }

   describe 'GET /posts?tags=tech,health' do
    before { get "/posts?tags=tech,health" }

    it 'returns posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /posts?tags=tech,health&sortBy=#{value}" do
    before { get "/posts?tags=tech,health&sortBy=#{value}" }

    context 'when the sort by criteria exists' do
      it 'returns the posts' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the sort by criteria does not exist' do
      let(:value) { 'incorrectcriteria' }

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end

      it 'returns a invalid criteria message' do
        expect(response.body).to match(/sortBy parameter is invalid/)
      end
    end
  end

end