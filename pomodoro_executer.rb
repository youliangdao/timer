# frozen_string_literal: true

require './pomodoro'
require './short_break'
require './long_break'

# ポモドーロタイマークラス
class PomodoroExecuter
  def initialize
    @pomodoro_count = 0
    @short_break_count = 0
    @long_break_count = 0
    @four_pomodoro_cycle_count = 0
  end

  def run
    loop do
      pomodoro_cycle_with_logs
      long_break_with_logs
      @four_pomodoro_cycle_count += 1
      puts "4ポモドーロセット#{(((MINUTES + SHORT_MINUTES) * 4) + LONG_MINUTES) * @four_pomodoro_cycle_count}分経過"
    end
  end

  private

  def pomodoro_cycle_with_logs
    4.times do |i|
      pomodoro_with_logs
      short_break_with_logs
      i += 1
      puts "ポモドーロセット#{(MINUTES + SHORT_MINUTES) * i}分経過"
    end
  end

  def pomodoro_with_logs
    @pomodoro_count += 1
    puts "ポモドーロ#{@pomodoro_count}回目スタート"
    Pomodoro.new.run
    puts "ポモドーロ#{@pomodoro_count}回目終了（#{MINUTES * @pomodoro_count}分経過）"
  end

  def short_break_with_logs
    @short_break_count += 1
    puts "ショートブレイク#{@short_break_count}回目スタート"
    ShortBreak.new.run
    puts "ショートブレイク#{@short_break_count}回目終了（#{@short_break_count * SHORT_MINUTES}分経過）"
  end

  def long_break_with_logs
    @long_break_count += 1
    puts "ロングブレイク#{@long_break_count}回目スタート"
    LongBreak.new.run
    puts "ロングブレイク#{@long_break_count}回目終了（#{@long_break_count * LONG_MINUTES}分経過）"
  end
end
