# frozen_string_literal: true

require './timer_base'

# テストタイマークラス
class TestTimerRun
  def self.test(minutes:)
    timer = TimerBase.new(minutes: minutes)
    timer.run
  end
end

puts '時間を入力してください'
t = gets.to_i
TestTimerRun.test(minutes: t)
