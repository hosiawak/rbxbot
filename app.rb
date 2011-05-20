require 'sinatra'
require './tryruby'
require 'json'

post '/' do
  content_type :json
  cmd = params[:cmd]
  r = TryRuby.run_line(cmd)
  {
    :type => r.type,
    :output => r.output,
    :result => r.result.inspect,
    :error => r.error.inspect
  }.to_json
end
