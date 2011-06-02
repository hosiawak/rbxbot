class Admin
  include Cinch::Plugin

  listen_to :private
  prefix /^@/
  match /join (.+)/, :method => :join
  match /part(?: (.+))?/, :method => :part
  match /nick (.+)/, :method => :nick
  match /identify (.+)/, :method => :identify
  match /quit/, :method => :quit

  def initialize(*args)
    super
    @admins = ["hosiawak"]
  end

  def check_user(user)
    user.refresh # be sure to refresh the data, or someone could steal
                 # the nick
    @admins.include?(user.authname)
  end

  def join(m, channel)
    return unless check_user(m.user)
    Channel(channel).join
  end

  def part(m, channel)
    return unless check_user(m.user)
    channel ||= m.channel
    Channel(channel).part if channel
  end

  def nick(m, nick)
    return unless check_user(m.user)
    bot.nick = nick
  end

  def identify(m, password)
    return unless check_user(m.user)
    User("NickServ").send("identify #{password}")
  end

  def quit(m)
    return unless check_user(m.user)
    bot.quit("Goodbye")
  end
end
