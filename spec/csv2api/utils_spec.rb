require 'spec_helper'

describe CSV2API::Utils do
  let(:utils) { CSV2API::Utils }
  let(:artists) do
    [
      {
        id: 1,
        name: 'Kyary Pamyu Pamyu',
        kawaii: true
      },
      {
        id: 2,
        name: 'Lady Gaga',
        kawaii: false
      }
    ]
  end

  describe '.csv_files' do
    it 'returns csv files from file path' do
      files = %w(./spec/fixtures/tasks.csv ./spec/fixtures/transaction.csv)
      expect(utils.csv_files('./spec/fixtures')).to match_array(files)
    end
  end

  describe '.file_names' do
    context 'when extension is set to false (default)' do
      it 'returns filenames without file extension' do
        expect(utils.file_names('./spec/fixtures'))
          .to match_array(%w(tasks transaction))
      end

    end

    context 'when extension is set to true' do
      it 'returns filenames with file extension' do
        expect(utils.file_names('./spec/fixtures', extension: true))
        .to match_array(%w(tasks.csv transaction.csv))
      end
    end
  end

  describe '.generate_json' do
    context 'when pretty is set to false (default)' do
      it 'returns a JSON object' do
        expect(utils.generate_json(artists.last))
          .to eq("{\"id\":2,\"name\":\"Lady Gaga\",\"kawaii\":false}")
      end
    end

    context 'when pretty is set to true' do
      it 'returns a pretty JSON object' do
        hash =
'{
  "id": 1,
  "name": "Kyary Pamyu Pamyu",
  "kawaii": true
}'
        expect(utils.generate_json(artists.first, pretty: true)).to eq(hash)
      end
    end
  end
end
