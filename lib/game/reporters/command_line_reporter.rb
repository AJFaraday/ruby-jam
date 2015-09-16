module Game
  module Reporters
    class CommandLineReporter

      # No config here
      def initialize(window, config={})
        @window = window
      end

      def report
        system 'clear'
        puts @window.timer.remaining
      end

    end
  end
end