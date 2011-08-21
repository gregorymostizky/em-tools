require 'em-synchrony'
require_relative '../lib/em-tools/em_synchrony_patches'


EM::Synchrony.test_mode!

puts EM::Synchrony.wait_callback("hello", :to_s)
