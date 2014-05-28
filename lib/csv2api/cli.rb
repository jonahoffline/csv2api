require 'optparse'
require 'ostruct'

module CSV2API
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # A Simple class for the executable version of the gem
  class CLI
    include CSV2API::Utils
    # Displays example use when running the command-line application
    BANNER = <<MSG
Usage: csv2api [OPTION] [ARGS]
Description:
CSV2API, Auto-creates API endpoints from csv files

Options:
MSG
    # @!attribute options
    # @return [String] options for api settings
    attr_accessor :options

    # Passes arguments from ARGV
    # @param args [Array<String>] The command-line arguments
    def initialize(args)
      @args = args
      @options = Options.new
    end

    # Configures the arguments for the command
    # @param opts [OptionParser]
    def default_options(opts)
      opts.version, opts.banner = CSV2API::VERSION, BANNER
      opts.set_program_name 'CSV2API'

      opts.on_head('-d', '--directory [DIRECTORY]', String,
                   'load csv files from directory (default)') do |dir|
        options.directory = dir
      end

      opts.on_tail('-v', '--version',
                   'display the version of CSV2API and exit') do
        puts opts.ver
        exit
      end

      opts.on_tail('-h', '--help', 'print this help') do
        puts opts.help
        exit
      end
    end

    # Returns actual directory when no argument is passed
    # @return [File] directory path
    def directory
      options.directory ? options.directory : '.'
    end

    # Checks if argument passed is a directory
    # @return [TrueClass, FalseClass]
    def directory?
      FileTest.directory?(options.directory)
    end

    # Checks if argument passed is a file
    # @return [TrueClass, FalseClass]
    def file?
      FileTest.file?(options.file) unless options.file.nil?
    end

    # Returns a file or a directory
    # @return [File] source containing csv data
    def read_source
      file? ? File.read(options.file) : Dir.entries(directory)
    end

    # Configures load path for CSV sources
    def load_path
      ENV['CSV2API_ROOT'] = directory
    end

    # Returns text when server is loading
    def server_loading_info
      files = file_names(directory)
      text = files.map do |csv|
        "#{csv}.csv - http://localhost:4567/#{csv}"
      end

      text << "\n"
      text.unshift("#{files.count} files detected. Creating API endpoints...")
      text.unshift('Starting CSV2API...')
      puts text
    end

    # Loads API Server
    def load_server
      load_path
      server_loading_info
      CSV2API::Server.run!
    end

    # Parses options sent from command-line
    def parse
      opts = OptionParser.new(&method(:default_options))
      opts.parse!(@args)
      load_server
    end
  end
  # A Simple Struct class for storing options
  Options = Struct.new(:file, :directory)
end
