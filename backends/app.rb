require 'sinatra'
if defined?(RUBY_ENGINE) && RUBY_ENGINE == "rbx"
  require './tryatomy'
  require './source_browser'
end

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

post '/atomy' do
  content_type :json
  cmd = params[:cmd]
  r = TryAtomy.run_line(cmd)
  {
    :type => r.type,
    :output => r.output,
    :result => r.result.inspect,
    :error => r.error.inspect
  }.to_json

end

post '/source' do
  content_type :json
  m = params[:m]
  SourceBrowser.find(m).to_json
end
