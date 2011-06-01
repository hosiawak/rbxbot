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
  MSG << "Much silence and a good disposition, there are no two works better than those."
  MSG << "Still waters run deep."
  MSG << "Quiet minds cannot be perplexed or frightened, but go on in fortune or misfortune at their own private pace, like a clock in a thunderstorm."
  MSG << "The sole cause of man's unhappiness is that he does not know how to stay quietly in his room."
  MSG << "Sit in reverie and watch the changing color of the waves that break upon the idle seashore of the mind."
  MSG << "Reverie is when ideas float in our mind without reflection or regard of the understanding."
  MSG << "The good and the wise lead quiet lives."
  MSG << "An inability to stay quiet is one of the conspicuous failings of mankind."
  MSG << "Quiet people are well able to look after themselves."
  MSG << "Be plain in dress, and sober in your diet; In short, my deary! kiss me, and be quiet."
  MSG << "When silent men speak they speak to the purpose."
  MSG << "A silent man is the best one to listen to."
  MSG << "He who talks to a silent listener will soon stand naked."
  MSG << "Speaking is silver, being silent is gold."
  MSG << "Waves will rise on silent water."
  MSG << "There is a time to speak and a time to be silent."
  MSG << "There are five ways in which to become wise: be silent, listen, remember, grow older and study."
  MSG << "The greatest crime in a desert is to find water and keep silent about it."
  MSG << "Deep rivers move with silent majesty, shallow brooks are noisy."
  MSG << "Silent tongue and hempen heart often go together."
  MSG << "The silent are often guilty."
  MSG << "From a silent man, and a dog that does not bark, deliver us."
  MSG << "He who is silent gains store."
  MSG << "I never saw a silent rich man."
  MSG << "If you want to annoy the devil stay silent."
  MSG << "A silent man is not a conquered man."
  MSG << "More silent than the earth."
  MSG << "One who keeps silent, endures."
  MSG << "The lion which moves silently is the one that eats meat."
  MSG << "A silent woman is always more admired than a noisy one."
  MSG << "Hear, see, and be silent."

  PAUSE = 45*60
  listen_to :channel
  prefix /^/
  match /.+/, :method => :quietude

  def quietude(m)
    if m.channel
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

end
