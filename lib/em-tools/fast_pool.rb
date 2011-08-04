#encoding: utf-8

require_relative 'fiber'

module EventMachine

  module Tools

    # A fiber pool - eliminates the need to create a fiber every time a new one is needed - which is a relatively slow operation
    # A number of fibers is configurable on initialization
    # If client "spawns" new fiber but none are available, the request will wait in queue for an existing fiber to free up
    class FastPool

      # gives access to the currently free fibers
      attr_reader :fibers

      # Prepare a list of fibers that are able to run different blocks of code
      # every time. Once a fiber is done with its block, it attempts to fetch
      # another one from the queue
      def initialize(count = 100)
        @fibers, @queue = [], []
        count.times do |i|
          fiber = Fiber.new do |block|
            loop do
              block.call
              unless @queue.empty?
                block = @queue.shift
              else
                @fibers.unshift Fiber.current
                block = Fiber.yield(nil)
              end
            end
          end
          @fibers << fiber
        end
      end

      # If there is an available fiber use it, otherwise, leave it to linger
      # in a queue
      def spawn(&block)
        if fiber = @fibers.shift
          fiber.resume(block)
        else
          @queue << block
        end
        self # we are keen on hiding our queue
      end

    end
  end

end
