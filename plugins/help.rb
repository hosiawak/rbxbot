class Help
  include Cinch::Plugin

  listen_to :channel
  prefix /^@/
  match /help/, :method => :help
  match /(\w)$/, :method => :not_found

  def help(m)
    m.reply "@vm code -> run code on vm | @ rbx, @j jruby, @j19 jruby 1.9, @18 MRI 1.8.7, @19 MRI 1.9.2\neg. @ puts 'hello world"
    m.reply "@slap nick to slap"
  end

  def not_found(m,command)
    m.reply "unrecognized @{command}, type @help for available commands"
  end

end
