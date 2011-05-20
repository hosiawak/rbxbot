require 'json'
require 'httparty'
require 'addressable/uri'

module CodeRunner

  def run_code(code,vm)
    case vm
      when 'x', 'rbx', 'rubinius'
      exec_at('http://rbx.emacscasts.org', code)
      when 'j', 'j18', 'jruby'
      exec_at('http://jruby.emacscasts.org', code)
      when 'j19', 'jruby19'
      exec_at('http://jruby19.emacscasts.org', code)
      when 'r', 'r18', 'ruby18'
      exec_at('http://ruby18.emacscasts.org', code)
      when 'r19', 'ruby19'
      exec_at('http://ruby19.emacscasts.org', code)
#      when 'm', 'maglev'
#      exec_at('http://maglev.emacscasts.org', code)
    end
  end

  protected

  def exec_at(url, code)
    resp = HTTParty.post(url, :body => { :cmd => code})
    if resp.code != 200
      "I'm busy, ask someone else."
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
