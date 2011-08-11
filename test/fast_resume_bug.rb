require 'em-synchrony'
require_relative '../lib/em-tools/em_synchrony_patches'

class FastYield

  def fast_yield
    yield 5 if block_given?
  end

end

EM.synchrony do
  fy = FastYield.new
  puts EM::Synchrony.wait_callback(fy, :fast_yield)
end

