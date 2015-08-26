require 'gosu'
class KeyBinding

  GLOBAL_BINDINGS = {
    timer: Gosu::KbSpace,
    music: Gosu::KbPeriod,
    close: Gosu::KbEscape,
    prev_subject: Gosu::KbO,
    next_subject: Gosu::KbP
  }

  PANELLIST_BINDINGS = [
    {up: Gosu::KbQ, down: Gosu::KbA, buzz: Gosu::Kb1},
    {up: Gosu::KbW, down: Gosu::KbS, buzz: Gosu::Kb2},
    {up: Gosu::KbE, down: Gosu::KbD, buzz: Gosu::Kb3},
    {up: Gosu::KbR, down: Gosu::KbF, buzz: Gosu::Kb4}
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