require 'json'
require 'httparty'
require 'addressable/uri'

class CodeRunner

  def self.run(code,vm)
    case vm
      when 'x', 'rbx', 'rubinius'
      exec_at('http://rbx.emacscasts.org', code)
      when 'j', 'jruby'
      exec_at('http://jruby.emacscasts.org', code)
      when 'jruby19'
      exec_at('http://jruby19.emacscasts.org', code)
      when 'r', 'r18', 'ruby18'
      exec_at('http://ruby18.emacscasts.org', code)
      when 'r19', 'ruby19'
      exec_at('http://ruby19.emacscasts.org', code)
      when 'm', 'maglev'
      exec_at('http://maglev.emacscasts.org', code)
    end
  end

  protected

  def self.exec_at(url, code)
    resp = HTTParty.post(url, :body => { :cmd => code})
    if resp.code != 200
      "HTTP Connection problem"
    else
      h = JSON.load(resp.body)
      case h['type']
      when "standard"
        h['result']
      when 'error'
        h['error']
      end
    end
  end
end
