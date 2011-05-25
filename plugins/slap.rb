# slapping messages courtesy of lambdabot
# https://github.com/seliopou/lambdabot

class Slap
  include Cinch::Plugin

  MY_SLAP = []
  MY_SLAP << "slaps %s"
  MY_SLAP << "smacks %s about with a large trout"
  MY_SLAP << "beats up %s"
  MY_SLAP << "pokes %s in the eye"
  MY_SLAP << "activates her slap-o-matic..."
  MY_SLAP << "orders her trained monkeys to punch %s"
  MY_SLAP << "smashes a lamp on possesiveForm %s head"
  MY_SLAP << "hits %s with a hammer, so they breaks into a thousand pieces"
  MY_SLAP << "throws some pointy lambdas at %s"
  MY_SLAP << "loves %s , so no slapping"
  MY_SLAP << "would never hurt %s !"
  MY_SLAP << "clobbers %s with an untyped language"
  MY_SLAP << "pulls %s through the Evil Mangler"
  MY_SLAP << "secretly deletes possesiveForm %s source code"
  MY_SLAP << "places her fist firmly on possesiveForm %s jaw"
  MY_SLAP << "locks up %s in a Monad"
  MY_SLAP << "submits possesiveForm %s email address to a dozen spam lists"
  MY_SLAP << "moulds %s into a delicous cookie, and places it in her oven"
  MY_SLAP << "will count to five..."
  MY_SLAP << "jabs %s with a C pointer"
  MY_SLAP << "is overcome by a sudden desire to hurt %s"
  MY_SLAP << "karate-chops %s into two equally sized halves"
  MY_SLAP << "pushes %s from his chair"
  MY_SLAP << "hits %s with an assortment of kitchen utensils"
  MY_SLAP << "slaps %s with a slab of concrete"
  MY_SLAP << "puts on her slapping gloves, and slaps %s"
  MY_SLAP << "decomposes %s into several parts using the Banach-Tarski theorem and reassembles them to get two copies of %s !"

  MSG_SLAP = []
  MSG_SLAP <<  "why on earth would I slap %s?"
  MSG_SLAP <<  "*SMACK*, *SLAM*, take that %s!"
  MSG_SLAP <<  "go slap %s yourself"
  MSG_SLAP <<  "I won't; I want to go get some cookies instead."
  MSG_SLAP <<  "I'd rather not; %s looks rather dangerous."
  MSG_SLAP <<  "I don't perform such side effects on command!"
  MSG_SLAP <<  "stop telling me what to do"
  MSG_SLAP <<  "Come on, let's all slap %s"
  MSG_SLAP <<  "%s, is it done yet?"

  listen_to :channel
  prefix /^@/
  match /slap (\w+)/, :method => :slap

  def slap(m,nick)
    if rand(2) == 1
      m.channel.action my_slap % nick
    else
      m.reply msg_slap % nick
    end
  end

  protected

  def my_slap
    MY_SLAP.sample
  end

  def msg_slap
    MSG_SLAP.sample
  end
end
