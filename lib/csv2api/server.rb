require 'sinatra/base'
require 'csv2api/utils'
require 'csv2api/server'

module CSV2API
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # Contains the Sinatra-based API Server
  class Server < Sinatra::Base
    include CSV2API::Utils

    configure do
      set :csv_path, ENV['CSV2API_ROOT']
      set :files, file_names(csv_path)
    end

    # Auto-creates endpoints from filenames
    #  Endpoints will be reachable at depending on format
    #
    #    JSON (the default):
    #      http://localhost:4567/tasks
    #      http://localhost:4567/tasks.json
    #
    #    XML:
    #     http://localhost:4567/tasks.xml
    settings.files.each do |endpoint|
      get "/#{endpoint}.?:format?" do
        csv_data = load_data(endpoint)

        if params[:format].eql?('xml')
          content_type :xml
          csv_data.to_xml(root: endpoint)
        else
          content_type :json
          generate_json(csv_data)
        end
      end
    end

    # Loads data for response
    # @param endpoint [String] endpoint name
    # @return [Array<Hash>] csv data
    def load_data(endpoint)
      csv_file = load_csv(settings.csv_path, endpoint)
      CSV2API::Parser.new(csv_file).all
    end
  end
end
