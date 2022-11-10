require 'rails_helper'

RSpec.describe 'Public', type: :request do
  describe 'GET /index' do
    before do
      get '/'
    end

    it 'returns correct response status (ok)' do
      expect(response).to_not have_http_status(:ok)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
