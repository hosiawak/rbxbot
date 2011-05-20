require 'cinch'
require './code_runner'
require './slap'
require './help'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = 'irc.freenode.net'
    c.user = 'rbxbot'
    c.nick = 'rbxbot'
    c.channels = ['#rbxbot']
  end

  on :message, "@help" do |m|
    m.reply Help.help
  end

  on :message, /@slap (\w+)/ do |m,nick|
    m.reply Slap.slap(nick)
  end

  on :message, /@(x|rbx|rubinius|j|jruby|jruby19|r|r18|ruby18|r19|ruby19|m|maglev)? (.+)/ do |m,vm,code|
    vm ||= 'x'
    m.reply CodeRunner.run(code,vm)
  end

end

bot.start
