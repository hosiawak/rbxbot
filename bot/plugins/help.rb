class Help
  include Cinch::Plugin

  listen_to :channel
  prefix /^/
  match /@help/, :method => :help
  match /rbxbot:.+/, :method => :nice_to_meet

  HELP_URL = "https://github.com/hosiawak/rbxbot/blob/master/COMMANDS"

  def help(m)
    m.reply HELP_URL
  end

  def nice_to_meet(m)
    m.reply "#{m.user.nick}: Hello, I'm a bot, my commands are here #{HELP_URL}"
  end
end
