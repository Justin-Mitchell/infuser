require 'infuseit/helpers/mattr'
require 'infuseit/logger'
require 'infuseit/version'

module Infuseit
  module Configuration

    OPTION_KEYS = [ :api_url, :api_key, :user_agent, :logger ]

    class << self

      mattr_accessor *OPTION_KEYS
      self.user_agent = "Infuseit-#{VERSION} (RubyGem)"
      self.logger     = Infuseit::Logger.new

      # Convenience method to allow configuration options to be set in a block
      def configure
        yield self
      end

      # Create a hash of the option values
      def options
        OPTION_KEYS.each_with_object({}) { |k, sum| sum[k] = send(k) }
      end

    end

  end
end
