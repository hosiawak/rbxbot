require 'rubygems'
require 'tryruby'
require 'json'
require 'httparty'
code = "puts 'hello'"
resp = HTTParty.post("http://rbx.emacscasts.org", :body => { :cmd => code})
h = JSON.load(resp.body)
puts h.inspect
