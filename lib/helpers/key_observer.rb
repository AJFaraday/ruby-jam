# A key observer will chack a given key with the pressed? method
#
# It will not return true again until the button has been released

class KeyObserver

  # window - the Gosu::GameWindow it's all based on
  # key - the key-code from Gosu e.g. Gosu::KbdSpace
  def initialize(window, key)
    @window = window
    @key = key
  end

  def pressed?
    if @window.button_down?(@key)
      unless @key_down
        @key_down = true
        true
      end
    else
      @key_down = false
      false
    end
  end

end