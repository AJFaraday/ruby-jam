module Game

  class SubjectStore

    def initialize(config)
      file = File.open(
        File.join(
          File.dirname(__FILE__),
          '..', '..', 'topics',
          "#{config.topics}.txt"
        )
      )
      @subjects = []
      file.each_line { |l| @subjects << l.strip }
      @cursor = 0
    end

    def current
      @subjects[@cursor]
    end

    def next
      target = @subjects[@cursor + 1]
      if target
        @subjects[@cursor += 1]
      else
        puts "Final topic reached"
        current
      end
    end

    def previous
      target = @cursor - 1
      if target >= 0
        @subjects[@cursor -= 1]
      else
        puts "First topic reached"
        current
      end
    end

  end

end