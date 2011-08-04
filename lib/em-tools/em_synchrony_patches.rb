#encoding: utf-8

module EventMachine
  module Synchrony

    # Allows inlining callbacks based code
    # Similar to EM::Synchrony.sync but doesn't require deferable object to be returned
    #
    # For this to work, make sure that executing code is running in a non-root fiber
    #
    # For example:
    #
    #   redis = EM::Protocols::Redis.connect
    #   result = EM::Synchrony.wait_callback(redis, :get, 'a')
    def self.wait_callback(object, method, *args)
      f = Fiber.current
      object.send(method, *args, &f.method(:resume) )
      Fiber.yield(nil)
    end

  end
end