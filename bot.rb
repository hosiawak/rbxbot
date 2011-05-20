require 'cinch'
require_relative 'plugins/code_runner'
require_relative 'plugins/slap'
require_relative 'plugins/help'

# Plugins

module RbxBot
  class Plugin
    include CodeRunner
    include Help
    include Slap
  end
end

# Bot

bot = Cinch::Bot.new do

  configure do |c|
    c.server = 'irc.freenode.net'
    c.user = 'rbxbot'
    c.nick = 'rbxbot'
    c.channels = ['#rbxbot']
    @admin = "hosiawak"
    @plugin = RbxBot::Plugin.new
  end

  helpers do
    def is_admin?(user)
      true if user.nick == @admin
    end
  end

  on :private, /^@join (.+)/ do |m, channel|
    bot.join(channel) if is_admin?(m.user)
  end

  on :message, /^@part(?: (.+))?/ do |m, channel|
    # Part current channel if none is given
    channel = channel || m.channel

    if channel
      bot.part(channel) if is_admin?(m.user)
    end
  end

  on :message, "@help" do |m|
    m.reply @plugin.help
  end

  on :message, /^@slap (\w+)/ do |m,nick|
    m.channel.action @plugin.slap(nick)
  end

  on :message, /^@(x|rbx|rubinius|j|jruby|j18|j19|jruby19|r|r18|ruby18|r19|ruby19)? (.+)/ do |m,vm,code|
    vm ||= 'x'
    m.reply @plugin.run_code(code,vm)
  end

end

bot.start
