require 'bundler'
Bundler::GemHelper.install_tasks

desc 'Push to local Gem repository'
task :push => :build do
  puts `gem inabox`
end
