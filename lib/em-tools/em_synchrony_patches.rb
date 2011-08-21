#encoding: utf-8
require 'fiber'

class Fiber

  # make sure that resume happens after the yield
  def resume_next_tick(*args)
    EM.next_tick { resume(*args) }
  end

end

module EventMachine
  module Synchrony
    class << self

      # Allows inlining callbacks based code
      # Similar to EM::Synchrony.sync but doesn't require deferable object to be returned
      #
      # For this to work, make sure that executing code is running in a non-root fiber
      #
      # For example:
      #
      #   redis = EM::Protocols::Redis.connect
      #   result = EM::Synchrony.wait_callback(redis, :get, 'a')
      def wait_callback(object, method, *args)
        f = Fiber.current
        object.send(method, *args, &f.method(:resume_next_tick))
        Fiber.yield(nil)
      end


      #
      def test_mode!
        puts '++EM TEST MODE++'

        class << self

          remove_method :wait_callback
          define_method :wait_callback do |object, method, *args|
            object.send(method, *args)
          end

        end
      end

    end
  end
end