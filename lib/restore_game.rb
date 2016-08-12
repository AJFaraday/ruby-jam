class RestoreGame

  attr_reader :data

  def self.run(window)
    restorer = self.new(window)
    restorer.run if restorer.data
  end

  def initialize(window)
    @window = window
    file_path = File.join(
      File.dirname(__FILE__),
      '..',
      'data',
      'last.yml'
    )
    @data = YAML.load_file(file_path)
  end

  def run
    puts @data.inspect
    @window.subjects.cursor = @data[:round]
    @window.timer.remaining = @data[:remaining_seconds]
    @data[:scores].each_with_index do |score, index|
      @window.panellists[index].score = score
    end
  end

end
