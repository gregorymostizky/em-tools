#encoding: utf-8
require_relative 'fast_pool'

require 'async_sinatra'

module Sinatra
  module Async
    module Helpers

      # Patches async sinatra to use fast_pool spawned fibers for every request
      module_eval %[
        alias :__async_catch_execute :async_catch_execute

        @@fb = EventMachine::Tools::FastPool.new
        
        def async_catch_execute(&b)
          @@fb.spawn {__async_catch_execute(&b)}
        end
      ]
      
    end
  end
end