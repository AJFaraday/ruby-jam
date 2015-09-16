module Game
  module Reporters
    class CommandLineReporter

      # No config here
      def initialize(window, config={})
        @window = window
        @width = config[:width] || 100
        @player_width = config[:player_width] || 25
      end

      def report
        system 'clear'
        spacer
        puts current_subject.center(@width)
        puts display_timer.center(@width)
        spacer
        panellists
        spacer
        puts "Next: #{next_subject}"
      end

      def spacer
        2.times {puts ''}
      end

      def panellists
        show_panellists_attr(nil)
        show_panellists_attr(:name1)
        show_panellists_attr(:name2)
        show_panellists_attr(nil)
        show_panellists_attr(:score)
        show_panellists_attr(nil)
      end

      def show_panellists_attr(attr=nil)
        @window.panellists.each do |panellist|
          data = attr ? panellist.send(attr) : ''
          pad_char = panellist.challenger ? '#' : ' '
          print data.to_s.center(@player_width, pad_char)
        end
        puts ''
      end

      def display_timer
        @window.timer.remaining.to_s
      end

      def current_subject
        @window.subjects.current
      end

      def next_subject
        @window.subjects.preview_next
      end

    end
  end
end