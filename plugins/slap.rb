module Slap
  SLAP = []
  SLAP << "%s, is it done yet?"
  SLAP << "slaps %s"
  SLAP << "smacks %s about with a large trout"
  SLAP << "beats up x"
  SLAP << "pokes %s in the eye"
  SLAP << "activates her slap-o-matic..."
  SLAP << "orders her trained monkeys to punch %s"
  SLAP << "smashes a lamp on possesiveForm %s head"
  SLAP << "hits %s with a hammer, so they breaks into a thousand pieces"
  SLAP << "throws some pointy lambdas at %s"
  SLAP << "loves %s , so no slapping"
  SLAP << "would never hurt %s !"
  SLAP << "clobbers %s with an untyped language"
  SLAP << "pulls %s through the Evil Mangler"
  SLAP << "secretly deletes possesiveForm %s source code"
  SLAP << "places her fist firmly on possesiveForm %s jaw"
  SLAP << "locks up %s in a Monad"
  SLAP << "submits possesiveForm %s email address to a dozen spam lists"
  SLAP << "moulds %s into a delicous cookie, and places it in her oven"
  SLAP << "will count to five..."
  SLAP << "jabs %s with a C pointer"
  SLAP << "is overcome by a sudden desire to hurt %s"
  SLAP << "karate-chops %s into two equally sized halves"
  SLAP << "pushes %s from his chair"
  SLAP << "hits %s with an assortment of kitchen utensils"
  SLAP << "slaps %s with a slab of concrete"
  SLAP << "puts on her slapping gloves, and slaps %s"
  SLAP << "decomposes %s into several parts using the Banach-Tarski theorem and reassembles them to get two copies of %s !"

  def self.slap(nick)
    SLAP.sample % nick
  end

end
