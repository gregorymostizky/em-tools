#encoding: utf-8

# load fiber pool
require_relative 'em-tools/fiber'
require_relative 'em-tools/fast_pool'

# load sinatra integration
require_relative 'em-tools/sinatra_fast_pool'

# load EM::Synchrony.wait_callback method
require_relative 'em-tools/em_synchrony_patches'