require 'cinch'
require_relative 'plugins/join_part'
require_relative 'plugins/code_runner'
require_relative 'plugins/help'
require_relative 'plugins/slap'

# Bot

bot = Cinch::Bot.new do

  configure do |c|
    c.server = 'irc.freenode.net'
    c.user = 'rbxbot'
    c.nick = 'rbxbot'
    c.channels = ['#rbxbot']
    c.plugins.plugins = [JoinPart,CodeRunner,Help,Slap]
  end

end

bot.start
