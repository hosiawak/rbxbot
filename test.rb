require 'rubygems'
require 'tryruby'

puts TryRuby.run_line('t=[]; 500000.times { t << Thread.new { 2**498739835743} }; t.each {|x| x.join}').inspect
