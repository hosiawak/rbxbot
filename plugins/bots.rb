class Bots
  include Cinch::Plugin

  listen_to :channel
  prefix /^@/
  match /bots/, :method => :bots

  def bots(m)
    m.reply ":)"
  end

end
