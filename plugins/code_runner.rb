require 'json'
require 'httparty'

class CodeRunner
  include Cinch::Plugin

  listen_to :message
  prefix /^@/
  match /(x|j|j19|18|19)? (.+)/, :method => :run_code

  def run_code(m,vm,code)
    vm ||= 'x' # run rbx by default
    m.reply case vm
            when 'x'
              exec_at('http://rbx.emacscasts.org', code)
            when 'j'
              exec_at('http://jruby.emacscasts.org', code)
            when 'j19'
              exec_at('http://jruby19.emacscasts.org', code)
            when '18'
              exec_at('http://ruby18.emacscasts.org', code)
            when '19'
              exec_at('http://ruby19.emacscasts.org', code)
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
        if h['result'] != "nil"
          h['result']
        else
          h['output']
        end
      when 'error'
        h['error']
      when 'illegal'
        "You are not allowed to run that command."
      end
    end
  end
end
