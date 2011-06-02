require 'json'
require 'httparty'

class SourceBrowser
  include Cinch::Plugin

  listen_to :channel
  prefix /^/
  match /@source (.+)/, :method => :source

  BACKEND = "http://localhost:9500/source"
  RBX_REPO = "https://github.com/evanphx/rubinius/blob/master/"

  def source(m, method)
    r = lookup(method)
    if r.is_a?(Array)
      file, line = lookup(method)
      m.reply "#{RBX_REPO}#{file}#L#{line}"
    else
      m.reply r
    end
  end

  def lookup(method)
    resp = HTTParty.post(BACKEND, :body => { :m => method})
    if resp.code != 200
      busy_msg(method)
    else
      return JSON.load(resp.body)
    end
  rescue Exception
    busy_msg(method)
  end

  protected
  def busy_msg(method)
    "I could not lookup the source for #{method}"
  end
end
