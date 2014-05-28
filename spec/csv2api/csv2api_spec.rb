require 'spec_helper'

describe CSV2API do
  it 'has a version number' do
    expect(CSV2API::VERSION).not_to be nil
  end

  it 'keeps it real homes, you feels me dawg?' do
    expect(true).to eq(true)
  end

  describe 'CSV2API_ROOT' do
    it 'returns environment variable' do
      expect(ENV.fetch('CSV2API_ROOT')).to eq('spec/fixtures')
    end
  end
end
