require 'cinch'
require_relative 'plugins/join_part'
require_relative 'plugins/code_runner'
require_relative 'plugins/source_browser'
require_relative 'plugins/help'
require_relative 'plugins/slap'
require_relative 'plugins/hug'
require_relative 'plugins/quietude'
require_relative 'plugins/bots'

# Bot

bot = Cinch::Bot.new do

  configure do |c|
    c.server = 'irc.freenode.net'
    c.user = 'rbxbot'
    c.nick = 'rbxbot'
    c.channels = %w(#rbxbot rubinius atomo)
    c.plugins.plugins = [JoinPart,CodeRunner,SourceBrowser,Slap,Hug,Help,Quietude,Bots]
  end

end

bot.start
