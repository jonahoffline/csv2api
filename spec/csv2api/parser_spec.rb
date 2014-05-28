require 'spec_helper'

describe CSV2API::Parser do
  let(:csv) { CSV2API::Parser }
  let(:fixture) { load_fixture('transaction') }

  describe '#parse' do
    it 'returns an Array' do
      csv_parse = csv.new(fixture)
      expect(csv_parse.all).to be_an(Array)
    end

    context 'each item inside the Array' do
      it 'contains a Hash' do
        csv_parse = csv.new(fixture)
        expect(csv_parse.all.first).to be_a(Hash)
      end
    end
  end
end
