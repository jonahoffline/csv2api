require 'spec_helper'
describe CSV2API::Server do
  include Rack::Test::Methods

  def app
    CSV2API::Server
  end

  describe '/tasks' do
    context 'when called with .json extension' do
      it 'returns tasks.csv in json' do
        get '/tasks'
        expect(last_response.body).not_to be_empty
        expect(last_response).to be_ok

        parsed_response = json(last_response.body).first
        expect(parsed_response).to be_a(Hash)
      end
    end

    context 'when called with .xml extension' do
      it 'returns tasks.csv in XML' do
        get '/tasks.xml'
        expect(last_response.body).not_to be_empty
        expect(last_response).to be_ok

        parsed_response = xml(last_response.body)
        expect(parsed_response).to be_a(Hash)
      end
    end
  end

  describe '/transaction' do
    context 'when called without .json extension' do
      it 'returns transaction.csv in json' do
        get '/transaction'
        expect(last_response.body).not_to be_empty
        expect(last_response).to be_ok

        parsed_response = json(last_response.body).first
        expect(parsed_response).to be_a(Hash)
      end
    end

    context 'when called with .xml extension' do
      it 'returns transaction.csv in XML' do
        get '/transaction.xml'
        expect(last_response.body).not_to be_empty
        expect(last_response).to be_ok

        parsed_response = xml(last_response.body)
        expect(parsed_response).to be_a(Hash)
      end
    end
  end
end
