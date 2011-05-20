require 'sinatra'
require './tryruby'
require 'json'

get '/' do
  content_type :json
  cmd = Addressable::URI.unescape(params[:cmd])
  r = TryRuby.run_line(cmd)
  {
    :type => r.type,
    :output => r.output,
    :result => r.result.inspect,
    :error => r.error.inspect
  }.to_json
end
