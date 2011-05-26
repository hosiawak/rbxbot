require 'json'
require 'httparty'

class CodeRunner
  include Cinch::Plugin

  listen_to :message
  prefix /^@/
  match /(x|j|j19|18|19|a)? (.+)/, :method => :run_code

  MAX_LENGTH = 400

  def run_code(m,vm,code)
    vm ||= 'x' # run rbx by default
    msg = case vm
          when 'x'
            exec_at('http://localhost:9500', code)
          when 'j'
            exec_at('http://localhost:9501', code)
          when 'j19'
            exec_at('http://localhost:9502', code)
          when '18'
            exec_at('http://localhost:9503', code)
          when '19'
            exec_at('http://localhost:9504', code)
          when 'a'
            exec_at('http://localhost:9505/atomy', code)
          end
    m.reply(msg[0..MAX_LENGTH])
  end

  protected

  def exec_at(url, code)
    resp = HTTParty.post(url, :body => { :cmd => code})
    if resp.code != 200
      busy_msg
    else
      h = JSON.load(resp.body)
      case h['type']
      when "standard"
        if h['result'] != "nil"
          h['result']
        else
          h['output'].empty? ? h['result'] : h['output']
        end
      when 'error'
        h['error']
      when 'illegal'
        "You are not allowed to run that command."
      end
    end
  rescue Exception
    busy_msg
  end

  def busy_msg
    "I'm busy, ask someone else."
  end
end
