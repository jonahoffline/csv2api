require 'spec_helper'
require 'ostruct'
describe CSV2API::Server do
  include Rack::Test::Methods

  def app
    CSV2API::Server
  end

  describe '/tasks' do
    it 'returns tasks.csv in json' do
      get '/tasks'
      expect(last_response.body).not_to be_empty
      expect(last_response).to be_ok
    end
  end

  describe '/transaction' do
    it 'returns transaction.csv in json' do
      get '/transaction'
      expect(last_response.body).not_to be_empty
      expect(last_response).to be_ok
    end
  end
end
