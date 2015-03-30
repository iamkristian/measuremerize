require 'benchmark'
require 'json'
require "measuremerize/version"

module Measuremerize

  def self.measure(no_gc_arg = false, &block)
    no_gc = (ARGV[0] == '--no-gc') || no_gc_arg

    if no_gc
      GC.disable
    else
      GC.start
    end

    memory_before = Measuremerize.memory_used
    gc_stat_before = GC.stat
    time = Benchmark.realtime do
      yield
    end

    gc_stat_after = GC.stat
    GC.start unless no_gc
    memory_after = Measuremerize.memory_used
    result = Measuremerize.result(no_gc, time, gc_stat_before, gc_stat_after, memory_before, memory_after)
    puts result
  end

  def self.memory_used
    `ps -o rss= -p #{Process.pid}`.to_i/1024
  end

  private

  def self.result(no_gc, time, gc_stat_before, gc_stat_after, memory_before, memory_after)
    {
      RUBY_VERSION => {
        gc: no_gc ? 'disabled' : 'enabled',
        time: time.round(2),
        gc_count: gc_stat_after[:count] - gc_stat_before[:count],
        memory: "%dM" % (memory_after- memory_before)
      }
    }
  end
end
