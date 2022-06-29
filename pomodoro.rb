# frozen_string_literal: true

require './timer_base'
MINUTES = 25

# ポモドーロクラス
class Pomodoro < TimerBase
  def initialize(minutes: MINUTES)
    super
  end
end
