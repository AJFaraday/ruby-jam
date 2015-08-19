require 'gosu'
class KeyBinding

  GLOBAL_BINDINGS = {
    timer: Gosu::KbSpace,
    music: Gosu::KbPeriod,
    close: Gosu::KbEscape
  }

  PANELLIST_BINDINGS = [
    {up: Gosu::KbQ, down: Gosu::KbA},
    {up: Gosu::KbW, down: Gosu::KbS},
    {up: Gosu::KbE, down: Gosu::KbD},
    {up: Gosu::KbR, down: Gosu::KbF}
  ]

  def self.[](action)
    action = action.to_sym
    GLOBAL_BINDINGS[action]
  end

  def self.panellist(index, action)
    action = action.to_sym
    PANELLIST_BINDINGS[index][action]
  end

end