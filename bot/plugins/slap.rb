# slapping messages courtesy of lambdabot
# https://github.com/seliopou/lambdabot

class Slap
  include Cinch::Plugin

  ME_SLAP = []
  ME_SLAP << "slaps %s"
  ME_SLAP << "smacks %s about with a large trout"
  ME_SLAP << "beats up %s"
  ME_SLAP << "pokes %s in the eye"
  ME_SLAP << "orders her trained monkeys to punch %s"
  ME_SLAP << "smashes a lamp on %s's head"
  ME_SLAP << "hits %s with a hammer, so they breaks into a thousand pieces"
  ME_SLAP << "throws some pointy lambdas at %s"
  ME_SLAP << "loves %s, so no slapping"
  ME_SLAP << "would never hurt %s !"
  ME_SLAP << "clobbers %s with an untyped language"
  ME_SLAP << "pulls %s through the Evil Mangler"
  ME_SLAP << "secretly deletes %s's source code"
  ME_SLAP << "places her fist firmly on %s's jaw"
  ME_SLAP << "locks up %s in a Monad"
  ME_SLAP << "submits %s's email address to a dozen spam lists"
  ME_SLAP << "moulds %s into a delicous cookie, and places it in her oven"
  ME_SLAP << "jabs %s with a C pointer"
  ME_SLAP << "is overcome by a sudden desire to hurt %s"
  ME_SLAP << "karate-chops %s into two equally sized halves"
  ME_SLAP << "pushes %s from his chair"
  ME_SLAP << "hits %s with an assortment of kitchen utensils"
  ME_SLAP << "slaps %s with a slab of concrete"
  ME_SLAP << "puts on her slapping gloves, and slaps %s"
  ME_SLAP << "decomposes %s into several parts using the Banach-Tarski theorem and reassembles them to get two copies of %s !"

  MSG_SLAP = []
  MSG_SLAP <<  "why on earth would I slap %s?"
  MSG_SLAP <<  "*SMACK*, *SLAM*, take that %s!"
  MSG_SLAP <<  "go slap %s yourself"
  MSG_SLAP <<  "I'd rather not; %s looks rather dangerous."
  MSG_SLAP <<  "Come on, let's all slap %s"
  MSG_SLAP <<  "%s, is it done yet?"
  MSG_SLAP <<  "%s: http://asset.soup.io/asset/1571/5605_2788_597.png"

  listen_to :channel
  prefix /^@/
  match /slap (.+)/, :method => :slap

  def slap(m,nick)
    if rand(10) > 2
      m.channel.action my_slap % nick
    else
      m.reply msg_slap % nick
    end
  end

  protected

  def my_slap
    ME_SLAP.sample
  end

  def msg_slap
    MSG_SLAP.sample
  end
end
