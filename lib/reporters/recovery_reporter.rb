require 'yaml'

class RecoveryReporter

  def initialize(window, config)
    @window = window
    @file = File.open(
      File.join(
        File.dirname(__FILE__),
        '..', '..',
        config['path']
      ),
      'w'
    )
  end

  def report
    scores = @window.panellists.collect(&:score)
    data = {
      remaining_seconds: @window.timer.remaining.to_i,
      scores: scores,
      round: @window.subjects.round_no
    }
    write_file(data)
  end

  def write_file(data)
    @file.truncate(0)
    @file.rewind
    @file.write(data.to_yaml)
  end

end
