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
    # @example
    #   If :files contains 'tasks.csv', it will generate an endpoint like:
    #
    #     get '/tasks' do
    #       content_type :json
    #       # (obvious code omitted...)
    #       # (will only return the json version of csv)
    #     end
    #
    #  Endpoint will be reachable at any of the following urls:
    #  http://localhost:4567/tasks or http://localhost:4567/tasks.json
    #
    settings.files.each do |endpoint|
      get "/#{endpoint}.?:format?" do
        content_type :json

        csv_file = load_csv(settings.csv_path, endpoint)
        generate_json(CSV2API::Parser.new(csv_file).all)
      end
    end
  end
end
