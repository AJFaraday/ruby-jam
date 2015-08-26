class Timer

  attr_accessor :active, :remaining

  def initialize(window)
    @remaining = 60
    @last_start = Gosu.milliseconds
    @remaining_at_last_start = 60
    @active = false
    @window = window
    @font = Gosu::Font.new(window.x_size / 3)
    @x_pos = @window.x_size / 2
    @y_pos = (@window.y_size / 2) - (@window.y_size / 20)
    @end_sound = Gosu::Sample.new(
      File.join(
        File.dirname(__FILE__),
        '..', '..', 'audio',
        'end_sound.ogg'
      )
    )
  end

  def update
    if @active
      ms_elapsed = Gosu.milliseconds - @last_start
      s_elapsed = ms_elapsed.to_f / 1000.0
      @remaining = @remaining_at_last_start - s_elapsed
      if @remaining <= 0
        stop
        @end_sound.play
      end
    end
  end

  def button_down(id)
    if id == Gosu::KbSpace
      @active ? stop : start
    end
  end

  def draw
    @font.draw_rel(
      display_time, @x_pos, @y_pos,
      0, 0.5, 0.5
    )
  end

  def display_time
    if @remaining > 9.9
      @remaining.to_i
    else
      sprintf('%.1f', @remaining.abs)
    end
  end

  def start
    unless @active
      @active = true
      @last_start = Gosu.milliseconds
      @remaining_at_last_start = @remaining
      @window.panellists.each { |p| p.current = false }
    end
  end

  def stop
    @active = false
  end

end