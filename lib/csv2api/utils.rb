require 'json'

module CSV2API
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # Utility module with helper methods
  module Utils
    def self.included(base)
      base.extend(self)
    end
    module_function

    # Extracts the csv files from path
    # @param file_path [IO] file path
    # @return [Array<String>] path with csv files
    def csv_files(file_path)
      Dir.glob("#{file_path}/*.csv")
    end

    # Extracts the csv filename from collection
    # @param file_path [IO] file path
    # @param extension [TrueClass, FalseClass] return extension
    # @return [Array<String>] csv filenames with or out .csv extension
    def file_names(file_path, extension: false)
      csv_files(file_path).map do |file|
        file_name = file[/(\w*.csv)/]
        extension ? file_name : file_name[0..-5]
      end
    end

    # Converts a hash into a stringified json format
    # @param hash [Hash] hash to converted into json format
    # @param pretty [TrueClass, FalseClass] pretty json option
    # @return [JSON<String>] stringified json
    def generate_json(hash, pretty: false)
      pretty ? JSON.pretty_generate(hash) : JSON.generate(hash)
    end

    # Helper method for opening a csv file
    # @param path [String] file path
    # @param filename [String] file name in path to open
    # @return [File] csv file
    def load_csv(path, filename)
      File.read("#{path}/#{filename}.csv")
    end

    # Sanitizes key names for column headers
    # @param csv [Array<Hash>] csv data
    # @return [Array<String>] column header names
    def sanitize_column_headers(csv)
      csv.first.keys.map { |col| col.to_s.titleize }
    end
  end
end
