class Bots
  include Cinch::Plugin

  listen_to :channel
  prefix /^@/
  match /bots/, :method => :help

  def bots(m)
    m.reply ":)"
  end

end
