class Help
  include Cinch::Plugin

  listen_to :channel
  prefix /^@/
  match /help/, :method => :help
  match /(\w+)$/, :method => :not_found

  def help(m)
    m.reply "@vm code -> runs code on vm eg. @ 1 + 2 also: @j @j19 @18 @19"
    m.reply "@slap person -> slaps the person in question"
  end

  def not_found(m,command)
    m.reply "unrecognized command @#{command}, type @help for available commands"
  end

end
