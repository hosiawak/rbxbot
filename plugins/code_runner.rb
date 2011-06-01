require 'json'
require 'httparty'

class CodeRunner
  include Cinch::Plugin

  listen_to :message
  prefix /^@/
  match /(x|j|j19|18|19|a)? (.+)/, :method => :run_code

  MAX_LENGTH = 400

  BACKENDS = {
    'x'   => 'http://localhost:9500',
    'j'   => 'http://localhost:9501',
    'j19' => 'http://localhost:9502',
    '18'  => 'http://localhost:9503',
    '19'  => 'http://localhost:9504',
    'a'   => 'http://localhost:9505/atomy'
  }

  def run_code(m,vm,code)
    vm ||= 'x' # run rbx by default

    if code =~ /^https:\/\/gist.github.com\/\d+/
      url = code
      msg = exec_at(backend_for(vm), get_gist(url))
    else
      msg = exec_at(backend_for(vm), code)
    end

    m.reply(msg[0..MAX_LENGTH])
  end

  protected

  def backend_for(vm)
    BACKENDS[vm]
  end

  def get_gist(url)
    resp = HTTParty.get("#{url}.txt")
    if resp.code != 200
      gist_busy_msg
    else
      return resp.body
    end
  rescue Exception
    gist_busy_msg
  end

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

  def gist_busy_msg
    'puts "Could not load the gist, try later"'
  end
end
