#encoding: utf-8

# load fiber pool
require_relative 'em_toools/fiber'
require_relative 'em_toools/fast_pool'

# load sinatra integration
require_relative 'em_tools/sinatra_fast_pool'

# load EM::Synchrony.wait_callback method
require_relative 'em_tools/em_synchrony_patches'