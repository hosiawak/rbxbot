class Quietude
  include Cinch::Plugin

  MSG = []
  MSG << "Only in quiet waters do things mirror themselves undistorted."
  MSG << "Only in a quiet mind is adequate perception of the world."
  MSG << "Either remain quiet, or say things that improve the silence."
  MSG << "Quiet rivers have flowery banks."
  MSG << "The heart of the wise man lies quiet like limpid water."
  MSG << "Don't underestimate the determination of a quiet person."
  MSG << "When a cricket is quiet, it is digging."
  MSG << "A quiet tongue shows a wise head."
  MSG << "Quiet streams erode the shore."
  MSG << "Who stays quiet agrees."
  MSG << "Quiet horses kick the hardest."
  MSG << "Let's be quiet, we'll get some fish."
  MSG << "Keep quiet and people will think you're a philosopher."
  MSG << "Quietness is best."
  MSG << "Quietness is a great treasure."
  MSG << "Sitting quietly, doing nothing, spring comes, and the grass grows by itself."
  MSG << "Who lives in a quiet house has plenty."
  MSG << "Quiet water wears down a mountain."
  MSG << "In quietness and in confidence shall be your strength."

  PAUSE = 45*60
  listen_to :channel
  prefix /^/
  match /.+/, :method => :quietude

  def quietude(m)
    @channels ||= { }
    if t = @channels[m.channel.name]
      t.kill if t.alive?
    end
    @channels[m.channel.name] = Thread.new do
      sleep PAUSE
      m.reply MSG.sample
    end
  end

end
