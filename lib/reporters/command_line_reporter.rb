class CommandLineReporter

  attr_accessor :text
  
  # config:
  #   width: Total terminal width
  #   player_width: the size of the box around each panellist
  def initialize(window, config={})
    @window = window
    @width = config['width'] || 100
    @player_width = config['player_width'] || 25
    @panellists = @window.panellists
  end

  def report
    @text = ''
    spacer
    line current_subject.center(@width)
    line display_time.center(@width)
    spacer
    panellists
    spacer
    line "Next: #{next_subject}"
    system 'clear'
    puts @text
  end

  def line(content)
    text << "#{content}\n"
  end
  
  def part_line(content)
    text << content.to_s
  end
  
  def display_time
    if @window.timer.remaining > 4.9
      @window.timer.remaining.ceil.to_s
    else
      sprintf('%.1f', @window.timer.remaining.abs).to_s
    end
  end

  def spacer
    2.times { line '' }
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
    @panellists.each do |panellist|
      data = attr ? panellist.send(attr) : ''
      pad_char = panellist.challenger ? '#' : ' '
      part_line data.to_s.center(@player_width, pad_char)
    end
    line ''
  end

  def current_subject
    @window.subjects.current
  end

  def next_subject
    @window.subjects.preview_next
  end

end
