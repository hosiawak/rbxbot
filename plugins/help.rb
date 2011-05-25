class Help
  include Cinch::Plugin

  listen_to :channel
  prefix /^@/
  match /help/, :method => :help

  def help(m)
    m.reply "@vm code -> runs code on vm eg. @ 1 + 2 also: @j @j19 @18 @19"
    m.reply "@slap person -> slaps the person in question"
  end

end
