require "drb"
require "uri"

require "testjour/commands/base_command"
require "testjour/rsync"

module Testjour
  module CLI
  
    class SlaveWarm < BaseCommand
      def self.command
        "slave:warm"
      end
      
      def initialize(parser, args)
        Testjour.logger.debug "Runner command #{self.class}..."
        super
        @queue = @non_options.first
      end
  
      def run
        Testjour::Rsync.copy_to_current_directory_from(@queue)
      end
  
    end

    Parser.register_command SlaveWarm
  end
end
