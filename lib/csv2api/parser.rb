require 'csv'

module CSV2API
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # Contains methods for parsing CSV files
  class Parser
    # @!attribute [r] file
    # @return [String] parsed csv file
    attr_reader :file

    # Passes file argument down to parser
    # @param file [File, IO] file to parse
    # @return [CSV2API::CSVParse] class instance of self
    def initialize(file)
      @file = parse(file)
    end

    # Parses csv file
    # @param csv_file [File, IO] csv file to parse
    # @return [CSV] parsed csv data
    def parse(csv_file)
      CSV::Converters[:blank_to_nil] = lambda do |field|
        field && field.empty? ? nil : field
      end

      CSV.new(csv_file,
              headers: true, header_converters: :symbol, converters: :all)
    end

    # Returns an array of hashes from csv file
    # @return [Array<Hash>] csv data
    def all
      file.to_a.map { |row| empty?(row.to_hash) }.compact
    end

    # Returns hash unless it's empty
    # @param hash [Hash<Symbol>]
    # @return [Hash<Symbol>] hash
    def empty?(hash)
      hash unless hash.empty?
    end
  end
end
