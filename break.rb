# frozen_string_literal: true

require './timer_base'
SHORT_MINUTES = 5
LONG_MINUTES = 15

# 休憩クラス
class Break < TimerBase
  def initialize(type:)
    minutes = case type
              when :short
                SHORT_MINUTES
              when :long
                LONG_MINUTES
              end
    super(minutes: minutes)
  end
end
